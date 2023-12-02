#pragma once

#include "noncopyable.h"
#include "Timestamp.h"

#include <vector>
#include <unordered_map>

class Channel;
class EventLoop;
// muduo中多路事件分发器的核心io复用模块
class Poller : noncopyable
{
public:
  using ChannelList = std::vector<Channel *>;

  Poller(EventLoop *loop);
  virtual ~Poller() = default;

  // 保留IO复用统一接口
  virtual Timestamp poll(int timeoutMs, ChannelList *activeChannels) = 0;
  virtual void updateChannel(Channel *Channel) = 0;
  virtual void removeChannel(Channel *channel) = 0;

  // 判断channel是否在当前poller当中
  bool hasChannel(Channel *channel) const;

  // eventLoop事件循环可根据该接口获取IO复用的具体实现
  static Poller *newDefaultPoller(EventLoop *loop);

protected:
  // map的key：scokfd  value: scokfd对应的channel
  using ChannelMap = std::unordered_map<int, Channel *>;
  ChannelMap channels_;

private:
  EventLoop *owenrLoop_; // 自身所属事件循环
};