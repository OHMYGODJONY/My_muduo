#pragma once

#include "base/NonCopyable.h"
#include "base/TTime.h"

#include <functional>
#include <memory>

namespace XS
{
    namespace network
    {
        class EventLoop;

        class Channel: base::NonCopyable
        {
        public:
            using EventCallback = std::function<void()>;
            using ReadEventCallback = std::function<void(base::TTime)>;

            Channel(EventLoop *loop, int fd);
            ~Channel() = default;

            void handleEvent(base::TTime receiveTime);

            void setReadCallback(const ReadEventCallback &cb) { readCallback_ = cb; }
            void setWriteCallback(const EventCallback &cb) { writeCallback_ = cb; }
            void setCloseCallback(const EventCallback &cb) { closeCallback_ = cb; }
            void setErrorCallback(const EventCallback &cb) { errorCallback_ = cb; }
            void setReadCallback(ReadEventCallback &&cb) { readCallback_ = std::move(cb); }
            void setWriteCallback(EventCallback &&cb) { writeCallback_ = std::move(cb); }
            void setCloseCallback(EventCallback &&cb) { closeCallback_ = std::move(cb); }
            void setErrorCallback(EventCallback &&cb) { errorCallback_ = std::move(cb); }

            void tie(const std::shared_ptr<void> &);

            int fd() const { return fd_; }
            int events() const { return events_; }
            void set_revents(int revt) { revents_ = revt; }

            void enableReading() { events_ |= kReadEvent; update(); }
            void disableReading() { events_ &= ~kReadEvent; update(); }
            void enableWriting() { events_ |= kWriteEvent; update(); }
            void disableWriting() { events_ &= ~kWriteEvent; update(); }
            void disableAll() { events_ = kNoneEvent; update(); }

            bool isNoneEvent() const { return events_ == kNoneEvent; }
            bool isWriting() const { return events_ & kWriteEvent; }
            bool isReading() const { return events_ & kReadEvent; }

            int index() { return index_; }
            void set_index(int idx) { index_ = idx; }

            EventLoop *ownerLoop() { return loop_; }
            void remove();

        private:
            void update();
            void handleEventWithGuard(base::TTime receiveTime);

            static const int kNoneEvent;
            static const int kReadEvent;
            static const int kWriteEvent;

            EventLoop *loop_; // 事件循环
            const int fd_;    // fd，Poller监听的对象
            int events_;      // 注册fd感兴趣的事件
            int revents_;     // Poller返回的具体发生的事件
            int index_;

            std::weak_ptr<void> tie_;
            bool tied_;

            ReadEventCallback readCallback_;
            EventCallback writeCallback_;
            EventCallback closeCallback_;
            EventCallback errorCallback_;
        };
    }
}


