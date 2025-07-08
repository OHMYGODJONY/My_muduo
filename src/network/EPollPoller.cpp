#include "EPollPoller.h"
#include "Network.h"
#include "Channel.h"

#include <errno.h>
#include <unistd.h>
#include <string.h>

using namespace XS::network;

const int kNew = -1;    // 某个channel还没添加至Poller          // channel的成员index_初始化为-1
const int kAdded = 1;   // 某个channel已经添加至Poller
const int kDeleted = 2; // 某个channel已经无感兴趣事件，已经从Poller删除

EPollPoller::EPollPoller(EventLoop *loop)
    : Poller(loop)
    , epollfd_(::epoll_create1(EPOLL_CLOEXEC)) 
    , events_(kInitEventListSize)
{
    if (epollfd_ < 0)
    {
        LOG_ERROR << "epoll_create error: " << errno;
        exit(-1);
    }
}

EPollPoller::~EPollPoller()
{
    ::close(epollfd_);
}

XS::base::TTime EPollPoller::poll(int timeoutMs, ChannelList *activeChannels)
{
    NETWORK_DEBUG << "fd total count: " <<  channels_.size();

    int numEvents = ::epoll_wait(epollfd_, &*events_.begin(), static_cast<int>(events_.size()), timeoutMs);
    int saveErrno = errno;
    base::TTime now(base::TTime::now());

    if (numEvents > 0)
    {
        NETWORK_DEBUG << numEvents <<" events happend!!!";
        fillActiveChannels(numEvents, activeChannels);
        if (numEvents == events_.size())
        {
            events_.resize(events_.size() * 2);
        }
    }
    else if (numEvents == 0)
    {
        NETWORK_DEBUG << " timeout!";
    }
    else
    {
        if (saveErrno != EINTR)
        {
            errno = saveErrno;
            NETWORK_ERROR << "EPollPoller::poll() error!";
        }
    }
    return now;
}

void EPollPoller::updateChannel(Channel *channel)
{
    const int index = channel->index();
    NETWORK_INFO << "update fd= " << channel->fd() << " events= " << channel->events() << " index= "  << index;

    if (index == kNew || index == kDeleted)
    {
        if (index == kNew)
        {
            int fd = channel->fd();
            channels_[fd] = channel;
        }
        else
        {
            //kDeleted状态数据并没有在channels_中删除，直接修改状态并注册到epoll中即可
        }
        channel->set_index(kAdded);
        update(EPOLL_CTL_ADD, channel);
    }
    else // channel已经在Poller中注册过了
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

void EPollPoller::removeChannel(Channel *channel)
{
    int fd = channel->fd();
    channels_.erase(fd);

    NETWORK_INFO << "remove fd= " << fd;

    int index = channel->index();
    if (index == kAdded)
    {
        update(EPOLL_CTL_DEL, channel);
    }
    channel->set_index(kNew);
}

void EPollPoller::fillActiveChannels(int numEvents, ChannelList *activeChannels) const
{
    for (int i = 0; i < numEvents; ++i)
    {
        Channel *channel = static_cast<Channel *>(events_[i].data.ptr);
        channel->set_revents(events_[i].events);
        activeChannels->push_back(channel);
    }
}

void EPollPoller::update(int operation, Channel *channel)
{
    epoll_event event;
    ::memset(&event, 0, sizeof(event));

    int fd = channel->fd();

    event.events = channel->events();
    event.data.fd = fd;
    event.data.ptr = channel;

    if (::epoll_ctl(epollfd_, operation, fd, &event) < 0)
    {
        if (operation == EPOLL_CTL_DEL)
        {
            NETWORK_ERROR << "epoll_ctl del error: " << errno;
        }
        else
        {
            NETWORK_ERROR << "epoll_ctl add/mod error: " << errno;
            exit(-1);
        }
    }
}