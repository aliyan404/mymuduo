# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.6

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/douwant/C++Project/Tinymuduo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/douwant/C++Project/Tinymuduo/build

# Include any dependencies generated for this target.
include CMakeFiles/mymuduo.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/mymuduo.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mymuduo.dir/flags.make

CMakeFiles/mymuduo.dir/Timestamp.o: CMakeFiles/mymuduo.dir/flags.make
CMakeFiles/mymuduo.dir/Timestamp.o: ../Timestamp.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/douwant/C++Project/Tinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/mymuduo.dir/Timestamp.o"
	/opt/rh/devtoolset-11/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mymuduo.dir/Timestamp.o -c /home/douwant/C++Project/Tinymuduo/Timestamp.cc

CMakeFiles/mymuduo.dir/Timestamp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mymuduo.dir/Timestamp.i"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/douwant/C++Project/Tinymuduo/Timestamp.cc > CMakeFiles/mymuduo.dir/Timestamp.i

CMakeFiles/mymuduo.dir/Timestamp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mymuduo.dir/Timestamp.s"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/douwant/C++Project/Tinymuduo/Timestamp.cc -o CMakeFiles/mymuduo.dir/Timestamp.s

CMakeFiles/mymuduo.dir/Timestamp.o.requires:

.PHONY : CMakeFiles/mymuduo.dir/Timestamp.o.requires

CMakeFiles/mymuduo.dir/Timestamp.o.provides: CMakeFiles/mymuduo.dir/Timestamp.o.requires
	$(MAKE) -f CMakeFiles/mymuduo.dir/build.make CMakeFiles/mymuduo.dir/Timestamp.o.provides.build
.PHONY : CMakeFiles/mymuduo.dir/Timestamp.o.provides

CMakeFiles/mymuduo.dir/Timestamp.o.provides.build: CMakeFiles/mymuduo.dir/Timestamp.o


CMakeFiles/mymuduo.dir/TcpServer.o: CMakeFiles/mymuduo.dir/flags.make
CMakeFiles/mymuduo.dir/TcpServer.o: ../TcpServer.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/douwant/C++Project/Tinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/mymuduo.dir/TcpServer.o"
	/opt/rh/devtoolset-11/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mymuduo.dir/TcpServer.o -c /home/douwant/C++Project/Tinymuduo/TcpServer.cc

CMakeFiles/mymuduo.dir/TcpServer.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mymuduo.dir/TcpServer.i"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/douwant/C++Project/Tinymuduo/TcpServer.cc > CMakeFiles/mymuduo.dir/TcpServer.i

CMakeFiles/mymuduo.dir/TcpServer.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mymuduo.dir/TcpServer.s"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/douwant/C++Project/Tinymuduo/TcpServer.cc -o CMakeFiles/mymuduo.dir/TcpServer.s

CMakeFiles/mymuduo.dir/TcpServer.o.requires:

.PHONY : CMakeFiles/mymuduo.dir/TcpServer.o.requires

CMakeFiles/mymuduo.dir/TcpServer.o.provides: CMakeFiles/mymuduo.dir/TcpServer.o.requires
	$(MAKE) -f CMakeFiles/mymuduo.dir/build.make CMakeFiles/mymuduo.dir/TcpServer.o.provides.build
.PHONY : CMakeFiles/mymuduo.dir/TcpServer.o.provides

CMakeFiles/mymuduo.dir/TcpServer.o.provides.build: CMakeFiles/mymuduo.dir/TcpServer.o


CMakeFiles/mymuduo.dir/EventLoopThreadPool.o: CMakeFiles/mymuduo.dir/flags.make
CMakeFiles/mymuduo.dir/EventLoopThreadPool.o: ../EventLoopThreadPool.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/douwant/C++Project/Tinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/mymuduo.dir/EventLoopThreadPool.o"
	/opt/rh/devtoolset-11/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mymuduo.dir/EventLoopThreadPool.o -c /home/douwant/C++Project/Tinymuduo/EventLoopThreadPool.cc

CMakeFiles/mymuduo.dir/EventLoopThreadPool.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mymuduo.dir/EventLoopThreadPool.i"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/douwant/C++Project/Tinymuduo/EventLoopThreadPool.cc > CMakeFiles/mymuduo.dir/EventLoopThreadPool.i

CMakeFiles/mymuduo.dir/EventLoopThreadPool.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mymuduo.dir/EventLoopThreadPool.s"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/douwant/C++Project/Tinymuduo/EventLoopThreadPool.cc -o CMakeFiles/mymuduo.dir/EventLoopThreadPool.s

CMakeFiles/mymuduo.dir/EventLoopThreadPool.o.requires:

.PHONY : CMakeFiles/mymuduo.dir/EventLoopThreadPool.o.requires

CMakeFiles/mymuduo.dir/EventLoopThreadPool.o.provides: CMakeFiles/mymuduo.dir/EventLoopThreadPool.o.requires
	$(MAKE) -f CMakeFiles/mymuduo.dir/build.make CMakeFiles/mymuduo.dir/EventLoopThreadPool.o.provides.build
.PHONY : CMakeFiles/mymuduo.dir/EventLoopThreadPool.o.provides

CMakeFiles/mymuduo.dir/EventLoopThreadPool.o.provides.build: CMakeFiles/mymuduo.dir/EventLoopThreadPool.o


CMakeFiles/mymuduo.dir/EventLoop.o: CMakeFiles/mymuduo.dir/flags.make
CMakeFiles/mymuduo.dir/EventLoop.o: ../EventLoop.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/douwant/C++Project/Tinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/mymuduo.dir/EventLoop.o"
	/opt/rh/devtoolset-11/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mymuduo.dir/EventLoop.o -c /home/douwant/C++Project/Tinymuduo/EventLoop.cc

CMakeFiles/mymuduo.dir/EventLoop.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mymuduo.dir/EventLoop.i"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/douwant/C++Project/Tinymuduo/EventLoop.cc > CMakeFiles/mymuduo.dir/EventLoop.i

CMakeFiles/mymuduo.dir/EventLoop.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mymuduo.dir/EventLoop.s"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/douwant/C++Project/Tinymuduo/EventLoop.cc -o CMakeFiles/mymuduo.dir/EventLoop.s

CMakeFiles/mymuduo.dir/EventLoop.o.requires:

.PHONY : CMakeFiles/mymuduo.dir/EventLoop.o.requires

CMakeFiles/mymuduo.dir/EventLoop.o.provides: CMakeFiles/mymuduo.dir/EventLoop.o.requires
	$(MAKE) -f CMakeFiles/mymuduo.dir/build.make CMakeFiles/mymuduo.dir/EventLoop.o.provides.build
.PHONY : CMakeFiles/mymuduo.dir/EventLoop.o.provides

CMakeFiles/mymuduo.dir/EventLoop.o.provides.build: CMakeFiles/mymuduo.dir/EventLoop.o


CMakeFiles/mymuduo.dir/DefaultPoller.o: CMakeFiles/mymuduo.dir/flags.make
CMakeFiles/mymuduo.dir/DefaultPoller.o: ../DefaultPoller.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/douwant/C++Project/Tinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/mymuduo.dir/DefaultPoller.o"
	/opt/rh/devtoolset-11/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mymuduo.dir/DefaultPoller.o -c /home/douwant/C++Project/Tinymuduo/DefaultPoller.cc

CMakeFiles/mymuduo.dir/DefaultPoller.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mymuduo.dir/DefaultPoller.i"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/douwant/C++Project/Tinymuduo/DefaultPoller.cc > CMakeFiles/mymuduo.dir/DefaultPoller.i

CMakeFiles/mymuduo.dir/DefaultPoller.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mymuduo.dir/DefaultPoller.s"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/douwant/C++Project/Tinymuduo/DefaultPoller.cc -o CMakeFiles/mymuduo.dir/DefaultPoller.s

CMakeFiles/mymuduo.dir/DefaultPoller.o.requires:

.PHONY : CMakeFiles/mymuduo.dir/DefaultPoller.o.requires

CMakeFiles/mymuduo.dir/DefaultPoller.o.provides: CMakeFiles/mymuduo.dir/DefaultPoller.o.requires
	$(MAKE) -f CMakeFiles/mymuduo.dir/build.make CMakeFiles/mymuduo.dir/DefaultPoller.o.provides.build
.PHONY : CMakeFiles/mymuduo.dir/DefaultPoller.o.provides

CMakeFiles/mymuduo.dir/DefaultPoller.o.provides.build: CMakeFiles/mymuduo.dir/DefaultPoller.o


CMakeFiles/mymuduo.dir/Accptor.o: CMakeFiles/mymuduo.dir/flags.make
CMakeFiles/mymuduo.dir/Accptor.o: ../Accptor.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/douwant/C++Project/Tinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/mymuduo.dir/Accptor.o"
	/opt/rh/devtoolset-11/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mymuduo.dir/Accptor.o -c /home/douwant/C++Project/Tinymuduo/Accptor.cc

CMakeFiles/mymuduo.dir/Accptor.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mymuduo.dir/Accptor.i"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/douwant/C++Project/Tinymuduo/Accptor.cc > CMakeFiles/mymuduo.dir/Accptor.i

CMakeFiles/mymuduo.dir/Accptor.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mymuduo.dir/Accptor.s"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/douwant/C++Project/Tinymuduo/Accptor.cc -o CMakeFiles/mymuduo.dir/Accptor.s

CMakeFiles/mymuduo.dir/Accptor.o.requires:

.PHONY : CMakeFiles/mymuduo.dir/Accptor.o.requires

CMakeFiles/mymuduo.dir/Accptor.o.provides: CMakeFiles/mymuduo.dir/Accptor.o.requires
	$(MAKE) -f CMakeFiles/mymuduo.dir/build.make CMakeFiles/mymuduo.dir/Accptor.o.provides.build
.PHONY : CMakeFiles/mymuduo.dir/Accptor.o.provides

CMakeFiles/mymuduo.dir/Accptor.o.provides.build: CMakeFiles/mymuduo.dir/Accptor.o


CMakeFiles/mymuduo.dir/Logger.o: CMakeFiles/mymuduo.dir/flags.make
CMakeFiles/mymuduo.dir/Logger.o: ../Logger.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/douwant/C++Project/Tinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/mymuduo.dir/Logger.o"
	/opt/rh/devtoolset-11/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mymuduo.dir/Logger.o -c /home/douwant/C++Project/Tinymuduo/Logger.cc

CMakeFiles/mymuduo.dir/Logger.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mymuduo.dir/Logger.i"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/douwant/C++Project/Tinymuduo/Logger.cc > CMakeFiles/mymuduo.dir/Logger.i

CMakeFiles/mymuduo.dir/Logger.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mymuduo.dir/Logger.s"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/douwant/C++Project/Tinymuduo/Logger.cc -o CMakeFiles/mymuduo.dir/Logger.s

CMakeFiles/mymuduo.dir/Logger.o.requires:

.PHONY : CMakeFiles/mymuduo.dir/Logger.o.requires

CMakeFiles/mymuduo.dir/Logger.o.provides: CMakeFiles/mymuduo.dir/Logger.o.requires
	$(MAKE) -f CMakeFiles/mymuduo.dir/build.make CMakeFiles/mymuduo.dir/Logger.o.provides.build
.PHONY : CMakeFiles/mymuduo.dir/Logger.o.provides

CMakeFiles/mymuduo.dir/Logger.o.provides.build: CMakeFiles/mymuduo.dir/Logger.o


CMakeFiles/mymuduo.dir/Channel.o: CMakeFiles/mymuduo.dir/flags.make
CMakeFiles/mymuduo.dir/Channel.o: ../Channel.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/douwant/C++Project/Tinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/mymuduo.dir/Channel.o"
	/opt/rh/devtoolset-11/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mymuduo.dir/Channel.o -c /home/douwant/C++Project/Tinymuduo/Channel.cc

CMakeFiles/mymuduo.dir/Channel.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mymuduo.dir/Channel.i"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/douwant/C++Project/Tinymuduo/Channel.cc > CMakeFiles/mymuduo.dir/Channel.i

CMakeFiles/mymuduo.dir/Channel.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mymuduo.dir/Channel.s"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/douwant/C++Project/Tinymuduo/Channel.cc -o CMakeFiles/mymuduo.dir/Channel.s

CMakeFiles/mymuduo.dir/Channel.o.requires:

.PHONY : CMakeFiles/mymuduo.dir/Channel.o.requires

CMakeFiles/mymuduo.dir/Channel.o.provides: CMakeFiles/mymuduo.dir/Channel.o.requires
	$(MAKE) -f CMakeFiles/mymuduo.dir/build.make CMakeFiles/mymuduo.dir/Channel.o.provides.build
.PHONY : CMakeFiles/mymuduo.dir/Channel.o.provides

CMakeFiles/mymuduo.dir/Channel.o.provides.build: CMakeFiles/mymuduo.dir/Channel.o


CMakeFiles/mymuduo.dir/EPollPoller.o: CMakeFiles/mymuduo.dir/flags.make
CMakeFiles/mymuduo.dir/EPollPoller.o: ../EPollPoller.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/douwant/C++Project/Tinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/mymuduo.dir/EPollPoller.o"
	/opt/rh/devtoolset-11/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mymuduo.dir/EPollPoller.o -c /home/douwant/C++Project/Tinymuduo/EPollPoller.cc

CMakeFiles/mymuduo.dir/EPollPoller.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mymuduo.dir/EPollPoller.i"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/douwant/C++Project/Tinymuduo/EPollPoller.cc > CMakeFiles/mymuduo.dir/EPollPoller.i

CMakeFiles/mymuduo.dir/EPollPoller.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mymuduo.dir/EPollPoller.s"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/douwant/C++Project/Tinymuduo/EPollPoller.cc -o CMakeFiles/mymuduo.dir/EPollPoller.s

CMakeFiles/mymuduo.dir/EPollPoller.o.requires:

.PHONY : CMakeFiles/mymuduo.dir/EPollPoller.o.requires

CMakeFiles/mymuduo.dir/EPollPoller.o.provides: CMakeFiles/mymuduo.dir/EPollPoller.o.requires
	$(MAKE) -f CMakeFiles/mymuduo.dir/build.make CMakeFiles/mymuduo.dir/EPollPoller.o.provides.build
.PHONY : CMakeFiles/mymuduo.dir/EPollPoller.o.provides

CMakeFiles/mymuduo.dir/EPollPoller.o.provides.build: CMakeFiles/mymuduo.dir/EPollPoller.o


CMakeFiles/mymuduo.dir/TcpConnection.o: CMakeFiles/mymuduo.dir/flags.make
CMakeFiles/mymuduo.dir/TcpConnection.o: ../TcpConnection.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/douwant/C++Project/Tinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/mymuduo.dir/TcpConnection.o"
	/opt/rh/devtoolset-11/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mymuduo.dir/TcpConnection.o -c /home/douwant/C++Project/Tinymuduo/TcpConnection.cc

CMakeFiles/mymuduo.dir/TcpConnection.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mymuduo.dir/TcpConnection.i"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/douwant/C++Project/Tinymuduo/TcpConnection.cc > CMakeFiles/mymuduo.dir/TcpConnection.i

CMakeFiles/mymuduo.dir/TcpConnection.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mymuduo.dir/TcpConnection.s"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/douwant/C++Project/Tinymuduo/TcpConnection.cc -o CMakeFiles/mymuduo.dir/TcpConnection.s

CMakeFiles/mymuduo.dir/TcpConnection.o.requires:

.PHONY : CMakeFiles/mymuduo.dir/TcpConnection.o.requires

CMakeFiles/mymuduo.dir/TcpConnection.o.provides: CMakeFiles/mymuduo.dir/TcpConnection.o.requires
	$(MAKE) -f CMakeFiles/mymuduo.dir/build.make CMakeFiles/mymuduo.dir/TcpConnection.o.provides.build
.PHONY : CMakeFiles/mymuduo.dir/TcpConnection.o.provides

CMakeFiles/mymuduo.dir/TcpConnection.o.provides.build: CMakeFiles/mymuduo.dir/TcpConnection.o


CMakeFiles/mymuduo.dir/Buffer.o: CMakeFiles/mymuduo.dir/flags.make
CMakeFiles/mymuduo.dir/Buffer.o: ../Buffer.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/douwant/C++Project/Tinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/mymuduo.dir/Buffer.o"
	/opt/rh/devtoolset-11/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mymuduo.dir/Buffer.o -c /home/douwant/C++Project/Tinymuduo/Buffer.cc

CMakeFiles/mymuduo.dir/Buffer.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mymuduo.dir/Buffer.i"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/douwant/C++Project/Tinymuduo/Buffer.cc > CMakeFiles/mymuduo.dir/Buffer.i

CMakeFiles/mymuduo.dir/Buffer.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mymuduo.dir/Buffer.s"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/douwant/C++Project/Tinymuduo/Buffer.cc -o CMakeFiles/mymuduo.dir/Buffer.s

CMakeFiles/mymuduo.dir/Buffer.o.requires:

.PHONY : CMakeFiles/mymuduo.dir/Buffer.o.requires

CMakeFiles/mymuduo.dir/Buffer.o.provides: CMakeFiles/mymuduo.dir/Buffer.o.requires
	$(MAKE) -f CMakeFiles/mymuduo.dir/build.make CMakeFiles/mymuduo.dir/Buffer.o.provides.build
.PHONY : CMakeFiles/mymuduo.dir/Buffer.o.provides

CMakeFiles/mymuduo.dir/Buffer.o.provides.build: CMakeFiles/mymuduo.dir/Buffer.o


CMakeFiles/mymuduo.dir/Thread.o: CMakeFiles/mymuduo.dir/flags.make
CMakeFiles/mymuduo.dir/Thread.o: ../Thread.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/douwant/C++Project/Tinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object CMakeFiles/mymuduo.dir/Thread.o"
	/opt/rh/devtoolset-11/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mymuduo.dir/Thread.o -c /home/douwant/C++Project/Tinymuduo/Thread.cc

CMakeFiles/mymuduo.dir/Thread.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mymuduo.dir/Thread.i"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/douwant/C++Project/Tinymuduo/Thread.cc > CMakeFiles/mymuduo.dir/Thread.i

CMakeFiles/mymuduo.dir/Thread.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mymuduo.dir/Thread.s"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/douwant/C++Project/Tinymuduo/Thread.cc -o CMakeFiles/mymuduo.dir/Thread.s

CMakeFiles/mymuduo.dir/Thread.o.requires:

.PHONY : CMakeFiles/mymuduo.dir/Thread.o.requires

CMakeFiles/mymuduo.dir/Thread.o.provides: CMakeFiles/mymuduo.dir/Thread.o.requires
	$(MAKE) -f CMakeFiles/mymuduo.dir/build.make CMakeFiles/mymuduo.dir/Thread.o.provides.build
.PHONY : CMakeFiles/mymuduo.dir/Thread.o.provides

CMakeFiles/mymuduo.dir/Thread.o.provides.build: CMakeFiles/mymuduo.dir/Thread.o


CMakeFiles/mymuduo.dir/CurrentThread.o: CMakeFiles/mymuduo.dir/flags.make
CMakeFiles/mymuduo.dir/CurrentThread.o: ../CurrentThread.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/douwant/C++Project/Tinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object CMakeFiles/mymuduo.dir/CurrentThread.o"
	/opt/rh/devtoolset-11/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mymuduo.dir/CurrentThread.o -c /home/douwant/C++Project/Tinymuduo/CurrentThread.cc

CMakeFiles/mymuduo.dir/CurrentThread.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mymuduo.dir/CurrentThread.i"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/douwant/C++Project/Tinymuduo/CurrentThread.cc > CMakeFiles/mymuduo.dir/CurrentThread.i

CMakeFiles/mymuduo.dir/CurrentThread.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mymuduo.dir/CurrentThread.s"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/douwant/C++Project/Tinymuduo/CurrentThread.cc -o CMakeFiles/mymuduo.dir/CurrentThread.s

CMakeFiles/mymuduo.dir/CurrentThread.o.requires:

.PHONY : CMakeFiles/mymuduo.dir/CurrentThread.o.requires

CMakeFiles/mymuduo.dir/CurrentThread.o.provides: CMakeFiles/mymuduo.dir/CurrentThread.o.requires
	$(MAKE) -f CMakeFiles/mymuduo.dir/build.make CMakeFiles/mymuduo.dir/CurrentThread.o.provides.build
.PHONY : CMakeFiles/mymuduo.dir/CurrentThread.o.provides

CMakeFiles/mymuduo.dir/CurrentThread.o.provides.build: CMakeFiles/mymuduo.dir/CurrentThread.o


CMakeFiles/mymuduo.dir/EventLoopThread.o: CMakeFiles/mymuduo.dir/flags.make
CMakeFiles/mymuduo.dir/EventLoopThread.o: ../EventLoopThread.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/douwant/C++Project/Tinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object CMakeFiles/mymuduo.dir/EventLoopThread.o"
	/opt/rh/devtoolset-11/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mymuduo.dir/EventLoopThread.o -c /home/douwant/C++Project/Tinymuduo/EventLoopThread.cc

CMakeFiles/mymuduo.dir/EventLoopThread.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mymuduo.dir/EventLoopThread.i"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/douwant/C++Project/Tinymuduo/EventLoopThread.cc > CMakeFiles/mymuduo.dir/EventLoopThread.i

CMakeFiles/mymuduo.dir/EventLoopThread.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mymuduo.dir/EventLoopThread.s"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/douwant/C++Project/Tinymuduo/EventLoopThread.cc -o CMakeFiles/mymuduo.dir/EventLoopThread.s

CMakeFiles/mymuduo.dir/EventLoopThread.o.requires:

.PHONY : CMakeFiles/mymuduo.dir/EventLoopThread.o.requires

CMakeFiles/mymuduo.dir/EventLoopThread.o.provides: CMakeFiles/mymuduo.dir/EventLoopThread.o.requires
	$(MAKE) -f CMakeFiles/mymuduo.dir/build.make CMakeFiles/mymuduo.dir/EventLoopThread.o.provides.build
.PHONY : CMakeFiles/mymuduo.dir/EventLoopThread.o.provides

CMakeFiles/mymuduo.dir/EventLoopThread.o.provides.build: CMakeFiles/mymuduo.dir/EventLoopThread.o


CMakeFiles/mymuduo.dir/Socket.o: CMakeFiles/mymuduo.dir/flags.make
CMakeFiles/mymuduo.dir/Socket.o: ../Socket.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/douwant/C++Project/Tinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building CXX object CMakeFiles/mymuduo.dir/Socket.o"
	/opt/rh/devtoolset-11/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mymuduo.dir/Socket.o -c /home/douwant/C++Project/Tinymuduo/Socket.cc

CMakeFiles/mymuduo.dir/Socket.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mymuduo.dir/Socket.i"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/douwant/C++Project/Tinymuduo/Socket.cc > CMakeFiles/mymuduo.dir/Socket.i

CMakeFiles/mymuduo.dir/Socket.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mymuduo.dir/Socket.s"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/douwant/C++Project/Tinymuduo/Socket.cc -o CMakeFiles/mymuduo.dir/Socket.s

CMakeFiles/mymuduo.dir/Socket.o.requires:

.PHONY : CMakeFiles/mymuduo.dir/Socket.o.requires

CMakeFiles/mymuduo.dir/Socket.o.provides: CMakeFiles/mymuduo.dir/Socket.o.requires
	$(MAKE) -f CMakeFiles/mymuduo.dir/build.make CMakeFiles/mymuduo.dir/Socket.o.provides.build
.PHONY : CMakeFiles/mymuduo.dir/Socket.o.provides

CMakeFiles/mymuduo.dir/Socket.o.provides.build: CMakeFiles/mymuduo.dir/Socket.o


CMakeFiles/mymuduo.dir/Poller.o: CMakeFiles/mymuduo.dir/flags.make
CMakeFiles/mymuduo.dir/Poller.o: ../Poller.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/douwant/C++Project/Tinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building CXX object CMakeFiles/mymuduo.dir/Poller.o"
	/opt/rh/devtoolset-11/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mymuduo.dir/Poller.o -c /home/douwant/C++Project/Tinymuduo/Poller.cc

CMakeFiles/mymuduo.dir/Poller.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mymuduo.dir/Poller.i"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/douwant/C++Project/Tinymuduo/Poller.cc > CMakeFiles/mymuduo.dir/Poller.i

CMakeFiles/mymuduo.dir/Poller.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mymuduo.dir/Poller.s"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/douwant/C++Project/Tinymuduo/Poller.cc -o CMakeFiles/mymuduo.dir/Poller.s

CMakeFiles/mymuduo.dir/Poller.o.requires:

.PHONY : CMakeFiles/mymuduo.dir/Poller.o.requires

CMakeFiles/mymuduo.dir/Poller.o.provides: CMakeFiles/mymuduo.dir/Poller.o.requires
	$(MAKE) -f CMakeFiles/mymuduo.dir/build.make CMakeFiles/mymuduo.dir/Poller.o.provides.build
.PHONY : CMakeFiles/mymuduo.dir/Poller.o.provides

CMakeFiles/mymuduo.dir/Poller.o.provides.build: CMakeFiles/mymuduo.dir/Poller.o


CMakeFiles/mymuduo.dir/InetAddress.o: CMakeFiles/mymuduo.dir/flags.make
CMakeFiles/mymuduo.dir/InetAddress.o: ../InetAddress.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/douwant/C++Project/Tinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Building CXX object CMakeFiles/mymuduo.dir/InetAddress.o"
	/opt/rh/devtoolset-11/root/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mymuduo.dir/InetAddress.o -c /home/douwant/C++Project/Tinymuduo/InetAddress.cc

CMakeFiles/mymuduo.dir/InetAddress.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mymuduo.dir/InetAddress.i"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/douwant/C++Project/Tinymuduo/InetAddress.cc > CMakeFiles/mymuduo.dir/InetAddress.i

CMakeFiles/mymuduo.dir/InetAddress.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mymuduo.dir/InetAddress.s"
	/opt/rh/devtoolset-11/root/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/douwant/C++Project/Tinymuduo/InetAddress.cc -o CMakeFiles/mymuduo.dir/InetAddress.s

CMakeFiles/mymuduo.dir/InetAddress.o.requires:

.PHONY : CMakeFiles/mymuduo.dir/InetAddress.o.requires

CMakeFiles/mymuduo.dir/InetAddress.o.provides: CMakeFiles/mymuduo.dir/InetAddress.o.requires
	$(MAKE) -f CMakeFiles/mymuduo.dir/build.make CMakeFiles/mymuduo.dir/InetAddress.o.provides.build
.PHONY : CMakeFiles/mymuduo.dir/InetAddress.o.provides

CMakeFiles/mymuduo.dir/InetAddress.o.provides.build: CMakeFiles/mymuduo.dir/InetAddress.o


# Object files for target mymuduo
mymuduo_OBJECTS = \
"CMakeFiles/mymuduo.dir/Timestamp.o" \
"CMakeFiles/mymuduo.dir/TcpServer.o" \
"CMakeFiles/mymuduo.dir/EventLoopThreadPool.o" \
"CMakeFiles/mymuduo.dir/EventLoop.o" \
"CMakeFiles/mymuduo.dir/DefaultPoller.o" \
"CMakeFiles/mymuduo.dir/Accptor.o" \
"CMakeFiles/mymuduo.dir/Logger.o" \
"CMakeFiles/mymuduo.dir/Channel.o" \
"CMakeFiles/mymuduo.dir/EPollPoller.o" \
"CMakeFiles/mymuduo.dir/TcpConnection.o" \
"CMakeFiles/mymuduo.dir/Buffer.o" \
"CMakeFiles/mymuduo.dir/Thread.o" \
"CMakeFiles/mymuduo.dir/CurrentThread.o" \
"CMakeFiles/mymuduo.dir/EventLoopThread.o" \
"CMakeFiles/mymuduo.dir/Socket.o" \
"CMakeFiles/mymuduo.dir/Poller.o" \
"CMakeFiles/mymuduo.dir/InetAddress.o"

# External object files for target mymuduo
mymuduo_EXTERNAL_OBJECTS =

../lib/libmymuduo.so: CMakeFiles/mymuduo.dir/Timestamp.o
../lib/libmymuduo.so: CMakeFiles/mymuduo.dir/TcpServer.o
../lib/libmymuduo.so: CMakeFiles/mymuduo.dir/EventLoopThreadPool.o
../lib/libmymuduo.so: CMakeFiles/mymuduo.dir/EventLoop.o
../lib/libmymuduo.so: CMakeFiles/mymuduo.dir/DefaultPoller.o
../lib/libmymuduo.so: CMakeFiles/mymuduo.dir/Accptor.o
../lib/libmymuduo.so: CMakeFiles/mymuduo.dir/Logger.o
../lib/libmymuduo.so: CMakeFiles/mymuduo.dir/Channel.o
../lib/libmymuduo.so: CMakeFiles/mymuduo.dir/EPollPoller.o
../lib/libmymuduo.so: CMakeFiles/mymuduo.dir/TcpConnection.o
../lib/libmymuduo.so: CMakeFiles/mymuduo.dir/Buffer.o
../lib/libmymuduo.so: CMakeFiles/mymuduo.dir/Thread.o
../lib/libmymuduo.so: CMakeFiles/mymuduo.dir/CurrentThread.o
../lib/libmymuduo.so: CMakeFiles/mymuduo.dir/EventLoopThread.o
../lib/libmymuduo.so: CMakeFiles/mymuduo.dir/Socket.o
../lib/libmymuduo.so: CMakeFiles/mymuduo.dir/Poller.o
../lib/libmymuduo.so: CMakeFiles/mymuduo.dir/InetAddress.o
../lib/libmymuduo.so: CMakeFiles/mymuduo.dir/build.make
../lib/libmymuduo.so: CMakeFiles/mymuduo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/douwant/C++Project/Tinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_18) "Linking CXX shared library ../lib/libmymuduo.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mymuduo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/mymuduo.dir/build: ../lib/libmymuduo.so

.PHONY : CMakeFiles/mymuduo.dir/build

CMakeFiles/mymuduo.dir/requires: CMakeFiles/mymuduo.dir/Timestamp.o.requires
CMakeFiles/mymuduo.dir/requires: CMakeFiles/mymuduo.dir/TcpServer.o.requires
CMakeFiles/mymuduo.dir/requires: CMakeFiles/mymuduo.dir/EventLoopThreadPool.o.requires
CMakeFiles/mymuduo.dir/requires: CMakeFiles/mymuduo.dir/EventLoop.o.requires
CMakeFiles/mymuduo.dir/requires: CMakeFiles/mymuduo.dir/DefaultPoller.o.requires
CMakeFiles/mymuduo.dir/requires: CMakeFiles/mymuduo.dir/Accptor.o.requires
CMakeFiles/mymuduo.dir/requires: CMakeFiles/mymuduo.dir/Logger.o.requires
CMakeFiles/mymuduo.dir/requires: CMakeFiles/mymuduo.dir/Channel.o.requires
CMakeFiles/mymuduo.dir/requires: CMakeFiles/mymuduo.dir/EPollPoller.o.requires
CMakeFiles/mymuduo.dir/requires: CMakeFiles/mymuduo.dir/TcpConnection.o.requires
CMakeFiles/mymuduo.dir/requires: CMakeFiles/mymuduo.dir/Buffer.o.requires
CMakeFiles/mymuduo.dir/requires: CMakeFiles/mymuduo.dir/Thread.o.requires
CMakeFiles/mymuduo.dir/requires: CMakeFiles/mymuduo.dir/CurrentThread.o.requires
CMakeFiles/mymuduo.dir/requires: CMakeFiles/mymuduo.dir/EventLoopThread.o.requires
CMakeFiles/mymuduo.dir/requires: CMakeFiles/mymuduo.dir/Socket.o.requires
CMakeFiles/mymuduo.dir/requires: CMakeFiles/mymuduo.dir/Poller.o.requires
CMakeFiles/mymuduo.dir/requires: CMakeFiles/mymuduo.dir/InetAddress.o.requires

.PHONY : CMakeFiles/mymuduo.dir/requires

CMakeFiles/mymuduo.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mymuduo.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mymuduo.dir/clean

CMakeFiles/mymuduo.dir/depend:
	cd /home/douwant/C++Project/Tinymuduo/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/douwant/C++Project/Tinymuduo /home/douwant/C++Project/Tinymuduo /home/douwant/C++Project/Tinymuduo/build /home/douwant/C++Project/Tinymuduo/build /home/douwant/C++Project/Tinymuduo/build/CMakeFiles/mymuduo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mymuduo.dir/depend
