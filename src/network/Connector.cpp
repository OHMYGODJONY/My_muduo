#include "Connector.h"

#include "Network.h"
#include "Channel.h"
#include "EventLoop.h"
#include "SocketsOps.h"

#include <errno.h>

using namespace XS;
using namespace XS::network;

static int createNonblocking()
{
    int sockfd = ::socket(AF_INET, SOCK_STREAM | SOCK_NONBLOCK | SOCK_CLOEXEC, IPPROTO_TCP);
    if (sockfd < 0)
    {
        NETWORK_ERROR << "listen socket create err: " << errno;
        exit(-1);
    }
    return sockfd;
}

const int Connector::kMaxRetryDelayMs;

Connector::Connector(EventLoop* loop, const InetAddress& serverAddr)
  : loop_(loop),
    serverAddr_(serverAddr),
    connect_(false),
    state_(kDisconnected),
    retryDelayMs_(kInitRetryDelayMs)
{
    NETWORK_DEBUG << "ctor[" << this << "]";
}

Connector::~Connector()
{
    NETWORK_DEBUG << "dtor[" << this << "]";
}

void Connector::start()
{
    connect_ = true;
    loop_->runInLoop(std::bind(&Connector::startInLoop, this)); // FIXME: unsafe
}

void Connector::startInLoop()
{
    loop_->isInLoopThread();
    if (connect_)
    {
        connect();
    }
    else
    {
        NETWORK_DEBUG << "do not connect";
    }
}

void Connector::stop()
{
    connect_ = false;
    loop_->queueInLoop(std::bind(&Connector::stopInLoop, this)); // FIXME: unsafe
}

void Connector::stopInLoop()
{
    loop_->isInLoopThread();
    if (state_ == kConnecting)
    {
        setState(kDisconnected);
        int sockfd = removeAndResetChannel();
        retry(sockfd);
    }
}

void Connector::connect()
{
    int sockfd = createNonblocking();
    int ret = ::connect(sockfd, (const sockaddr*)serverAddr_.getSockAddr(), static_cast<socklen_t>(sizeof(struct sockaddr_in)));
    int savedErrno = (ret == 0) ? 0 : errno;
    switch (savedErrno)
    {
        case 0:
        case EINPROGRESS:
        case EINTR:
        case EISCONN:
        connecting(sockfd);
        break;

        case EAGAIN:
        case EADDRINUSE:
        case EADDRNOTAVAIL:
        case ECONNREFUSED:
        case ENETUNREACH:
        retry(sockfd);
        break;

        case EACCES:
        case EPERM:
        case EAFNOSUPPORT:
        case EALREADY:
        case EBADF:
        case EFAULT:
        case ENOTSOCK:
        NETWORK_ERROR << "connect error in Connector::startInLoop " << savedErrno;
        sockets::close(sockfd);
        break;

        default:
        NETWORK_ERROR << "Unexpected error in Connector::startInLoop " << savedErrno;
        sockets::close(sockfd);
        // connectErrorCallback_();
        break;
    }
}

void Connector::restart()
{
    loop_->isInLoopThread();
    setState(kDisconnected);
    retryDelayMs_ = kInitRetryDelayMs;
    connect_ = true;
    startInLoop();
}

void Connector::connecting(int sockfd)
{
    setState(kConnecting);
    channel_.reset(new Channel(loop_, sockfd));
    channel_->setWriteCallback(
        std::bind(&Connector::handleWrite, this)); // FIXME: unsafe
    channel_->setErrorCallback(
        std::bind(&Connector::handleError, this)); // FIXME: unsafe

    channel_->enableWriting();
}

int Connector::removeAndResetChannel()
{
    channel_->disableAll();
    channel_->remove();
    int sockfd = channel_->fd();
    // Can't reset channel_ here, because we are inside Channel::handleEvent
    loop_->queueInLoop(std::bind(&Connector::resetChannel, this)); // FIXME: unsafe
    return sockfd;
}

void Connector::resetChannel()
{
    channel_.reset();
}

void Connector::handleWrite()
{
    NETWORK_TRACE << "Connector::handleWrite " << state_;

    if (state_ == kConnecting)
    {
        int sockfd = removeAndResetChannel();
        int err = sockets::getSocketError(sockfd);
        if (err)
        {
        LOG_WARN << "Connector::handleWrite - SO_ERROR = "
                << err;
        retry(sockfd);
        }
        else if (sockets::isSelfConnect(sockfd))
        {
        LOG_WARN << "Connector::handleWrite - Self connect";
        retry(sockfd);
        }
        else
        {
        setState(kConnected);
        if (connect_)
        {
            newConnectionCallback_(sockfd);
        }
        else
        {
            sockets::close(sockfd);
        }
        }
    }
    else
    {
        
    }
}

void Connector::handleError()
{
    NETWORK_ERROR << "Connector::handleError state=" << state_;
    if (state_ == kConnecting)
    {
        int sockfd = removeAndResetChannel();
        int err = sockets::getSocketError(sockfd);
        NETWORK_TRACE << "SO_ERROR = " << err;
        retry(sockfd);
    }
}

void Connector::retry(int sockfd)
{
    sockets::close(sockfd);
    setState(kDisconnected);
    if (connect_)
    {
        NETWORK_INFO << "Connector::retry - Retry connecting to " << serverAddr_.toIpPort()
                << " in " << retryDelayMs_ << " milliseconds. ";
        loop_->RunAfter(retryDelayMs_/1000.0,
                        std::bind(&Connector::startInLoop, shared_from_this()));
        retryDelayMs_ = std::min(retryDelayMs_ * 2, kMaxRetryDelayMs);
    }
    else
    {
        NETWORK_DEBUG << "do not connect";
    }
}