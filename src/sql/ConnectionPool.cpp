#include "ConnectionPool.h"

#include <functional>
#include <iostream>

ConnectionPool* ConnectionPool::getinstance()
{
    static ConnectionPool pool;
    return &pool;
}

void ConnectionPool::scannerConnectionTask()
{
    while(!is_stopping_)
    {
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
        std::unique_lock<std::mutex> lk(lock_);
        while (connectioncnt_ > initsize_ && !is_stopping_)
        {
            Connection *p = connectionQue_.front();
            if (p->getalivetime() >= (maxIdletime_ * 1000))
            {
                connectionQue_.pop();
                connectioncnt_--;
                delete p;
            }
            else
            {
                break;
            }
        }
    }
}

void ConnectionPool::produceConnectionTask()
{
    while(!is_stopping_)
    {
        std::unique_lock<std::mutex> lk(lock_);
        while (!connectionQue_.empty() && !is_stopping_)
        {
            cv_.wait(lk);
        }

        if (connectioncnt_ < maxsize_ && !is_stopping_)
        {
            try
            {
                Connection *p = new Connection();
                p->connect(ip_,port_,user_,password_,dbname_);
                p->refreshtimestamp();
                connectionQue_.push(p);
                connectioncnt_++;
            }
            catch(const std::bad_alloc& e)
            {
                std::cerr << "Memory allocation failed: " << e.what() << std::endl;
            }
        }
        cv_.notify_all();
    }
}

bool ConnectionPool::loadConfigFile()
{
	FILE *pf = fopen("../config/mysql.cnf", "r");
	if (pf == nullptr)
	{
		std::cout << "mysql.ini file is not exist!" << std::endl;
		return false;
	}

	while (!feof(pf))
	{
        char line[1024] = { 0 };
        char* ret = fgets(line, 1024, pf);
        std::string str = line;
        int idx = str.find('=', 0);
        if (idx == -1)
        {
            continue;
        }

        int endidx = str.find('\n', idx);
        std::string key = str.substr(0, idx);
        std::string value = str.substr(idx + 1, endidx - idx - 1);

        if (key == "ip")
        {
            ip_ = value;
        }
        else if (key == "port")
        {
            port_ = atoi(value.c_str());
        }
        else if (key == "username")
        {
            user_ = value;
        }
        else if (key == "password")
        {
            password_ = value;
        }
        else if (key == "dbname")
        {
            dbname_ = value;
        }
        else if (key == "initSize")
        {
            initsize_ = atoi(value.c_str());
        }
        else if (key == "maxSize")
        {
            maxsize_ = atoi(value.c_str());
        }
        else if (key == "maxIdleTime")
        {
            maxIdletime_ = atoi(value.c_str());
        }
        else if (key == "connectionTimeOut")
        {
            connectiontimeout_ = atoi(value.c_str());
        }
    }
    fclose(pf);
    return true;
}


ConnectionPool::ConnectionPool()
{
    if (!loadConfigFile())
    {
        throw std::runtime_error("Failed to load configuration file");
    }

    for(int i = 0; i < initsize_; i++)
    {
        try
        {
            Connection* p = new Connection();
            p->connect(ip_, port_, user_, password_, dbname_);
            p->refreshtimestamp();
            connectionQue_.push(p);
            connectioncnt_++;
        }
        catch (const std::bad_alloc& e)
        {
            std::cerr << "Memory allocation failed: " << e.what() << std::endl;
        }
    }
    is_stopping_ = false;

    producerThread_ = std::thread(std::bind(&ConnectionPool::produceConnectionTask, this));
    scannerThread_ = std::thread(std::bind(&ConnectionPool::scannerConnectionTask, this));
}

ConnectionPool::~ConnectionPool()
{
    is_stopping_ = true;
    cv_.notify_all();
    
    if (producerThread_.joinable())
    {
        std::cout << "1" << std::endl;
        producerThread_.join();
        std::cout << "2" << std::endl;

    }
    if (scannerThread_.joinable()) 
    {
        std::cout << "3" << std::endl;
        scannerThread_.join();
        std::cout << "4" << std::endl;
    }

    while (!connectionQue_.empty())
    {
        Connection* p = connectionQue_.front();
        connectionQue_.pop();
        delete p;
    }
}


ConnectionPtr ConnectionPool::getConnection()
{
    std::unique_lock<std::mutex> lk(lock_);
    while (connectionQue_.empty())
    {
        if (std::cv_status::timeout == cv_.wait_for(lk, std::chrono::milliseconds(connectiontimeout_)))
        {
            if (connectionQue_.empty())
            {
                std::cout << "time out" << std::endl;
                return nullptr;
            }
        }
    }

    ConnectionPtr sp(connectionQue_.front(), 
        [&](Connection *pcon) {
        std::unique_lock<std::mutex> lk(lock_);
        pcon->refreshtimestamp();
        connectionQue_.push(pcon);
    });

    connectionQue_.pop();
    cv_.notify_all();

    return sp;
}