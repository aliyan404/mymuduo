#include "EventLoop.h"
#include "Logger.h"
#include "Poller.h"
#include "Channel.h"

#include <sys/eventfd.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <memory>

// 防止一个线程创建多个EventLoop  __thread->thread_local,每个线程里都有该全局变量的副本
__thread EventLoop *t_loopInThisThread_ = nullptr;

// 定义默认的Poller的超时时间，10s
const int kPollTimeMs = 10000;

// 创建wakeupfd，用来notify唤醒subReactor处理先来的Channel
int createEventfd()
{
  int evtfd = ::eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC);
  if (evtfd < 0)
  {
    LOG_FATAL("eventfd error:%d \n", errno);
  }
  return evtfd;
}

EventLoop::EventLoop()
    : looping_(false),
      quit_(false),
      callingPendingFunctors_(false),
      threadId_(CurrentThread::tid()),
      poller_(Poller::newDefaultPoller(this)),
      wakeupFd_(createEventfd()),
      wakeupChannel_(new Channel(this, wakeupFd_))
{
  LOG_DEBUG("EventLoop created %p in thread %d\n", this, threadId_);
  if (t_loopInThisThread_)
  {
    LOG_FATAL("Another EventLoop %p exists in this thread %d \n", t_loopInThisThread_, threadId_);
  }
  else
  {
    // 第一次创建时直接赋值
    t_loopInThisThread_ = this;
  }

  // 设置wakeupfd的事件类型以及发生事件后的回调操作(唤醒subloop)
  wakeupChannel_->setReadCallback(std::bind(&EventLoop::handleRead, this));
  // 每一个eventloop都将监听wakeupchannel的EPOLLIN的读事件了
  wakeupChannel_->enableReading();
}

EventLoop::~EventLoop()
{
  wakeupChannel_->disableAll();
  wakeupChannel_->remove();
  ::close(wakeupFd_);
  t_loopInThisThread_ = nullptr;
}

void EventLoop::handleRead()
{
  uint64_t one = 1;
  ssize_t n = read(wakeupFd_, &one, sizeof one);
  if (n != sizeof one)
  {
    LOG_ERROR("EventLoop::handleRead() reads %d bytes instead of 8\n", n);
  }
}

// 开启事件循环
void EventLoop::loop()
{
  looping_ = true;
  quit_ = false;

  LOG_INFO("EventLoop %p start looping \n", this);

  while (!quit_)
  {
    activeChannels_.clear();
    // 监听两类fd，一种是clientfd,一种是wakeupfd
    pollReturnTime_ = poller_->poll(kPollTimeMs, &activeChannels_);

    for (Channel *channel : activeChannels_)
    {
      // Poller能够监听哪些channel发生事件，上报给EventLoop
      channel->handleEvent(pollReturnTime_);
    }
    // 执行当前EventLoop事件循环需要处理的回调操作
    // mianloop事先注册一个回调cb,需要一个subloop来执行
    // wake up subloop后执行之前mianloop注册的cb
    doPendingFunctors();
  }

  LOG_INFO("EventLoop %p stop looping.\n", this);
  looping_ = false;
}

// 退出事件循环
// 1.loop在自己线程中调用quit
void EventLoop::quit()
{
  quit_ = true;
  if (!isInLoopThread()) // 2.在非loop的线程中调用loop的quit，例如subloop调用mainloop的quit
  {
    wakeup(); // 先唤醒执行完最后一轮循环再退出
  }
}

// 在当前loop中执行cb
void EventLoop::runInLoop(Functor cb)
{
  if (isInLoopThread()) // 在当前的loop线程中执行cb
  {
    cb();
  }
  else
  {
    // 在非当前loop线程中执行cb，需要唤醒loop所在线程中执行cb
    queueInLoop(cb);
  }
}

// 把cb放入队列中，唤醒loop所在线程，执行cb
void EventLoop::queueInLoop(Functor cb)
{
  {
    std::unique_lock<std::mutex> lock(mutex_);
    pendingFunctors_.emplace_back(cb);
  }

  // 唤醒相应的loop所在线程
  //||callingPendingFunctors_的意思是，当前loop正在执行回调，但是loop又有了新的回调，在其执行完上次回调后，再次唤醒执行新的回调
  if (!isInLoopThread() || callingPendingFunctors_)
  {
    wakeup();
  }
}

// 用来唤醒loop所在的线程,向wakupfd_写一个数据,使其有数据可读发生读事件，也就是唤醒
void EventLoop::wakeup()
{
  uint64_t one = 1;
  ssize_t n = write(wakeupFd_, &one, sizeof one);
  if (n != sizeof one)
  {
    LOG_ERROR("EventLoop::wakeup() writes %lu bytes instead of 8\n", n);
  }
}

// eventloop调用loop的方法
void EventLoop::updateChannel(Channel *channel)
{
  poller_->updateChannel(channel);
}
void EventLoop::removeChannel(Channel *channel)
{
  poller_->removeChannel(channel);
}
bool EventLoop::hasChannel(Channel *channel)
{
  return poller_->hasChannel(channel);
}

// 执行回调
void EventLoop::doPendingFunctors()
{
  std::vector<Functor> functors;
  callingPendingFunctors_ = true;

  {
    std::unique_lock<std::mutex> lock(mutex_);
    // 将pendingFunctors与局部变量交换后置空，方便其他loop继续往其里面添加cb
    functors.swap(pendingFunctors_);
  }

  for (const Functor &functor : functors)
  {
    functor(); // 执行当前loop需要执行的回调操作
  }

  callingPendingFunctors_ = false;
}
