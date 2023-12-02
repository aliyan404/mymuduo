#include "EPollPoller.h"
#include "Logger.h"
#include "Channel.h"

#include <error.h>
#include <unistd.h>
#include <string.h>

const int kNew = -1; // channel index_成员初始化也为-1
const int kAdded = 1;
const int kDeleted = 2;

EPollPoller::EPollPoller(EventLoop *loop) : Poller(loop),
                                            epollfd_(::epoll_create1(EPOLL_CLOEXEC)),
                                            events_(kIntEvenetListSize)
{
  if (epollfd_ < 0)
  {
    LOG_FATAL("epoll_create error:%d \n", errno);
  }
}

EPollPoller::~EPollPoller()
{
  ::close(epollfd_);
}

// 返回epoll_wait发生事件的channel集合，返回给EventLoop
Timestamp EPollPoller::poll(int timeoutMs, ChannelList *activeChannels)
{
  // 实际上应该用logdebug输出更加合理
  LOG_INFO("func=%s => fd total count:%lu\n", __FUNCTION__, channels_.size());

  int numEvents = epoll_wait(epollfd_, &*events_.begin(), static_cast<int>(events_.size()), timeoutMs);
  int saveErrno = errno;
  Timestamp now(Timestamp::now());

  if (numEvents > 0)
  {
    LOG_INFO("%d events happened \n", numEvents);
    fillActiveChannels(numEvents, activeChannels);
    // 扩容操作
    // LT模式，未包含的发生事件会在下一次再处理
    if (numEvents == events_.size())
    {
      events_.resize(events_.size() * 2);
    }
  }
  else if (numEvents == 0)
  {
    // 超时无事发生
    LOG_DEBUG("%s timeout", __FUNCTION__);
  }
  else
  {
    if (saveErrno != EINTR)
    {
      errno = saveErrno; // 使全局errno重置为当前poll的saveErrno，避免中间改变过此全局errno
      LOG_ERROR("EPOllPoller::poller() err!");
    }
  }
  return now;
}
// epoll_ctl
void EPollPoller::updateChannel(Channel *channel)
{
  const int index = channel->index();
  LOG_INFO("func=%s => fd=%d events=%d index=%d \n", __FUNCTION__, channel->fd(), channel->events(), index);
  if (index == kNew || index == kDeleted)
  {
    if (index == kNew)
    {
      int fd = channel->fd();
      channels_[fd] = channel;
    }
    channel->set_index(kAdded);
    update(EPOLL_CTL_ADD, channel);
  }
  else // channel仍在poller中注册的状态
  {
    int fd = channel->fd();
    if (channel->isNoneEvent())
    {
      update(EPOLL_CTL_DEL, channel);
      channel->set_index(kDeleted);
    }
    else
    {
      update(EPOLL_CTL_MOD, channel);
    }
  }
}

// 从poller中删除channel
void EPollPoller::removeChannel(Channel *channel)
{
  int fd = channel->fd();
  channels_.erase(fd);

  LOG_INFO("func=%s => fd=%d\n", __FUNCTION__, fd);

  int index = channel->index();
  if (index == kAdded)
  {
    update(EPOLL_CTL_DEL, channel);
  }
  channel->set_index(kNew);
}

// 填写活跃的连接
void EPollPoller::fillActiveChannels(int numEvents, ChannelList *activeChannels) const
{
  for (int i = 0; i < numEvents; ++i)
  {
    Channel *channel = static_cast<Channel *>(events_[i].data.ptr);
    channel->set_revents(events_[i].events);
    activeChannels->push_back(channel); // EventLoop就拿到了poller给它返回的所有发生事件的channel
  }
}

// 更新channel通道
void EPollPoller::update(int operation, Channel *channel)
{
  epoll_event event;
  memset(&event, 0, sizeof event);

  int fd = channel->fd();

  event.events = channel->events();
  event.data.fd = fd;
  event.data.ptr = channel;

  if (::epoll_ctl(epollfd_, operation, fd, &event) < 0)
  {
    // 删除出错
    if (operation == EPOLL_CTL_DEL)
    {
      LOG_ERROR("epoll_ctl del error:%d\n", errno);
    }
    else
    // 添加/修改出错
    {
      LOG_FATAL("epoll_ctl add/mod error:%d\n", errno);
    }
  }
}