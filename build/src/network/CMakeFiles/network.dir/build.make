# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/achene/c++_project/Xserver

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/achene/c++_project/Xserver/build

# Include any dependencies generated for this target.
include src/network/CMakeFiles/network.dir/depend.make

# Include the progress variables for this target.
include src/network/CMakeFiles/network.dir/progress.make

# Include the compile flags for this target's objects.
include src/network/CMakeFiles/network.dir/flags.make

src/network/CMakeFiles/network.dir/Acceptor.cpp.o: src/network/CMakeFiles/network.dir/flags.make
src/network/CMakeFiles/network.dir/Acceptor.cpp.o: ../src/network/Acceptor.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/network/CMakeFiles/network.dir/Acceptor.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/network.dir/Acceptor.cpp.o -c /home/achene/c++_project/Xserver/src/network/Acceptor.cpp

src/network/CMakeFiles/network.dir/Acceptor.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/network.dir/Acceptor.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/network/Acceptor.cpp > CMakeFiles/network.dir/Acceptor.cpp.i

src/network/CMakeFiles/network.dir/Acceptor.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/network.dir/Acceptor.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/network/Acceptor.cpp -o CMakeFiles/network.dir/Acceptor.cpp.s

src/network/CMakeFiles/network.dir/Buffer.cpp.o: src/network/CMakeFiles/network.dir/flags.make
src/network/CMakeFiles/network.dir/Buffer.cpp.o: ../src/network/Buffer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/network/CMakeFiles/network.dir/Buffer.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/network.dir/Buffer.cpp.o -c /home/achene/c++_project/Xserver/src/network/Buffer.cpp

src/network/CMakeFiles/network.dir/Buffer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/network.dir/Buffer.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/network/Buffer.cpp > CMakeFiles/network.dir/Buffer.cpp.i

src/network/CMakeFiles/network.dir/Buffer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/network.dir/Buffer.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/network/Buffer.cpp -o CMakeFiles/network.dir/Buffer.cpp.s

src/network/CMakeFiles/network.dir/Channel.cpp.o: src/network/CMakeFiles/network.dir/flags.make
src/network/CMakeFiles/network.dir/Channel.cpp.o: ../src/network/Channel.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/network/CMakeFiles/network.dir/Channel.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/network.dir/Channel.cpp.o -c /home/achene/c++_project/Xserver/src/network/Channel.cpp

src/network/CMakeFiles/network.dir/Channel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/network.dir/Channel.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/network/Channel.cpp > CMakeFiles/network.dir/Channel.cpp.i

src/network/CMakeFiles/network.dir/Channel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/network.dir/Channel.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/network/Channel.cpp -o CMakeFiles/network.dir/Channel.cpp.s

src/network/CMakeFiles/network.dir/Connector.cpp.o: src/network/CMakeFiles/network.dir/flags.make
src/network/CMakeFiles/network.dir/Connector.cpp.o: ../src/network/Connector.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/network/CMakeFiles/network.dir/Connector.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/network.dir/Connector.cpp.o -c /home/achene/c++_project/Xserver/src/network/Connector.cpp

src/network/CMakeFiles/network.dir/Connector.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/network.dir/Connector.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/network/Connector.cpp > CMakeFiles/network.dir/Connector.cpp.i

src/network/CMakeFiles/network.dir/Connector.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/network.dir/Connector.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/network/Connector.cpp -o CMakeFiles/network.dir/Connector.cpp.s

src/network/CMakeFiles/network.dir/CurrentThread.cpp.o: src/network/CMakeFiles/network.dir/flags.make
src/network/CMakeFiles/network.dir/CurrentThread.cpp.o: ../src/network/CurrentThread.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/network/CMakeFiles/network.dir/CurrentThread.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/network.dir/CurrentThread.cpp.o -c /home/achene/c++_project/Xserver/src/network/CurrentThread.cpp

src/network/CMakeFiles/network.dir/CurrentThread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/network.dir/CurrentThread.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/network/CurrentThread.cpp > CMakeFiles/network.dir/CurrentThread.cpp.i

src/network/CMakeFiles/network.dir/CurrentThread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/network.dir/CurrentThread.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/network/CurrentThread.cpp -o CMakeFiles/network.dir/CurrentThread.cpp.s

src/network/CMakeFiles/network.dir/DefaultPoller.cpp.o: src/network/CMakeFiles/network.dir/flags.make
src/network/CMakeFiles/network.dir/DefaultPoller.cpp.o: ../src/network/DefaultPoller.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/network/CMakeFiles/network.dir/DefaultPoller.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/network.dir/DefaultPoller.cpp.o -c /home/achene/c++_project/Xserver/src/network/DefaultPoller.cpp

src/network/CMakeFiles/network.dir/DefaultPoller.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/network.dir/DefaultPoller.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/network/DefaultPoller.cpp > CMakeFiles/network.dir/DefaultPoller.cpp.i

src/network/CMakeFiles/network.dir/DefaultPoller.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/network.dir/DefaultPoller.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/network/DefaultPoller.cpp -o CMakeFiles/network.dir/DefaultPoller.cpp.s

src/network/CMakeFiles/network.dir/EPollPoller.cpp.o: src/network/CMakeFiles/network.dir/flags.make
src/network/CMakeFiles/network.dir/EPollPoller.cpp.o: ../src/network/EPollPoller.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object src/network/CMakeFiles/network.dir/EPollPoller.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/network.dir/EPollPoller.cpp.o -c /home/achene/c++_project/Xserver/src/network/EPollPoller.cpp

src/network/CMakeFiles/network.dir/EPollPoller.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/network.dir/EPollPoller.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/network/EPollPoller.cpp > CMakeFiles/network.dir/EPollPoller.cpp.i

src/network/CMakeFiles/network.dir/EPollPoller.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/network.dir/EPollPoller.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/network/EPollPoller.cpp -o CMakeFiles/network.dir/EPollPoller.cpp.s

src/network/CMakeFiles/network.dir/EventLoop.cpp.o: src/network/CMakeFiles/network.dir/flags.make
src/network/CMakeFiles/network.dir/EventLoop.cpp.o: ../src/network/EventLoop.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object src/network/CMakeFiles/network.dir/EventLoop.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/network.dir/EventLoop.cpp.o -c /home/achene/c++_project/Xserver/src/network/EventLoop.cpp

src/network/CMakeFiles/network.dir/EventLoop.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/network.dir/EventLoop.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/network/EventLoop.cpp > CMakeFiles/network.dir/EventLoop.cpp.i

src/network/CMakeFiles/network.dir/EventLoop.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/network.dir/EventLoop.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/network/EventLoop.cpp -o CMakeFiles/network.dir/EventLoop.cpp.s

src/network/CMakeFiles/network.dir/EventLoopThread.cpp.o: src/network/CMakeFiles/network.dir/flags.make
src/network/CMakeFiles/network.dir/EventLoopThread.cpp.o: ../src/network/EventLoopThread.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object src/network/CMakeFiles/network.dir/EventLoopThread.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/network.dir/EventLoopThread.cpp.o -c /home/achene/c++_project/Xserver/src/network/EventLoopThread.cpp

src/network/CMakeFiles/network.dir/EventLoopThread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/network.dir/EventLoopThread.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/network/EventLoopThread.cpp > CMakeFiles/network.dir/EventLoopThread.cpp.i

src/network/CMakeFiles/network.dir/EventLoopThread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/network.dir/EventLoopThread.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/network/EventLoopThread.cpp -o CMakeFiles/network.dir/EventLoopThread.cpp.s

src/network/CMakeFiles/network.dir/EventLoopThreadPool.cpp.o: src/network/CMakeFiles/network.dir/flags.make
src/network/CMakeFiles/network.dir/EventLoopThreadPool.cpp.o: ../src/network/EventLoopThreadPool.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object src/network/CMakeFiles/network.dir/EventLoopThreadPool.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/network.dir/EventLoopThreadPool.cpp.o -c /home/achene/c++_project/Xserver/src/network/EventLoopThreadPool.cpp

src/network/CMakeFiles/network.dir/EventLoopThreadPool.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/network.dir/EventLoopThreadPool.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/network/EventLoopThreadPool.cpp > CMakeFiles/network.dir/EventLoopThreadPool.cpp.i

src/network/CMakeFiles/network.dir/EventLoopThreadPool.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/network.dir/EventLoopThreadPool.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/network/EventLoopThreadPool.cpp -o CMakeFiles/network.dir/EventLoopThreadPool.cpp.s

src/network/CMakeFiles/network.dir/InetAddress.cpp.o: src/network/CMakeFiles/network.dir/flags.make
src/network/CMakeFiles/network.dir/InetAddress.cpp.o: ../src/network/InetAddress.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object src/network/CMakeFiles/network.dir/InetAddress.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/network.dir/InetAddress.cpp.o -c /home/achene/c++_project/Xserver/src/network/InetAddress.cpp

src/network/CMakeFiles/network.dir/InetAddress.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/network.dir/InetAddress.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/network/InetAddress.cpp > CMakeFiles/network.dir/InetAddress.cpp.i

src/network/CMakeFiles/network.dir/InetAddress.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/network.dir/InetAddress.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/network/InetAddress.cpp -o CMakeFiles/network.dir/InetAddress.cpp.s

src/network/CMakeFiles/network.dir/Poller.cpp.o: src/network/CMakeFiles/network.dir/flags.make
src/network/CMakeFiles/network.dir/Poller.cpp.o: ../src/network/Poller.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object src/network/CMakeFiles/network.dir/Poller.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/network.dir/Poller.cpp.o -c /home/achene/c++_project/Xserver/src/network/Poller.cpp

src/network/CMakeFiles/network.dir/Poller.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/network.dir/Poller.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/network/Poller.cpp > CMakeFiles/network.dir/Poller.cpp.i

src/network/CMakeFiles/network.dir/Poller.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/network.dir/Poller.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/network/Poller.cpp -o CMakeFiles/network.dir/Poller.cpp.s

src/network/CMakeFiles/network.dir/Socket.cpp.o: src/network/CMakeFiles/network.dir/flags.make
src/network/CMakeFiles/network.dir/Socket.cpp.o: ../src/network/Socket.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object src/network/CMakeFiles/network.dir/Socket.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/network.dir/Socket.cpp.o -c /home/achene/c++_project/Xserver/src/network/Socket.cpp

src/network/CMakeFiles/network.dir/Socket.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/network.dir/Socket.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/network/Socket.cpp > CMakeFiles/network.dir/Socket.cpp.i

src/network/CMakeFiles/network.dir/Socket.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/network.dir/Socket.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/network/Socket.cpp -o CMakeFiles/network.dir/Socket.cpp.s

src/network/CMakeFiles/network.dir/SocketsOps.cpp.o: src/network/CMakeFiles/network.dir/flags.make
src/network/CMakeFiles/network.dir/SocketsOps.cpp.o: ../src/network/SocketsOps.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object src/network/CMakeFiles/network.dir/SocketsOps.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/network.dir/SocketsOps.cpp.o -c /home/achene/c++_project/Xserver/src/network/SocketsOps.cpp

src/network/CMakeFiles/network.dir/SocketsOps.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/network.dir/SocketsOps.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/network/SocketsOps.cpp > CMakeFiles/network.dir/SocketsOps.cpp.i

src/network/CMakeFiles/network.dir/SocketsOps.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/network.dir/SocketsOps.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/network/SocketsOps.cpp -o CMakeFiles/network.dir/SocketsOps.cpp.s

src/network/CMakeFiles/network.dir/TcpClient.cpp.o: src/network/CMakeFiles/network.dir/flags.make
src/network/CMakeFiles/network.dir/TcpClient.cpp.o: ../src/network/TcpClient.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building CXX object src/network/CMakeFiles/network.dir/TcpClient.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/network.dir/TcpClient.cpp.o -c /home/achene/c++_project/Xserver/src/network/TcpClient.cpp

src/network/CMakeFiles/network.dir/TcpClient.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/network.dir/TcpClient.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/network/TcpClient.cpp > CMakeFiles/network.dir/TcpClient.cpp.i

src/network/CMakeFiles/network.dir/TcpClient.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/network.dir/TcpClient.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/network/TcpClient.cpp -o CMakeFiles/network.dir/TcpClient.cpp.s

src/network/CMakeFiles/network.dir/TcpConnection.cpp.o: src/network/CMakeFiles/network.dir/flags.make
src/network/CMakeFiles/network.dir/TcpConnection.cpp.o: ../src/network/TcpConnection.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building CXX object src/network/CMakeFiles/network.dir/TcpConnection.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/network.dir/TcpConnection.cpp.o -c /home/achene/c++_project/Xserver/src/network/TcpConnection.cpp

src/network/CMakeFiles/network.dir/TcpConnection.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/network.dir/TcpConnection.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/network/TcpConnection.cpp > CMakeFiles/network.dir/TcpConnection.cpp.i

src/network/CMakeFiles/network.dir/TcpConnection.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/network.dir/TcpConnection.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/network/TcpConnection.cpp -o CMakeFiles/network.dir/TcpConnection.cpp.s

src/network/CMakeFiles/network.dir/TcpServer.cpp.o: src/network/CMakeFiles/network.dir/flags.make
src/network/CMakeFiles/network.dir/TcpServer.cpp.o: ../src/network/TcpServer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Building CXX object src/network/CMakeFiles/network.dir/TcpServer.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/network.dir/TcpServer.cpp.o -c /home/achene/c++_project/Xserver/src/network/TcpServer.cpp

src/network/CMakeFiles/network.dir/TcpServer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/network.dir/TcpServer.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/network/TcpServer.cpp > CMakeFiles/network.dir/TcpServer.cpp.i

src/network/CMakeFiles/network.dir/TcpServer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/network.dir/TcpServer.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/network/TcpServer.cpp -o CMakeFiles/network.dir/TcpServer.cpp.s

src/network/CMakeFiles/network.dir/Thread.cpp.o: src/network/CMakeFiles/network.dir/flags.make
src/network/CMakeFiles/network.dir/Thread.cpp.o: ../src/network/Thread.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_18) "Building CXX object src/network/CMakeFiles/network.dir/Thread.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/network.dir/Thread.cpp.o -c /home/achene/c++_project/Xserver/src/network/Thread.cpp

src/network/CMakeFiles/network.dir/Thread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/network.dir/Thread.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/network/Thread.cpp > CMakeFiles/network.dir/Thread.cpp.i

src/network/CMakeFiles/network.dir/Thread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/network.dir/Thread.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/network/Thread.cpp -o CMakeFiles/network.dir/Thread.cpp.s

src/network/CMakeFiles/network.dir/TimingWheel.cpp.o: src/network/CMakeFiles/network.dir/flags.make
src/network/CMakeFiles/network.dir/TimingWheel.cpp.o: ../src/network/TimingWheel.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_19) "Building CXX object src/network/CMakeFiles/network.dir/TimingWheel.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/network.dir/TimingWheel.cpp.o -c /home/achene/c++_project/Xserver/src/network/TimingWheel.cpp

src/network/CMakeFiles/network.dir/TimingWheel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/network.dir/TimingWheel.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/network/TimingWheel.cpp > CMakeFiles/network.dir/TimingWheel.cpp.i

src/network/CMakeFiles/network.dir/TimingWheel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/network.dir/TimingWheel.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/network && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/network/TimingWheel.cpp -o CMakeFiles/network.dir/TimingWheel.cpp.s

# Object files for target network
network_OBJECTS = \
"CMakeFiles/network.dir/Acceptor.cpp.o" \
"CMakeFiles/network.dir/Buffer.cpp.o" \
"CMakeFiles/network.dir/Channel.cpp.o" \
"CMakeFiles/network.dir/Connector.cpp.o" \
"CMakeFiles/network.dir/CurrentThread.cpp.o" \
"CMakeFiles/network.dir/DefaultPoller.cpp.o" \
"CMakeFiles/network.dir/EPollPoller.cpp.o" \
"CMakeFiles/network.dir/EventLoop.cpp.o" \
"CMakeFiles/network.dir/EventLoopThread.cpp.o" \
"CMakeFiles/network.dir/EventLoopThreadPool.cpp.o" \
"CMakeFiles/network.dir/InetAddress.cpp.o" \
"CMakeFiles/network.dir/Poller.cpp.o" \
"CMakeFiles/network.dir/Socket.cpp.o" \
"CMakeFiles/network.dir/SocketsOps.cpp.o" \
"CMakeFiles/network.dir/TcpClient.cpp.o" \
"CMakeFiles/network.dir/TcpConnection.cpp.o" \
"CMakeFiles/network.dir/TcpServer.cpp.o" \
"CMakeFiles/network.dir/Thread.cpp.o" \
"CMakeFiles/network.dir/TimingWheel.cpp.o"

# External object files for target network
network_EXTERNAL_OBJECTS =

src/network/libnetwork.a: src/network/CMakeFiles/network.dir/Acceptor.cpp.o
src/network/libnetwork.a: src/network/CMakeFiles/network.dir/Buffer.cpp.o
src/network/libnetwork.a: src/network/CMakeFiles/network.dir/Channel.cpp.o
src/network/libnetwork.a: src/network/CMakeFiles/network.dir/Connector.cpp.o
src/network/libnetwork.a: src/network/CMakeFiles/network.dir/CurrentThread.cpp.o
src/network/libnetwork.a: src/network/CMakeFiles/network.dir/DefaultPoller.cpp.o
src/network/libnetwork.a: src/network/CMakeFiles/network.dir/EPollPoller.cpp.o
src/network/libnetwork.a: src/network/CMakeFiles/network.dir/EventLoop.cpp.o
src/network/libnetwork.a: src/network/CMakeFiles/network.dir/EventLoopThread.cpp.o
src/network/libnetwork.a: src/network/CMakeFiles/network.dir/EventLoopThreadPool.cpp.o
src/network/libnetwork.a: src/network/CMakeFiles/network.dir/InetAddress.cpp.o
src/network/libnetwork.a: src/network/CMakeFiles/network.dir/Poller.cpp.o
src/network/libnetwork.a: src/network/CMakeFiles/network.dir/Socket.cpp.o
src/network/libnetwork.a: src/network/CMakeFiles/network.dir/SocketsOps.cpp.o
src/network/libnetwork.a: src/network/CMakeFiles/network.dir/TcpClient.cpp.o
src/network/libnetwork.a: src/network/CMakeFiles/network.dir/TcpConnection.cpp.o
src/network/libnetwork.a: src/network/CMakeFiles/network.dir/TcpServer.cpp.o
src/network/libnetwork.a: src/network/CMakeFiles/network.dir/Thread.cpp.o
src/network/libnetwork.a: src/network/CMakeFiles/network.dir/TimingWheel.cpp.o
src/network/libnetwork.a: src/network/CMakeFiles/network.dir/build.make
src/network/libnetwork.a: src/network/CMakeFiles/network.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_20) "Linking CXX static library libnetwork.a"
	cd /home/achene/c++_project/Xserver/build/src/network && $(CMAKE_COMMAND) -P CMakeFiles/network.dir/cmake_clean_target.cmake
	cd /home/achene/c++_project/Xserver/build/src/network && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/network.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/network/CMakeFiles/network.dir/build: src/network/libnetwork.a

.PHONY : src/network/CMakeFiles/network.dir/build

src/network/CMakeFiles/network.dir/clean:
	cd /home/achene/c++_project/Xserver/build/src/network && $(CMAKE_COMMAND) -P CMakeFiles/network.dir/cmake_clean.cmake
.PHONY : src/network/CMakeFiles/network.dir/clean

src/network/CMakeFiles/network.dir/depend:
	cd /home/achene/c++_project/Xserver/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/achene/c++_project/Xserver /home/achene/c++_project/Xserver/src/network /home/achene/c++_project/Xserver/build /home/achene/c++_project/Xserver/build/src/network /home/achene/c++_project/Xserver/build/src/network/CMakeFiles/network.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/network/CMakeFiles/network.dir/depend

