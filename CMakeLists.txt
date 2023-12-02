cmake_minimum_required(VERSION 2.5)
project(mymuduo)

#mymuoduo最终编译成动态库，设置动态库路径
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

#设置调试信息
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -std=c++11 -fPIC")


#定义与编译的源代码文件
aux_source_directory(. SRC_LIST)
#编译生成动态库
add_library(mymuduo SHARED ${SRC_LIST})