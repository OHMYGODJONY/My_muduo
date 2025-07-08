#pragma once

#include "base/NonCopyable.h"
#include "InetAddress.h"
#include "Callbacks.h"
#include "Buffer.h"
#include "base/TTime.h"

#include <memory>
#include <string>
#include <atomic>

namespace XS
{
    namespace network
    {
        class Channel;
        class EventLoop;
        class Socket;

        class TcpConnection : base::NonCopyable, public std::enable_shared_from_this<TcpConnection>
        {
        public:
            TcpConnection(EventLoop *loop,
                        const std::string &nameArg,
                        int sockfd,
                        const InetAddress &localAddr,
                        const InetAddress &peerAddr);
            ~TcpConnection();

            EventLoop *getLoop() const { return loop_; }
            const std::string &name() const { return name_; }
            const InetAddress &localAddress() const { return localAddr_; }
            const InetAddress &peerAddress() const { return peerAddr_; }

            bool connected() const { return state_ == kConnected; }

            // 发送数据
            void send(const std::string &buf);
            void sendFile(int fileDescriptor, off_t offset, size_t count); 
            
            // 关闭半连接
            void shutdown();

            void setConnectionCallback(const ConnectionCallback &cb)
            { connectionCallback_ = cb; }
            void setMessageCallback(const MessageCallback &cb)
            { messageCallback_ = cb; }
            void setWriteCompleteCallback(const WriteCompleteCallback &cb)
            { writeCompleteCallback_ = cb; }
            void setCloseCallback(const CloseCallback &cb)
            { closeCallback_ = cb; }
            void setHighWaterMarkCallback(const HighWaterMarkCallback &cb, size_t highWaterMark)
            { highWaterMarkCallback_ = cb; highWaterMark_ = highWaterMark; }

            void setConnectionCallback(ConnectionCallback &&cb)
            { connectionCallback_ = std::move(cb); }
            void setMessageCallback(MessageCallback &&cb)
            { messageCallback_ = std::move(cb); }
            void setWriteCompleteCallback(WriteCompleteCallback &&cb)
            { writeCompleteCallback_ = std::move(cb); }
            void setCloseCallback(CloseCallback &&cb)
            { closeCallback_ = std::move(cb); }
            void setHighWaterMarkCallback(HighWaterMarkCallback &&cb, size_t highWaterMark)
            { highWaterMarkCallback_ = std::move(cb); highWaterMark_ = highWaterMark; }

            // 连接建立
            void connectEstablished();
            // 连接销毁
            void connectDestroyed();

            void forceClose();

        private:
            enum StateE
            {
                kDisconnected,
                kConnecting,
                kConnected,
                kDisconnecting 
            };
            void setState(StateE state) { state_ = state; }

            void handleRead(base::TTime receiveTime);
            void handleWrite();
            void handleClose();
            void handleError();

            void sendInLoop(const void *data, size_t len);
            void shutdownInLoop();
            void forceCloseInLoop();
            void sendFileInLoop(int fileDescriptor, off_t offset, size_t count);
            EventLoop *loop_;
            const std::string name_;
            std::atomic_int state_;
            bool reading_;

            std::unique_ptr<Socket> socket_;
            std::unique_ptr<Channel> channel_;

            const InetAddress localAddr_;
            const InetAddress peerAddr_;

            ConnectionCallback connectionCallback_;
            MessageCallback messageCallback_;
            WriteCompleteCallback writeCompleteCallback_;
            HighWaterMarkCallback highWaterMarkCallback_;
            CloseCallback closeCallback_;
            size_t highWaterMark_;

            Buffer inputBuffer_;
            Buffer outputBuffer_;
        };
        using TcpConnectionPtr = std::shared_ptr<TcpConnection>;
        void defaultConnectionCallback(const TcpConnectionPtr& conn);
        void defaultMessageCallback(const TcpConnectionPtr&,
                                        Buffer* buf,
                                        XS::base::TTime);
    }
}


