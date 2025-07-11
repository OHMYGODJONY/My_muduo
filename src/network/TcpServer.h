#pragma once

#include "EventLoop.h"
#include "Acceptor.h"
#include "InetAddress.h"
#include "base/NonCopyable.h"
#include "EventLoopThreadPool.h"
#include "Callbacks.h"
#include "TcpConnection.h"
#include "Buffer.h"

#include <functional>
#include <string>
#include <memory>
#include <atomic>
#include <unordered_map>

namespace XS
{
    namespace network
    {
        class TcpServer: base::NonCopyable
        {
        public:
            using ThreadInitCallback = std::function<void(EventLoop *)>;

            enum Option
            {
                kNoReusePort,
                kReusePort,
            };

            TcpServer(EventLoop *loop,
                    const InetAddress &listenAddr,
                    const std::string &nameArg,
                    Option option = kNoReusePort);
            ~TcpServer();

            void setThreadInitCallback(const ThreadInitCallback &cb) { threadInitCallback_ = cb; }
            void setConnectionCallback(const ConnectionCallback &cb) { connectionCallback_ = cb; }
            void setMessageCallback(const MessageCallback &cb) { messageCallback_ = cb; }
            void setWriteCompleteCallback(const WriteCompleteCallback &cb) { writeCompleteCallback_ = cb; }

            void setThreadInitCallback(ThreadInitCallback &&cb) { threadInitCallback_ = std::move(cb); }
            void setConnectionCallback(ConnectionCallback &&cb) { connectionCallback_ = std::move(cb); }
            void setMessageCallback(MessageCallback &&cb) { messageCallback_ = std::move(cb); }
            void setWriteCompleteCallback(WriteCompleteCallback &&cb) { writeCompleteCallback_ = std::move(cb); }

            void setThreadNum(int numThreads);
            void start();

        private:
            void newConnection(int sockfd, const InetAddress &peerAddr);
            void removeConnection(const TcpConnectionPtr &conn);
            void removeConnectionInLoop(const TcpConnectionPtr &conn);

            using ConnectionMap = std::unordered_map<std::string, TcpConnectionPtr>;

            EventLoop *loop_;

            const std::string ipPort_;
            const std::string name_;

            std::unique_ptr<Acceptor> acceptor_;

            std::shared_ptr<EventLoopThreadPool> threadPool_;

            ConnectionCallback connectionCallback_;
            MessageCallback messageCallback_;
            WriteCompleteCallback writeCompleteCallback_;

            ThreadInitCallback threadInitCallback_;
            int numThreads_;
            std::atomic_int started_;
            int nextConnId_;
            ConnectionMap connections_;
        };
    }
}

// 对外的服务器编程使用的类
