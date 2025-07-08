#include "Connection.h"
#include <iostream>

Connection::Connection()
{
    conn_ = mysql_init(nullptr);
}

Connection::~Connection()
{
    if(conn_)
    {
        mysql_close(conn_);
    }
}

bool Connection::connect(std::string ip, unsigned short port, std::string user, std::string password, std::string dbname)
{
    MYSQL *p = mysql_real_connect(conn_, ip.c_str(), user.c_str(),
                                    password.c_str(), dbname.c_str(),
                                    port, nullptr, 0);
    return p != nullptr;
}

bool Connection::update(std::string sql)
{
    if (mysql_query(conn_, sql.c_str()))
    {
        std::cout << "update error" << std::endl;
        return false;
    }
    return true;
}

MYSQL_RES* Connection::query(std::string sql)
{
    if (mysql_query(conn_, sql.c_str()))
    {
        std::cout << "update error" << std::endl;
        return nullptr;
    }
    return mysql_use_result(conn_);
}
