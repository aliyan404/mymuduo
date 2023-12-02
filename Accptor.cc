#include "Acceptor.h"
#include "Logger.h"
#include "InetAddress.h"

#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>

static int createNonblocking()
{
  int sockfd = ::socket(AF_INET, SOCK_STREAM | SOCK_NONBLOCK | SOCK_CLOEXEC, 0);
  if (sockfd < 0)
  {
    LOG_FATAL("%s:%s:%d listen socket create err:%d \n", __FILE__, __FUNCTION__, __LINE__, errno);
  }
  return sockfd;
}

Acceptor::Acceptor(EventLoop *loop, const InetAddress &listenAddr, bool reuseport)
    : loop_(loop),
      acceptSocket_(createNonblocking()), // 创建socket,创建了listenfd
      accpetChannel_(loop, acceptSocket_.fd()),
      listenning_(false)
{
  acceptSocket_.setReuseAddr(true);
  acceptSocket_.setReusePort(true);
  acceptSocket_.bindAddress(listenAddr); // bind
  // TcpServer::start() Accpetor.listen 有新用户连接，执行回调将connfd=》channel=》subloop
  accpetChannel_.setReadCallback(std::bind(&Acceptor::handleRead, this));
}

Acceptor::~Acceptor()
{
  accpetChannel_.disableAll();
  accpetChannel_.remove();
}

void Acceptor::listen()
{
  listenning_ = true;
  acceptSocket_.listen();         // listen
  accpetChannel_.enableReading(); // accpetChannel_注册到poller里面,让poller监听是否有事件发生
}

// listenfd有事件发生了，有新用户连接了
void Acceptor::handleRead()
{
  InetAddress peerAddr;
  int connfd = acceptSocket_.accept(&peerAddr);
  if (connfd >= 0)
  {
    if (newConnectionCallback_)
    {
      newConnectionCallback_(connfd, peerAddr); // Tcp的回调，轮询找到subloop，唤醒分发新客户端的Channel（包含connfd）
    }
    else
    {
      ::close(connfd);
    }
  }
  else
  {
    LOG_ERROR("%s:%s:%d accpet err:%d \n", __FILE__, __FUNCTION__, __LINE__, errno);
    // fd数量已经达到上限
    if (errno == EMFILE)
    {
      LOG_ERROR("%s:%s:%d socket reached limit! \n", __FILE__, __FUNCTION__, __LINE__);
    }
  }
}