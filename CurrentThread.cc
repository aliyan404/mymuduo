#include "CurrentThread.h"

namespace CurrentThread
{
  __thread int t_cachedTid_ = 0;

  void cachedTid()
  {
    if (t_cachedTid_ == 0)
    {
      // 根据linux系统调用获取当前的tid值
      t_cachedTid_ = static_cast<pid_t>(::syscall(SYS_gettid));
    }
  }

} // namespace CurrentThread
