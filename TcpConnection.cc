#include "TcpConnection.h"
#include "Logger.h"
#include "Socket.h"
#include "Channel.h"
#include "EventLoop.h"

#include <functional>
#include <errno.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/tcp.h>
#include <string.h>

// 判断构造函数传入的loop是否为空
static EventLoop *CheckLoopNotNull(EventLoop *loop)
{
  if (loop == nullptr)
  {
    LOG_FATAL("%s:%s:%d mainloop is null!\n", __FILE__, __FUNCTION__, __LINE__);
  }
  return loop;
}

TcpConnection::TcpConnection(EventLoop *loop,
                             const std::string &nameArg,
                             int sockfd,
                             const InetAddress &localAddr,
                             const InetAddress &peerAddr)
    : loop_(CheckLoopNotNull(loop)),
      name_(nameArg),
      state_(kConnecting),
      reading_(true),
      socket_(new Socket(sockfd)),
      channel_(new Channel(loop, sockfd)),
      localAddr_(localAddr),
      peerAddr_(peerAddr),
      highWaterMark_(64 * 1024 * 1024) // 64M高水位控制收发速度

{
  // 给channel设置相应回调，poller监听到channel感兴趣的事件发生了，channel会回调相应的操作函数
  channel_->setReadCallback(std::bind(&TcpConnection::handleRead, this, std::placeholders::_1));
  channel_->setWriteCallback(std::bind(&TcpConnection::handleWrite, this));
  channel_->setCloseCallback(std::bind(&TcpConnection::handleClose, this));
  channel_->setErrorCallback(std::bind(&TcpConnection::handleError, this));
  LOG_INFO("TcpConnection::ctor[%s] at fd=%d \n", name_.c_str(), sockfd);
  socket_->setKeepAlive(true);
}

TcpConnection::~TcpConnection()
{
  LOG_INFO("TcpConnection::dtor[%s] at fd=%d state=%d\n", name_.c_str(), channel_->fd(), (int)state_);
}

void TcpConnection::handleRead(Timestamp recevieTime)
{
  int savedErrno = 0;
  ssize_t n = inputBuffer_.readFd(channel_->fd(), &savedErrno);
  if (n > 0)
  {
    // 已建立连接的用户有可读事件发生了，调用用户传入的onMessage
    messageCallback_(shared_from_this(), &inputBuffer_, recevieTime);
  }
  else if (n == 0)
  {
    // 断开
    handleClose();
  }
  else
  {
    // 出错
    savedErrno = errno;
    LOG_ERROR("TcpConnection::handlRead");
    handleError();
  }
}

void TcpConnection::handleWrite()
{
  int savedErrno = 0;
  if (channel_->isWriting())
  {
    ssize_t n = outputBuffer_.writeFd(channel_->fd(), &savedErrno);
    if (n > 0)
    {
      outputBuffer_.retrieve(n);
      if (outputBuffer_.readableBytes() == 0)
      {
        // 数据发送完后变为不可写
        channel_->disableReading();
        if (writeCompleteCallback_)
        {
          // 唤醒loop对应的thread线程，执行回调
          loop_->queueInLoop(
              std::bind(writeCompleteCallback_, shared_from_this()));
        }
      }
      if (state_ == kDisconnecting)
      {
        shutdownInLoop();
      }
    }
    else
    {
      LOG_ERROR("TcpConnection::handleWrite");
    }
  }
  else
  {
    LOG_ERROR("TcpConnection fd=%d is down, no more writing \n", channel_->fd());
  }
}

// poller=》channel::closeCallback=》TcpConnection::handleClose
void TcpConnection::handleClose()
{
  LOG_INFO("fd=%d state=%d \n", channel_->fd(), (int)state_);
  setState(kDisconnected);
  channel_->disableAll();

  TcpConnectionPtr connPtr(shared_from_this());
  connectionCallback_(connPtr); // 执行连接关闭的回调
  closeCallback_(connPtr);      // 关闭连接的回调,执行的是TcpServer::removeConnection
}
void TcpConnection::handleError()
{
  int optval;
  socklen_t optlen = sizeof optval;
  int err = 0;
  if (::getsockopt(channel_->fd(), SOL_SOCKET, SO_ERROR, &optval, &optlen) < 0)
  {
    err = errno;
  }
  else
  {
    err = optval;
  }
  LOG_ERROR("TcpConnection::handleError name:%s -SO_ERROR:%d \n", name_.c_str(), err);
}

void TcpConnection::send(const std::string &buf)
{
  if (state_ == kConnected)
  {
    if (loop_->isInLoopThread())
    {
      sendInLoop(buf.c_str(), buf.size());
    }
    else
    {

      loop_->runInLoop(std::bind(
          &TcpConnection::sendInLoop,
          this,
          buf.c_str(),
          buf.size()));
    }
  }
}

/**
 * 发送数据，应用写的快，而内核发送的慢，需要把发送数据写入缓冲区，而且设置了水位回调
 */
void TcpConnection::sendInLoop(const void *data, size_t len)
{
  ssize_t nwrote = 0;
  size_t remaining = 0;
  bool faultError = false;

  // 之前调用过Connection的shutdown，不能再发送了
  if (state_ == kDisconnected)
  {
    LOG_ERROR("disconnected, give up writing!");
    return;
  }

  // 表示channel_第一次开始写数据（最开始对读事件不感兴趣），而且缓冲区没有待发送数据
  if (!channel_->isWriting() && outputBuffer_.readableBytes() == 0)
  {
    nwrote = ::write(channel_->fd(), data, len);
    if (nwrote >= 0)
    {
      remaining = len - nwrote;
      if (remaining == 0 && writeCompleteCallback_)
      {
        // 数据全部发送完成，就不用再给channel设置epollout事件了
        loop_->queueInLoop(
            std::bind(writeCompleteCallback_, shared_from_this()));
      }
    }
    else
    {
      // 出错 nworte<0
      nwrote = 0;
      if (errno != EWOULDBLOCK)
      {
        LOG_ERROR("TcpConnection::sendInLoop");
        if (errno == EPIPE || errno == ECONNRESET) // SIGIPE RESET，收到连接重置的错误请求
        {
          faultError = true;
        }
      }
    }
  }

  // 说明当前这一次write并未把数据全部发送出去，剩余的要保存到outbuffer缓冲区，给channel注册epollout事件
  // poller发现Tcp的发送缓冲区有空间（可写事件），会通知相应的sock-channel调用writeCallback_回调方法
  // 也就是调用TcpConnection::handdleWrite方法，把发送缓冲区的数据全部发送完成
  if (!faultError && remaining > 0)
  {
    // 目前发送缓冲区剩余的待发送数据的长度
    size_t oldlen = outputBuffer_.readableBytes();
    if (oldlen + remaining >= highWaterMark_ && oldlen < highWaterMark_ && highWaterMark_)
    {
      loop_->queueInLoop(
          std::bind(highWaterMarkCallback_, shared_from_this(), oldlen + remaining));
    }

    outputBuffer_.append((char *)data + nwrote, remaining);
    if (!channel_->isWriting())
    {
      channel_->enableWriting(); // 这里一定要注册channel的写事件
    }
  }
}

// 连接建立
void TcpConnection::connectEstablised()
{
  setState(kConnected);
  channel_->tie(shared_from_this());
  channel_->enableReading(); // 向poller注册channel的读事件

  // 新连接建立，执行回调
  connectionCallback_(shared_from_this());
}

// 连接销毁
void TcpConnection::connectDestroyed()
{
  if (state_ == kConnected)
  {
    setState(kDisconnected);
    {
      channel_->disableAll(); // del掉channel所有感兴趣的事件
    }
  }
  channel_->remove(); // channel从poller中删除掉
}

// 关闭连接
void TcpConnection::shutdown()
{
  if (state_ == kConnected)
  {
    setState(kDisconnecting);
    loop_->runInLoop(
        std::bind(&TcpConnection::shutdownInLoop, this));
  }
}

void TcpConnection::shutdownInLoop()
{
  if (!channel_->isWriting()) // 说明当前outputbuffer已经全部发送完成
  {
    socket_->shutdownWrite(); // 关闭写端
  }
}