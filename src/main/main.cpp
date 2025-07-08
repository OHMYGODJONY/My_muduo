#include "network/TcpServer.h"
#include "network/EventLoop.h"
#include "ServerLog.h"

#include <iostream>
#include <string>

class ChatServer
{
public:
    ChatServer(XS::network::EventLoop *loop,const XS::network::InetAddress &listenAddr)
    :server_(loop, listenAddr, "ChatServer")
    {
        server_.setConnectionCallback(std::bind(&ChatServer::onConnection,this, std::placeholders::_1));
        server_.setMessageCallback(std::bind(&ChatServer::onMessage,
        this, std::placeholders::_1, std::placeholders::_2, std::placeholders::_3));
        server_.setThreadNum(4);
    }

    void start()
    {
        server_.start();
    }

private:
    void onConnection(const XS::network::TcpConnectionPtr &con)
    {
        if(con->connected())
            std::cout << con->peerAddress().toIpPort()  << " -> " << con->peerAddress().toIpPort() << " online"<<std::endl;
        else
        {
            std::cout << con->peerAddress().toIpPort()  << " -> " << con->peerAddress().toIpPort() << " offline"<<std::endl;
            con->shutdown();
        }
    }

    void onMessage(const XS::network::TcpConnectionPtr &con, XS::network::Buffer *buf_, XS::base::TTime time_)
    {
        std::string buf = buf_->retrieveAllAsString();
        std::cout << "recv data " << buf << std::endl;
        con->send(buf);
    }

private:
    XS::network::TcpServer server_;
};

int main()
{
    g_logger = new Logger(nullptr);
    g_logger->SetLogLevel(kDebug);

    XS::network::EventLoop loop;
    XS::network::InetAddress addr(8080);
    ChatServer server(&loop,addr);
    server.start();
    loop.loop();
}