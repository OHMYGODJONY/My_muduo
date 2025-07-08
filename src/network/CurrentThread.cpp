#include "CurrentThread.h"

namespace CurrentThread
{
    thread_local int t_cachedTid = 0;

    void cacheTid()
    {
        if (t_cachedTid == 0)
        {
            t_cachedTid = static_cast<pid_t>(::syscall(SYS_gettid));
        }
    }
}


#if 0
#include <iostream>
using namespace CurrentThread;
int main()
{
    std::cout << tid() << std::endl;
    return 0;
}

#endif