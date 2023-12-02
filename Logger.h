#pragma once

#include <string>

#include "noncopyable.h"

// 日志宏LOG_INFO("%s %d",arg1,arg2)
#define LOG_INFO(logmsgFormat, ...)                   \
  do                                                  \
  {                                                   \
    Logger &logger = Logger::instance();              \
    logger.setLogLevel(INFO);                         \
    char buf[1024] = {0};                             \
    snprintf(buf, 1024, logmsgFormat, ##__VA_ARGS__); \
    logger.log(buf);                                  \
  } while (0)

#define LOG_ERROR(logmsgFormat, ...)                  \
  do                                                  \
  {                                                   \
    Logger &logger = Logger::instance();              \
    logger.setLogLevel(ERROR);                        \
    char buf[1024] = {0};                             \
    snprintf(buf, 1024, logmsgFormat, ##__VA_ARGS__); \
    logger.log(buf);                                  \
  } while (0)

#define LOG_FATAL(logmsgFormat, ...)                  \
  do                                                  \
  {                                                   \
    Logger &logger = Logger::instance();              \
    logger.setLogLevel(FATAL);                        \
    char buf[1024] = {0};                             \
    snprintf(buf, 1024, logmsgFormat, ##__VA_ARGS__); \
    logger.log(buf);                                  \
    exit(-1);                                         \
  } while (0)

#ifdef MUDEBUG
#define LOG_DEBUG(logmsgFormat, ...)                  \
  do                                                  \
  {                                                   \
    Logger &logger = Logger::instance();              \
    logger.setLogLevel(DEBUG);                        \
    char buf[1024] = {0};                             \
    snprintf(buf, 1024, logmsgFormat, ##__VA_ARGS__); \
    logger.log(buf);                                  \
  } while (0)
#else
#define LOG_DEBUG(logmsgFormat, ...)
#endif

// 定义日志级别 INFO ERROR FATAL DEBAG
enum Loglevel
{
  INFO,
  ERROR,
  FATAL,
  DEBUG,

};

// 输出一个日志类
class Logger : noncopyable
{
public:
  static Logger &instance();
  // 设置日志级别
  void setLogLevel(int level);
  // 写日志
  void log(std::string msg);

private:
  int logLevel_; // 日志级别
  Logger() {}
};
