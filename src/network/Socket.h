#pragma once

#include "base/NonCopyable.h"
namespace XS
{
    namespace network
    {
        class InetAddress;

        class Socket : base::NonCopyable
        {
        public:
            explicit Socket(int sockfd)
                : sockfd_(sockfd)
            {
            }
            ~Socket();

            int fd() const { return sockfd_; }
            void bindAddress(const InetAddress &localaddr);
            void listen();
            int accept(InetAddress *peeraddr);

            void shutdownWrite();

            void setTcpNoDelay(bool on);
            void setReuseAddr(bool on);
            void setReusePort(bool on);
            void setKeepAlive(bool on);

        private:
            const int sockfd_;
        };
    }
}

