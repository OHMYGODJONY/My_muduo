#include "TcpClient.h"

#include "Network.h"
#include "Connector.h"
#include "EventLoop.h"
#include "SocketsOps.h"

#include <stdio.h>  // snprintf

using namespace XS;
using namespace XS::network;

namespace XS
{
    namespace network
    {
        namespace detail
        {

            void removeConnection(EventLoop* loop, const TcpConnectionPtr& conn)
            {
            loop->queueInLoop(std::bind(&TcpConnection::connectDestroyed, conn));
            }

            void removeConnector(const ConnectorPtr& connector)
            {

            }
        }
    }  
} 

static EventLoop *CheckLoopNotNull(EventLoop *loop)
{
    if (loop == nullptr)
    {
        NETWORK_ERROR << "mainLoop is null!!!";
        exit(-1);
    }
    return loop;
}


TcpClient::TcpClient(EventLoop* loop,
                     const InetAddress& serverAddr,
                     const std::string& nameArg)
  : loop_(CheckLoopNotNull(loop)),
    connector_(new Connector(loop, serverAddr)),
    name_(nameArg),
    connectionCallback_(defaultConnectionCallback),
    messageCallback_(defaultMessageCallback),
    retry_(false),
    connect_(true),
    nextConnId_(1)
{
    connector_->setNewConnectionCallback(
        std::bind(&TcpClient::newConnection, this, std::placeholders::_1));
    // FIXME setConnectFailedCallback
    NETWORK_INFO << "TcpClient::TcpClient[" << name_
            << "] - connector ";
}

TcpClient::~TcpClient()
{
    NETWORK_INFO << "TcpClient::~TcpClient[" << name_
            << "] - connector ";
    TcpConnectionPtr conn;
    bool unique = false;
    {
        std::lock_guard<std::mutex> lock(mutex_);
        unique = connection_.unique();
        conn = connection_;
    }
    if (conn)
    {
        CloseCallback cb = std::bind(&detail::removeConnection, loop_, std::placeholders::_1);
        loop_->runInLoop([conn, cb]() {conn->setCloseCallback(cb);});
        if (unique)
        {
            conn->forceClose();
        }
    }
    else
    {
        connector_->stop();
        loop_->RunAfter(1, std::bind(&detail::removeConnector, connector_));
    }
}

void TcpClient::connect()
{
    // FIXME: check state
    NETWORK_INFO << "TcpClient::connect[" << name_ << "] - connecting to "
            << connector_->serverAddress().toIpPort();
    connect_ = true;
    connector_->start();
}

void TcpClient::disconnect()
{
  connect_ = false;

  {
    std::lock_guard<std::mutex> lock(mutex_);
    if (connection_)
    {
        connection_->shutdown();
    }
  }
}

void TcpClient::stop()
{
  connect_ = false;
  connector_->stop();
}

void TcpClient::newConnection(int sockfd)
{
    loop_->isInLoopThread();
    InetAddress peerAddr(sockets::getPeerAddr(sockfd));
    char buf[32];
    snprintf(buf, sizeof buf, ":%s#%d", peerAddr.toIpPort().c_str(), nextConnId_);
    ++nextConnId_;
    std::string connName = name_ + buf;

    InetAddress localAddr(sockets::getLocalAddr(sockfd));
    TcpConnectionPtr conn(new TcpConnection(loop_,
                                            connName,
                                            sockfd,
                                            localAddr,
                                            peerAddr));

    conn->setConnectionCallback(connectionCallback_);
    conn->setMessageCallback(messageCallback_);
    conn->setWriteCompleteCallback(writeCompleteCallback_);
    conn->setCloseCallback(
        std::bind(&TcpClient::removeConnection, this, std::placeholders::_1)); // FIXME: unsafe
    {
            std::lock_guard<std::mutex> lock(mutex_);
            connection_ = conn;
    }
    conn->connectEstablished();
}

void TcpClient::removeConnection(const TcpConnectionPtr& conn)
{
    loop_->isInLoopThread();

    {
            std::lock_guard<std::mutex> lock(mutex_);
            connection_.reset();
    }

    loop_->queueInLoop(std::bind(&TcpConnection::connectDestroyed, conn));
    if (retry_ && connect_)
    {
        NETWORK_INFO << "TcpClient::connect[" << name_ << "] - Reconnecting to "
                << connector_->serverAddress().toIpPort();
        connector_->restart();
    }
}