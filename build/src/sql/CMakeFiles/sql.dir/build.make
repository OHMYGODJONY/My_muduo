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
include src/sql/CMakeFiles/sql.dir/depend.make

# Include the progress variables for this target.
include src/sql/CMakeFiles/sql.dir/progress.make

# Include the compile flags for this target's objects.
include src/sql/CMakeFiles/sql.dir/flags.make

src/sql/CMakeFiles/sql.dir/Connection.cpp.o: src/sql/CMakeFiles/sql.dir/flags.make
src/sql/CMakeFiles/sql.dir/Connection.cpp.o: ../src/sql/Connection.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/sql/CMakeFiles/sql.dir/Connection.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/sql && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sql.dir/Connection.cpp.o -c /home/achene/c++_project/Xserver/src/sql/Connection.cpp

src/sql/CMakeFiles/sql.dir/Connection.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sql.dir/Connection.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/sql && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/sql/Connection.cpp > CMakeFiles/sql.dir/Connection.cpp.i

src/sql/CMakeFiles/sql.dir/Connection.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sql.dir/Connection.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/sql && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/sql/Connection.cpp -o CMakeFiles/sql.dir/Connection.cpp.s

src/sql/CMakeFiles/sql.dir/ConnectionPool.cpp.o: src/sql/CMakeFiles/sql.dir/flags.make
src/sql/CMakeFiles/sql.dir/ConnectionPool.cpp.o: ../src/sql/ConnectionPool.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/sql/CMakeFiles/sql.dir/ConnectionPool.cpp.o"
	cd /home/achene/c++_project/Xserver/build/src/sql && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sql.dir/ConnectionPool.cpp.o -c /home/achene/c++_project/Xserver/src/sql/ConnectionPool.cpp

src/sql/CMakeFiles/sql.dir/ConnectionPool.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sql.dir/ConnectionPool.cpp.i"
	cd /home/achene/c++_project/Xserver/build/src/sql && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/achene/c++_project/Xserver/src/sql/ConnectionPool.cpp > CMakeFiles/sql.dir/ConnectionPool.cpp.i

src/sql/CMakeFiles/sql.dir/ConnectionPool.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sql.dir/ConnectionPool.cpp.s"
	cd /home/achene/c++_project/Xserver/build/src/sql && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/achene/c++_project/Xserver/src/sql/ConnectionPool.cpp -o CMakeFiles/sql.dir/ConnectionPool.cpp.s

# Object files for target sql
sql_OBJECTS = \
"CMakeFiles/sql.dir/Connection.cpp.o" \
"CMakeFiles/sql.dir/ConnectionPool.cpp.o"

# External object files for target sql
sql_EXTERNAL_OBJECTS =

src/sql/libsql.a: src/sql/CMakeFiles/sql.dir/Connection.cpp.o
src/sql/libsql.a: src/sql/CMakeFiles/sql.dir/ConnectionPool.cpp.o
src/sql/libsql.a: src/sql/CMakeFiles/sql.dir/build.make
src/sql/libsql.a: src/sql/CMakeFiles/sql.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/achene/c++_project/Xserver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library libsql.a"
	cd /home/achene/c++_project/Xserver/build/src/sql && $(CMAKE_COMMAND) -P CMakeFiles/sql.dir/cmake_clean_target.cmake
	cd /home/achene/c++_project/Xserver/build/src/sql && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sql.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/sql/CMakeFiles/sql.dir/build: src/sql/libsql.a

.PHONY : src/sql/CMakeFiles/sql.dir/build

src/sql/CMakeFiles/sql.dir/clean:
	cd /home/achene/c++_project/Xserver/build/src/sql && $(CMAKE_COMMAND) -P CMakeFiles/sql.dir/cmake_clean.cmake
.PHONY : src/sql/CMakeFiles/sql.dir/clean

src/sql/CMakeFiles/sql.dir/depend:
	cd /home/achene/c++_project/Xserver/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/achene/c++_project/Xserver /home/achene/c++_project/Xserver/src/sql /home/achene/c++_project/Xserver/build /home/achene/c++_project/Xserver/build/src/sql /home/achene/c++_project/Xserver/build/src/sql/CMakeFiles/sql.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/sql/CMakeFiles/sql.dir/depend

