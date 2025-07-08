#pragma once

#include "Poller.h"
#include "base/TTime.h"

#include <vector>
#include <sys/epoll.h>

namespace XS
{
    namespace network
    {
        class Channel;

        class EPollPoller : public Poller
        {
        public:
            EPollPoller(EventLoop *loop);
            ~EPollPoller() override;

            base::TTime poll(int timeoutMs, ChannelList *activeChannels) override;
            void updateChannel(Channel *channel) override;
            void removeChannel(Channel *channel) override;

        private:
            static const int kInitEventListSize = 16;

            void fillActiveChannels(int numEvents, ChannelList *activeChannels) const;
            void update(int operation, Channel *channel);

            using EventList = std::vector<epoll_event>;

            int epollfd_;
            EventList events_; 
        };
    }
}
