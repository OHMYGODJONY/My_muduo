#pragma once
#include <queue>
#include <mutex>
#include <memory>
#include <thread>
#include <atomic>
#include <condition_variable>

#include "Connection.h"

using ConnectionPtr = std::shared_ptr<Connection>;
class ConnectionPool
{
public:
    static ConnectionPool* getinstance();
    ConnectionPtr getConnection();
    
private:
    ConnectionPool();
    ConnectionPool(const ConnectionPool&) = delete;
    ConnectionPool& operator=(const ConnectionPool&) = delete;
    ~ConnectionPool();

    bool loadConfigFile();
    void scannerConnectionTask();
    void produceConnectionTask();
    
    std::string ip_;
    unsigned short port_;
    std::string user_;
    std::string password_;
    std::string dbname_;

    int initsize_;
    int maxsize_;
    int maxIdletime_;
    int connectiontimeout_;
    
    std::queue<Connection*> connectionQue_;
    std::mutex lock_;
    std::condition_variable cv_;
    std::atomic_int connectioncnt_;
    std::thread producerThread_;
    std::thread scannerThread_;
    bool is_stopping_{false};
};