#pragma once 

#include "Logger.h"
#include <sstream>

namespace XS
{
    namespace base
    {
        extern Logger* g_logger;
        class LogStream
        {
        public:
            LogStream(Logger *loger, const char* file, int line, LogLevel l, const char* func=nullptr);
            ~LogStream();

            template<class T> LogStream& operator<<(const T& value)
            {
                stream_ << value;
                return *this;
            }

        private:
            std::ostringstream stream_;
            Logger* logger_{nullptr};
        };
    }
}

#define LOG_TRACE  \
    if(g_logger&&XS::base::g_logger->GetLogLevel() <= XS::base::kTrace) \
        XS::base::LogStream(XS::base::g_logger,__FILE__,__LINE__,XS::base::kTrace,__func__)

#define LOG_DEBUG  \
    if(g_logger&&XS::base::g_logger->GetLogLevel() <= XS::base::kDebug) \
        XS::base::LogStream(XS::base::g_logger,__FILE__,__LINE__,XS::base::kDebug,__func__)

#define LOG_INFO  \
    if(g_logger&&XS::base::g_logger->GetLogLevel() <= XS::base::kInfo) \
        XS::base::LogStream(XS::base::g_logger,__FILE__,__LINE__,XS::base::kInfo)

#define LOG_WARN  \
        XS::base::LogStream(XS::base::g_logger,__FILE__,__LINE__,XS::base::kWarn)

#define LOG_ERROR  XS::base::LogStream(XS::base::g_logger,__FILE__,__LINE__,XS::base::kError)