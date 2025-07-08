#pragma once

#include "base/NonCopyable.h"
#include "Thread.h"

#include <functional>
#include <mutex>
#include <condition_variable>
#include <string>

namespace XS
{
    namespace network
    {
        class EventLoop;

        class EventLoopThread : base::NonCopyable
        {
        public:
            using ThreadInitCallback = std::function<void(EventLoop *)>;

            EventLoopThread(const ThreadInitCallback &cb = ThreadInitCallback(),
                            const std::string &name = std::string());
            ~EventLoopThread();

            EventLoop *startLoop();

        private:
            void threadFunc();

            EventLoop *loop_;
            bool exiting_;
            Thread thread_;
            std::mutex mutex_;             // 互斥锁
            std::condition_variable cond_; // 条件变量
            ThreadInitCallback callback_;
        };
    }
}

