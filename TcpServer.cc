#include "TcpServer.h"
#include "Logger.h"

#include <string.h>

// 判断构造函数传入的loop是否为空
EventLoop *CheckLoopNotNull(EventLoop *loop)
{
  if (loop == nullptr)
  {
    LOG_FATAL("%s:%s:%d mainloop is null!\n", __FILE__, __FUNCTION__, __LINE__);
  }
  return loop;
}

TcpServer::TcpServer(EventLoop *loop, const InetAddress &listenAddr, const std::string &nameArg, Option option)
    : loop_(CheckLoopNotNull(loop)),
      ipPort_(listenAddr.toIpPort()),
      name_(nameArg),
      acceptor_(new Acceptor(loop, listenAddr, option == kReusePort)),
      threadPool_(new EventLoopThreadPool(loop, name_)),
      connectionCallback_(),
      messageCallback_(),
      nextConnId_(1),
      started_(0)
{
  // 当有新用户连接时，会执行TcpServer：：newConnction（）回调
  acceptor_->setNewConnectionCallback(std::bind(&TcpServer::newConnection,
                                                this, std::placeholders::_1, std::placeholders::_2));
}

TcpServer::~TcpServer()
{
  for (auto &item : connections_)
  {
    TcpConnectionPtr conn(item.second); // 这个局部的shared_ptr出右括号可以自动释放new出来的TcpConnection对象资源
    item.second.reset();

    // 销毁连接
    conn->getLoop()->runInLoop(
        std::bind(&TcpConnection::connectDestroyed, conn));
  }
}

// 设置底层subloop的个数
void TcpServer::setThreadNum(int numThreads)
{
  threadPool_->setThreadNum(numThreads);
}

// 开启服务器监听
void TcpServer::start()
{
  if (started_++ == 0) // 防止一个TcpServer对象被启动多次
  {
    threadPool_->start(threadInitCallback_); // 启动底层的loop线程池
    loop_->runInLoop(std::bind(&Acceptor::listen, acceptor_.get()));
  }
}

// 有一个新的客户端的连接，acceptor会执行这个回调操作
void TcpServer::newConnection(int sockfd, const InetAddress &peerAddr)
{
  // 轮询选择一个subLoop来管理channel
  EventLoop *ioLoop = threadPool_->getNextLoop();
  char buf[64] = {0};
  snprintf(buf, sizeof buf, "-%s#%d", ipPort_.c_str(), nextConnId_);
  ++nextConnId_;
  std::string connName = name_ + buf;

  LOG_INFO("TcpConnection::newConnection [%s] - new connection [%s] from %s \n",
           name_.c_str(), connName.c_str(), peerAddr.toIpPort().c_str());

  // 通过sockfd获取其绑定的本机的IP地址和端口号信息
  sockaddr_in local;
  memset(&local, 0, sizeof local);
  socklen_t addrlen = sizeof local;
  if (::getsockname(sockfd, (sockaddr *)&local, &addrlen) < 0)
  {
    LOG_ERROR("sockets::getLocalAddr");
  }
  InetAddress localAddr(local);

  // 根据连接成功的sockfd,创建TcpConnection连接对象
  TcpConnectionPtr conn(new TcpConnection(
      ioLoop,
      connName,
      sockfd, // socket,channel
      localAddr,
      peerAddr));

  connections_[connName] = conn;
  // 下面的回调都是用户设置给TcpServer=》TcpConnection=》channel=》注册到poller=》notify channel调用回调
  conn->setConnectionCallback(connectionCallback_);
  conn->setMessageCallback(messageCallback_);
  conn->setWriteCompleteCallback(writeCompleteCallback_);

  // 设置了如何关闭连接的回调，conn-》shutdown
  conn->setCloseCallback(
      std::bind(&TcpServer::removeConnection, this, std::placeholders::_1));

  // 直接调用&TcpConnection::connectEstablised
  ioLoop->runInLoop(std::bind(&TcpConnection::connectEstablised, conn));
}

void TcpServer::removeConnection(const TcpConnectionPtr &conn)
{
  // mainLoop
  loop_->runInLoop(
      std::bind(&TcpServer::removeConnectionInLoop, this, conn));
}

void TcpServer::removeConnectionInLoop(const TcpConnectionPtr &conn)
{
  LOG_INFO("TcpServer::removeConnectionInLoop [%s] - connection %s \n",
           name_.c_str(), conn->name().c_str());

  // 在mainloop的map中删除对应的连接
  connections_.erase(conn->name());

  // 再去对应的ioloop中执行对应的连接销毁函数
  EventLoop *ioLoop = conn->getLoop();
  ioLoop->queueInLoop(
      std::bind(&TcpConnection::connectDestroyed, conn));
}