#pragma once

#include "Poller.h"

#include <vector>
#include <sys/epoll.h>

class EPollPoller : public Poller
{
public:
  EPollPoller(EventLoop *loop);
  ~EPollPoller() override;

  // epoll_wait
  Timestamp poll(int timeoutMs, ChannelList *activeChannels) override;

  // epoll_ctl
  void updateChannel(Channel *channel) override;
  void removeChannel(Channel *channel) override;

private:
  static const int kIntEvenetListSize = 16;

  // 填写活跃的连接
  void fillActiveChannels(int numEvents, ChannelList *activeChannels) const;
  // 更新channel通道
  void update(int operation, Channel *channel);

  using EventList = std::vector<epoll_event>;

  int epollfd_;
  EventList events_;
};