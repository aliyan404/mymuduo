#pragma once

#include "noncopyable.h"
#include "Timestamp.h"

#include <functional>
#include <memory>

class EventLoop;

class Channel : noncopyable
{
public:
  // 取别名
  using EventCallback = std::function<void()>;
  using ReadCallback = std::function<void(Timestamp)>;

  Channel(EventLoop *loop, int fd);
  ~Channel();

  // fd得到poller通知后，处理事件的，调用相应的回调方法
  void handleEvent(Timestamp receiveTime);

  // 设置回调函数对象
  void setReadCallback(ReadCallback cb) { readCallback_ = std::move(cb); }
  void setWriteCallback(EventCallback cb) { writeCallback_ = std::move(cb); }
  void setCloseCallback(EventCallback cb) { closeCallback_ = std::move(cb); }
  void setErrorCallback(EventCallback cb) { errorCallback_ = std::move(cb); }

  // 防止channel被手动remove掉，channel还在执行回调操作
  void tie(const std::shared_ptr<void> &);

  int fd() const { return fd_; }
  int events() const { return events_; }
  void set_revents(int revt) { revents_ = revt; }

  // 设置fd相应的事件状态
  void enableReading()
  {
    events_ |= kReadEvent_;
    update();
  }
  void disableReading()
  {
    events_ &= ~kReadEvent_;
    update();
  }
  void enableWriting()
  {
    events_ |= kWriteEvent_;
    update();
  }
  void disableWriting()
  {
    events_ &= ~kWriteEvent_;
    update();
  }
  void disableAll()
  {
    events_ |= kNoneEvent_;
    update();
  }

  // 返回fd当前的事件状态
  bool isNoneEvent() const { return events_ == kNoneEvent_; }
  bool isWriting() const { return events_ & kWriteEvent_; }
  bool isReading() const { return events_ & kReadEvent_; }

  // For Poller
  int index() { return index_; }
  void set_index(int idx) { index_ = idx; }

  // 此channel的poller
  EventLoop *ownerLoop() { return loop_; }
  void remove(); // 删除channel

private:
  void update();
  void handleEventWithGuard(Timestamp receiveTime);

  static const int kNoneEvent_;
  static const int kReadEvent_;
  static const int kWriteEvent_;

  EventLoop *loop_; // 事件循环
  const int fd_;    // fd,Poller监听的对象
  int events_;      // 注册fd感兴趣的事件
  int revents_;     // poller返回具体发生的事件
  int index_;       // channel在poller中的状态，-1为未添加，1为已添加，2为删除

  std::weak_ptr<void> tie_;
  bool tied_;

  // 事件回调,channel里可以获得fd最终发生具体的事件revents，所以负责调用具体事件的回调操作。
  ReadCallback readCallback_;
  EventCallback writeCallback_;
  EventCallback closeCallback_;
  EventCallback errorCallback_;
};
