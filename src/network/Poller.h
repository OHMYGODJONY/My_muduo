#pragma once

#include "base/NonCopyable.h"
#include "base/TTime.h"

#include <vector>
#include <unordered_map>

namespace XS
{
    namespace network
    {
        class Channel;
        class EventLoop;

        class Poller : base::NonCopyable
        {
        public:
            using ChannelList = std::vector<Channel *>;

            Poller(EventLoop *loop);
            virtual ~Poller() = default;

            virtual base::TTime poll(int timeoutMs, ChannelList *activeChannels) = 0;
            virtual void updateChannel(Channel *channel) = 0;
            virtual void removeChannel(Channel *channel) = 0;

            bool hasChannel(Channel *channel) const;

            static Poller *newDefaultPoller(EventLoop *loop);

        protected:
            using ChannelMap = std::unordered_map<int, Channel *>;
            ChannelMap channels_;

        private:
            EventLoop *ownerLoop_; 
        };
    }
}

