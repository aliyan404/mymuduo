#include "Buffer.h"

#include <error.h>
#include <sys/uio.h>
#include <unistd.h>

// Poller工作在LT模式,保证数据不会丢失

ssize_t Buffer::readFd(int fd, int *saveErrno)
{
  char extrabuf[65536] = {0}; // 栈上的内存空间 64K
  struct iovec vec[2];
  const size_t wirteable = writeableBytes(); // 这是底层缓冲区剩余的可写空间大小
  vec[0].iov_base = begin() + writerIndex_;
  vec[0].iov_len = wirteable;

  vec[1].iov_base = extrabuf;
  vec[1].iov_len = sizeof extrabuf;

  const int iovcnt = (wirteable < sizeof extrabuf) ? 2 : 1; // 至少读64K的数据
  const ssize_t n = ::readv(fd, vec, iovcnt);
  if (n < 0)
  {
    *saveErrno = errno;
  }
  else if (n <= wirteable) // buffer的可写缓冲区已经够存储读出来的数据了
  {
    writerIndex_ += n;
  }
  else // extrbuf里面也写入了数据
  {
    writerIndex_ = buffer_.size();
    append(extrabuf, n - wirteable); // writeIndex_开始写n-writeable大小的数据，从buffer.size后开始写
  }
  return n;
}

ssize_t Buffer::writeFd(int fd, int *saveErron)
{
  ssize_t n = ::write(fd, peek(), readableBytes());
  if (n < 0)
  {
    *saveErron = errno;
  }
  return n;
}