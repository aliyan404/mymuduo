#include "EventLoopThreadPool.h"

EventLoopThreadPool::EventLoopThreadPool(EventLoop *baseloop, const std::string &nameArg)
    : baseloop_(baseloop),
      name_(nameArg),
      started_(false),
      numThreads_(0),
      next_(0)
{
}

EventLoopThreadPool::~EventLoopThreadPool() {} // 每个线程的loop都是局部变量栈上对象，出作用域自动销毁。

void EventLoopThreadPool::start(const ThreadInitCallback &cb)
{
  started_ = true;
  for (int i = 0; i < numThreads_; ++i)
  {
    char buf[name_.size() + 32];
    snprintf(buf, sizeof buf, "%s%d", name_.c_str(), i);
    EventLoopThread *t = new EventLoopThread(cb, buf);
    threads_.push_back(std::unique_ptr<EventLoopThread>(t));
    loops_.push_back(t->startLoop()); // 底层创建线程，绑定一个新的Eventloop并返回该loop地址
  }

  // 只有baseloop_
  if (numThreads_ == 0 && cb)
  {
    cb(baseloop_);
  }
}

// 如果工作在多线程中，baseLoop_默认以轮询的方式分配channel给subloop
EventLoop *EventLoopThreadPool::getNextLoop()
{
  EventLoop *loop = baseloop_;
  // 轮询方式获取下一个处理事件的loop
  if (loops_.empty())
  {
    loop = loops_[next_];
    ++next_;
    if (next_ >= loops_.size())
    {
      next_ = 0;
    }
  }

  return loop;
}

std::vector<EventLoop *> EventLoopThreadPool::getAllLoops()
{
  if (loops_.empty())
  {
    return std::vector<EventLoop *>(1, baseloop_);
  }
  else
  {
    return loops_;
  }
}