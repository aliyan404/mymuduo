#pragma once

#include <unistd.h>
#include <sys/syscall.h>

namespace CurrentThread
{
  extern __thread int t_cachedTid_;

  void cachedTid();

  // 内联只在当前文件起作用，所以直接在头文件里写定义
  inline int tid()
  {
    if (__builtin_expect(t_cachedTid_ == 0, 0))
    {
      cachedTid();
    }
    return t_cachedTid_;
  }
}