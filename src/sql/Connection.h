#pragma once
#include <mysql.h>
#include <string>
#include <ctime>

class Connection
{
public:
    Connection();
    ~Connection();
    bool connect(std::string ip, unsigned short port, std::string user, std::string password, std::string dbname);
    bool update(std::string sql);
    MYSQL_RES* query(std::string sql);
    void refreshtimestamp() {timestamp_ = clock();}
    clock_t getalivetime() const {return clock() - timestamp_;}
private:
    MYSQL* conn_;
    clock_t timestamp_;
};