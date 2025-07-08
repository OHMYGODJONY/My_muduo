#pragma once

namespace XS
{
    namespace base
    {
        class NonCopyable
        {
        protected:
            NonCopyable()
            {}
            ~NonCopyable()
            {}
            NonCopyable(const NonCopyable&) = delete;
            NonCopyable& operator=(const NonCopyable&) = delete;
        };
    }
}  