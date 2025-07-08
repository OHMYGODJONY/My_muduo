#include "StringUtils.h"

using namespace XS::base;

bool StringUtils::StartsWith(const string &s, const string &sub)
{
    if(sub.empty()) return true;
    if(s.empty()) return false;

    auto len = s.size();
    auto slen = sub.size();
    if(len < slen) return false;
    return s.compare(0,slen,sub) == 0;
}

bool StringUtils::EndsWith(const string &s, const string &sub)
{
    if(sub.empty()) return true;
    if(s.empty()) return false;

    auto len = s.size();
    auto slen = sub.size();
    if(len < slen) return false;
    return s.compare(len-slen,slen,sub) == 0;
}

std::string StringUtils::FilePath(const std::string &path)
{
    auto pos = path.find_last_of("/\\");
    if(pos != std::string::npos)
    {
        return path.substr(0,pos);
    }
    else
    {
        return "./";
    }
}

std::string StringUtils::FileNameExt(const std::string &path)
{
    auto pos = path.find_last_of("/\\");
    if(pos != std::string::npos)
    {
        if(pos+1 < path.size())
        {
            return path.substr(pos+1);
        }
    }
    return path;
}

std::string StringUtils::FileName(const std::string &path)
{
    string file_name = FileNameExt(path);
    auto pos = file_name.find_last_of(".");
    if(pos != std::string::npos)
    {
        if(pos != 0)
        {
            return file_name.substr(0,pos);
        }
    }
    return file_name;
}

std::string StringUtils::Extension(const std::string &path)
{
    string file_name = FileNameExt(path);
    auto pos = file_name.find_last_of(".");
    if(pos != std::string::npos)
    {
        if(pos != 0 && pos+1 < file_name.size())
        {
            return file_name.substr(pos+1);
        }
    }
    return std::string();
}

std::vector<std::string> StringUtils::SplitString(const string &s, const string &delimiter)
{
    if(delimiter.empty()) 
    {
        return std::vector<std::string>{}; 
    }
    std::vector<std::string> result;
    size_t last = 0;
    size_t next = 0;
    while((next = s.find(delimiter,last)) != std::string::npos)
    {
        if(next > last)
        {
            result.emplace_back(s.substr(last,next-last));
        }
        last = next + delimiter.size();
    }
    if(last < s.size())
    {
        result.emplace_back(s.substr(last));
    }
    return result;
}