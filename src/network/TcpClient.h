#pragma once 

#include "TcpConnection.h"
#include <mutex>

namespace XS
{
    namespace network
    {
        class Connector;
        typedef std::shared_ptr<Connector> ConnectorPtr;

        class TcpClient : base::NonCopyable
        {
        public:
            TcpClient(EventLoop* loop,
                        const InetAddress& serverAddr,
                        const std::string& nameArg);
            ~TcpClient();

            void connect();
            void disconnect();
            void stop();

            TcpConnectionPtr connection()
            {
                std::lock_guard<std::mutex> lk(mutex_);
                return connection_;
            }

            EventLoop* getLoop() const { return loop_; }
            bool retry() const { return retry_; }
            void enableRetry() { retry_ = true; }

            const std::string& name() const
            { return name_; }

            void setConnectionCallback(ConnectionCallback &&cb)
            { connectionCallback_ = std::move(cb); }
            void setMessageCallback(MessageCallback &&cb)
            { messageCallback_ = std::move(cb); }
            void setWriteCompleteCallback(WriteCompleteCallback &&cb)
            { writeCompleteCallback_ = std::move(cb); }

            void setConnectionCallback(const ConnectionCallback &cb)
            { connectionCallback_ = cb; }
            void setMessageCallback(const MessageCallback &cb)
            { messageCallback_ = cb; }
            void setWriteCompleteCallback(const WriteCompleteCallback &cb)
            { writeCompleteCallback_ = cb; }

        private:

            void newConnection(int sockfd);
    
            void removeConnection(const TcpConnectionPtr& conn);

            EventLoop* loop_;
            ConnectorPtr connector_; // avoid revealing Connector
            const std::string name_;
            ConnectionCallback connectionCallback_;
            MessageCallback messageCallback_;
            WriteCompleteCallback writeCompleteCallback_;
            std::atomic_bool retry_;   // atomic
            std::atomic_bool connect_; // atomic
            // always in loop thread
            int nextConnId_;
            std::mutex mutex_;
            TcpConnectionPtr connection_;
        };
    }
} 
