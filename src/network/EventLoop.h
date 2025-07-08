#pragma once

#include "base/NonCopyable.h"
#include "base/TTime.h"
#include "CurrentThread.h"
#include "TimingWheel.h"

#include <functional>
#include <vector>
#include <atomic>
#include <memory>
#include <mutex>

namespace XS
{
    namespace network
    {
        class Channel;
        class Poller;

        class EventLoop : base::NonCopyable
        {
        public:
            using Functor = std::function<void()>;

            EventLoop();
            ~EventLoop();

            void loop();
            void quit();

            base::TTime pollReturnTime() const { return pollRetureTime_; }

            void runInLoop(Functor cb);
            void queueInLoop(Functor cb);

            void wakeup();

            void updateChannel(Channel *channel);
            void removeChannel(Channel *channel);
            bool hasChannel(Channel *channel);

            bool isInLoopThread() const { return threadId_ == CurrentThread::tid(); }

            void InsertEntry(uint32_t delay, EntryPtr entryPtr);
            void RunAfter(double delay, const Func &cb);
            void RunAfter(double delay, Func &&cb);
            void RunEvery(double interval, const Func &cb);
            void RunEvery(double interval, Func &&cb);

        private:
            void handleRead();
            void doPendingFunctors();

            using ChannelList = std::vector<Channel *>;

            std::atomic_bool looping_;
            std::atomic_bool quit_;

            const pid_t threadId_;
            
            base::TTime pollRetureTime_;
            std::unique_ptr<Poller> poller_;
            
            int wakeupFd_;
            std::unique_ptr<Channel> wakeupChannel_;
            
            ChannelList activeChannels_;
            
            std::atomic_bool callingPendingFunctors_;
            std::vector<Functor> pendingFunctors_;
            std::mutex mutex_;

            TimingWheel wheel_;
        };
    }
}

