#include "Channel.h"
#include "EventLoop.h"
#include "Logger.h"

#include <sys/epoll.h>

const int Channel::kNoneEvent_ = 0;
const int Channel::kReadEvent_ = EPOLLIN | EPOLLPRI;
const int Channel::kWriteEvent_ = EPOLLOUT;

Channel::Channel(EventLoop *loop, int fd) : loop_(loop), fd_(fd),
                                            events_(0), revents_(0), index_(-1), tied_(false) {}

Channel::~Channel() {}

// 弱指针管理共享指针,一个TcpConnection新连接创建的时候，调用tie方法，TcpConnection=》channel
void Channel::tie(const std::shared_ptr<void> &obj)
{
  tie_ = obj;
  tied_ = true;
}

// 当改变channel所表示fd的事件后，负责在poller里更改相应的事件
void Channel::update()
{
  // 通过channel所属的eventloop，调用poller的方法来调用相应方法，注册事件
  loop_->updateChannel(this);
}

// 在channel所属的eventloop中把当前的channel删除掉
void Channel::remove()
{
  // addcode...
  loop_->removeChannel(this);
}

void Channel::handleEvent(Timestamp receiveTime)
{
  if (tied_)
  {
    std::shared_ptr<void> gurad = tie_.lock();
    if (gurad)
    {
      handleEventWithGuard(receiveTime);
    }
  }
  else
  {
    handleEventWithGuard(receiveTime);
  }
}

// 根据poller通知的具体事件由channel来调用
void Channel::handleEventWithGuard(Timestamp receiveTime)
{
  LOG_INFO("channel handleEvent revents:%d\n", revents_);

  // 关闭
  if ((revents_ & EPOLLHUP) && !(revents_ & EPOLLIN))
  {
    if (closeCallback_)
    {
      closeCallback_();
    }
  }

  // 发生错误
  if (revents_ & EPOLLERR)
  {
    if (errorCallback_)
    {
      errorCallback_();
    }
  }

  // 读事件
  if (revents_ & (EPOLLIN | EPOLLPRI))
  {
    if (readCallback_)
    {
      readCallback_(receiveTime);
    }
  }

  // 写事件
  if (revents_ & EPOLLOUT)
  {
    if (writeCallback_)
    {
      writeCallback_();
    }
  }
}