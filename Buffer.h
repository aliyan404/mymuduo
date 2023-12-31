#pragma once

#include <vector>
#include <string>
#include <algorithm>
#include <cstddef>

// 网络库底层的缓冲区类型
class Buffer
{
public:
  static const size_t kCheapPrepend = 8;
  static const size_t kInitalSize = 1024;

  explicit Buffer(size_t InitalSize = kInitalSize)
      : buffer_(kCheapPrepend + InitalSize),
        readerIndex_(kCheapPrepend),
        writerIndex_(kCheapPrepend) {}

  size_t readableBytes() const
  {
    return writerIndex_ - readerIndex_;
  }

  size_t writeableBytes() const
  {
    return buffer_.size() - writerIndex_;
  }

  size_t prependableBytes() const
  {
    return readerIndex_;
  }

  // 返回缓冲区可读数据的起始地址
  const char *peek() const
  {
    return begin() + readerIndex_;
  }

  // onMessage string<-Buffer
  void retrieve(size_t len)
  {
    if (len < readableBytes())
    {
      // 应用没读取完
      readerIndex_ += len;
    }
    else
    {
      // 全部读完后全部复位
      retrieveAll();
    }
  }

  void retrieveAll()
  {
    readerIndex_ = writerIndex_ = kCheapPrepend;
  }

  // 把onMessage函数上报的Buffer数据，转成string类型的数据返回
  std::string retrieveAllAsString()
  {
    return retrieveAsString(readableBytes()); // 应用可读数据的长度
  }

  std::string retrieveAsString(size_t len)
  {
    std::string result(peek(), len);
    retrieve(len); // 上面已经读取完缓冲区的数据，对缓冲区进行复位操作
    return result;
  }

  // 可写：buffer.size-writeIndex_, 需要写长度为len，比较看是否扩容
  void ensureWriteableBytes(size_t len)
  {
    if (writeableBytes() < len)
    {
      makeSpace(len); // 扩容函数
    }
  }

  // 把data，data+len内存上的数据添加到readable缓冲区当中
  void append(const char *data, size_t len)
  {
    ensureWriteableBytes(len);
    std::copy(data, data + len, beginWrite());
    writerIndex_ += len;
  }

  char *beginWrite()
  {
    return begin() + writerIndex_;
  }

  const char *beginWrite() const
  {
    return begin() + writerIndex_;
  }

  // 从fd上读取数据
  ssize_t readFd(int fd, int *saveErrno);
  // 通过fd发送数据
  ssize_t writeFd(int fd, int *saveErrno);

private:
  char *begin()
  {
    return &*buffer_.begin();
  }
  // 常方法
  const char *begin() const
  {
    return &*buffer_.begin();
  }

  void makeSpace(size_t len)
  {
    if (writeableBytes() + prependableBytes() < len + kCheapPrepend)
    {
      buffer_.resize(writerIndex_ + len);
    }
    else
    {
      size_t readable = readableBytes();
      std::copy(begin() + readerIndex_,
                begin() + writerIndex_,
                begin() + kCheapPrepend);
      readerIndex_ = kCheapPrepend;
      writerIndex_ = readerIndex_ + readable;
    }
  }

  std::vector<char> buffer_;
  size_t readerIndex_;
  size_t writerIndex_;
};