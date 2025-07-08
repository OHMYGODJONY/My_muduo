#pragma once
#include <arpa/inet.h>

namespace XS
{
    namespace network
    {
        namespace sockets
        {
            void close(int sockfd);
            int getSocketError(int sockfd);
            struct sockaddr_in getLocalAddr(int sockfd);
            struct sockaddr_in getPeerAddr(int sockfd);
            bool isSelfConnect(int sockfd);
        }
    }
} 