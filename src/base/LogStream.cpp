#include "LogStream.h"
#include "TTime.h"
#include <string.h>
#include <unistd.h>
#include <sys/syscall.h>
#include <iostream>

using namespace XS::base;
Logger* XS::base::g_logger = nullptr;

static thread_local pid_t thread_id = 0;
const char* log_string[] = {
    " TRACE ",
    " DEBUG ",
    " INFO ",
    " WARN ",
    " ERROR ",
};

LogStream::LogStream(Logger *loger, const char* file, int line, LogLevel l, const char* func)
:logger_(loger)
{
    const char* file_name = strrchr(file,'/');
    if(file_name)
    {
        file_name = file_name + 1;
    }
    else
    {
        file_name = file;
    }

    stream_ << TTime::ISOTime() << "[pid]:";
    if(thread_id == 0)
    {
        thread_id = static_cast<pid_t>(::syscall(SYS_gettid));
    }
    stream_ << thread_id;
    stream_ << log_string[l];
    stream_ << "[" << file_name << ":" << line << "]";
    if(func)
    {
        stream_ << "[" << func << "]";
    }
}

LogStream::~LogStream()
{
    stream_ << "\n";
    if(logger_)
    {
        logger_->Write(stream_.str());
    }
    else
    {
        std::cout << stream_.str() << std::endl ;
    }
}


