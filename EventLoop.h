#pragma once

#include <functional>
#include <vector>
#include <atomic>
#include <memory>
#include <mutex>

#include "noncopyable.h"
#include "Timestamp.h"
#include "CurrentThread.h"

class Channel;
class Poller;

// 事件循环类，主要包括两大模块，Channel、Poller(epoll的抽象)

class EventLoop
{
public:
  using Functor = std::function<void()>;

  EventLoop();
  ~EventLoop();

  // 开启事件循环
  void loop();
  // 退出事件循环
  void quit();

  Timestamp pollReturnTime() const { return pollReturnTime_; }

  // 在当前loop中执行
  void runInLoop(Functor cb);
  // 把cb放入队列中，唤醒loop所在的线程执行cb
  void queueInLoop(Functor cb);

  // 用来唤醒loop所在的线程
  void wakeup();

  // eventloop调用loop的方法
  void updateChannel(Channel *channel);
  void removeChannel(Channel *channel);
  bool hasChannel(Channel *channel);

  // 判断eventloop是否在自己的线程里面
  bool isInLoopThread() const { return threadId_ == CurrentThread::tid(); }

private:
  void handleRead();        // 唤醒
  void doPendingFunctors(); // 执行回调

  using ChannelList = std::vector<Channel *>;
  std::atomic_bool looping_; // 原子操作，底层通过CAS实现
  std::atomic_bool quit_;    // 标志退出loop循环

  const pid_t threadId_; // 记录当前loop所在线程的id

  Timestamp pollReturnTime_; // 返回发生事件的channels的时间点
  std::unique_ptr<Poller> poller_;

  int wakeupFd_; // 主要作用是当mainLoop获取一个新用户channel，通过轮询算法选择一个subLoop
  std::unique_ptr<Channel> wakeupChannel_;

  ChannelList activeChannels_;

  std::atomic_bool callingPendingFunctors_; // 标识当前loop是否有需要执行的回调操作
  std::vector<Functor> pendingFunctors_;    // 存储loop需要执行的所有回调操作
  std::mutex mutex_;                        // 互斥锁用来保护上面vector的线程安全操作
};