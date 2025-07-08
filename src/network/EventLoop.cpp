#include "EventLoop.h"
#include "Network.h"
#include "Channel.h"
#include "Poller.h"

#include <sys/eventfd.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <memory>

using namespace XS::network;

thread_local EventLoop *t_loopInThisThread = nullptr;

const int kPollTimeMs = 10000; // 10000毫秒 = 10秒钟

int createEventfd()
{
    int evtfd = ::eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC);
    if (evtfd < 0)
    {
        LOG_ERROR << "eventfd error: " << errno;
        exit(-1);
    }
    return evtfd;
}

EventLoop::EventLoop()
    : looping_(false)
    , quit_(false)
    , threadId_(CurrentThread::tid())
    , poller_(Poller::newDefaultPoller(this))
    , wakeupFd_(createEventfd())
    , wakeupChannel_(new Channel(this, wakeupFd_))
    , callingPendingFunctors_(false)
{
    NETWORK_DEBUG << "EventLoop created" << this << "in thread: " << threadId_;
    if (t_loopInThisThread)
    {
        NETWORK_ERROR << "Another EventLoop: " << t_loopInThisThread << "exists in this thread: " << threadId_;
        exit(-1);
    }
    else
    {
        t_loopInThisThread = this;
    }
    
    wakeupChannel_->setReadCallback(
        std::bind(&EventLoop::handleRead, this));
    
    wakeupChannel_->enableReading();
}

EventLoop::~EventLoop()
{
    wakeupChannel_->disableAll();
    wakeupChannel_->remove();
    ::close(wakeupFd_);
    t_loopInThisThread = nullptr;
}

void EventLoop::loop()
{
    looping_ = true;
    quit_ = false;

    NETWORK_INFO <<"EventLoop " << this <<"start looping!!!!!";

    while (!quit_)
    {
        activeChannels_.clear();
        pollRetureTime_ = poller_->poll(kPollTimeMs, &activeChannels_);
        for (Channel *channel : activeChannels_)
        {
            channel->handleEvent(pollRetureTime_);
        }

        doPendingFunctors();
        int64_t now = XS::base::TTime::NowMS();
        wheel_.OnTimer(now);
    }
    NETWORK_INFO <<"EventLoop " << this << "stop looping!!!!";
    looping_ = false;
}

void EventLoop::quit()
{
    quit_ = true;

    if (!isInLoopThread())
    {
        wakeup();
    }
}

void EventLoop::runInLoop(Functor cb)
{
    if (isInLoopThread()) //在当前线程并且能走到这一步的，一定不处于阻塞
    {
        cb();
    }
    else //外部线程调用，状态不好说，可能阻塞，可能没阻塞，以防万一，唤醒一次
    {
        queueInLoop(cb);
    }
}

void EventLoop::queueInLoop(Functor cb)
{
    {
        std::unique_lock<std::mutex> lock(mutex_);
        pendingFunctors_.emplace_back(cb);
    }
    if (!isInLoopThread() || callingPendingFunctors_)
    {
        wakeup();
    }
}

void EventLoop::handleRead()
{
    uint64_t one = 1;
    ssize_t n = read(wakeupFd_, &one, sizeof(one));
    if (n != sizeof(one))
    {
        NETWORK_ERROR << "EventLoop::handleRead() reads" << n << " bytes instead of 8";
    }
}

void EventLoop::wakeup()
{
    uint64_t one = 1;
    ssize_t n = write(wakeupFd_, &one, sizeof(one));
    if (n != sizeof(one))
    {
        NETWORK_ERROR << "EventLoop::wakeup() writes" << n << " bytes instead of 8";
    }
}

void EventLoop::updateChannel(Channel *channel)
{
    poller_->updateChannel(channel);
}

void EventLoop::removeChannel(Channel *channel)
{
    poller_->removeChannel(channel);
}

bool EventLoop::hasChannel(Channel *channel)
{
    return poller_->hasChannel(channel);
}

void EventLoop::doPendingFunctors()
{
    std::vector<Functor> functors;
    callingPendingFunctors_ = true;

    {
        std::unique_lock<std::mutex> lock(mutex_);
        functors.swap(pendingFunctors_);
    }

    for (const Functor &functor : functors)
    {
        functor();
    }

    callingPendingFunctors_ = false;
}


void EventLoop::InsertEntry(uint32_t delay, EntryPtr entryPtr)
{
    if(isInLoopThread())
    {
        wheel_.InsertEntry(delay,entryPtr);
    }
    else
    {
        runInLoop([this,delay,entryPtr](){
            wheel_.InsertEntry(delay,entryPtr);
        });
    }
}

void EventLoop::RunAfter(double delay, const Func &cb)
{
    if(isInLoopThread())
    {
        wheel_.RunAfter(delay,cb);
    }
    else
    {
        runInLoop([this,delay,cb](){
            wheel_.RunAfter(delay,cb);
        });
    }
}

void EventLoop::RunAfter(double delay, Func &&cb)
{
    if(isInLoopThread())
    {
        wheel_.RunAfter(delay,cb);
    }
    else
    {
        runInLoop([this,delay,cb](){
            wheel_.RunAfter(delay,cb);
        });
    }
}

void EventLoop::RunEvery(double interval, const Func &cb)
{
    if(isInLoopThread())
    {
        wheel_.RunEvery(interval,cb);
    }
    else
    {
        runInLoop([this,interval,cb](){
            wheel_.RunEvery(interval,cb);
        });
    }
}

void EventLoop::RunEvery(double interval, Func &&cb)
{
    if(isInLoopThread())
    {
        wheel_.RunEvery(interval,cb);
    }
    else
    {
        runInLoop([this,interval,cb](){
            wheel_.RunEvery(interval,cb);
        });
    }
}