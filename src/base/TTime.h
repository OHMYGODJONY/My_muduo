#pragma once

#include <cstdint>
#include <string>

namespace XS
{
    namespace base
    {
        class TTime
        {
        public:
            TTime(int64_t microSecondsSinceEpoch = 0);
            ~TTime() = default;

            static TTime now();

            static int64_t NowMS();
            static int64_t Now();
            static int64_t Now(int &year,int &month,int&day,int &hour,int&minute,int&second);
            static std::string ISOTime();
            std::string toString();

        private:
            int64_t microSecondsSinceEpoch_;
        };
    }
}