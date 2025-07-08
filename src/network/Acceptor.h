#pragma once

#include "base/NonCopyable.h"
#include "Socket.h"
#include "Channel.h"

#include <functional>

namespace XS
{
    namespace network
    {
        class EventLoop;
        class InetAddress;

        class Acceptor : base::NonCopyable
        {
        public:
            using NewConnectionCallback = std::function<void(int sockfd, const InetAddress &)>;

            Acceptor(EventLoop *loop, const InetAddress &listenAddr, bool reuseport);
            ~Acceptor();
            void setNewConnectionCallback(const NewConnectionCallback &cb) { NewConnectionCallback_ = cb; }
            void setNewConnectionCallback(NewConnectionCallback &&cb) { NewConnectionCallback_ = std::move(cb); }
            bool listenning() const { return listenning_; }
            void listen();

        private:
            void handleRead();

            EventLoop *loop_;
            Socket acceptSocket_;
            Channel acceptChannel_;
            NewConnectionCallback NewConnectionCallback_;
            bool listenning_;
        };
    }
}

