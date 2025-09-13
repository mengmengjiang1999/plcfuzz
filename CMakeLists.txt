cmake_minimum_required(VERSION 3.10)
project(PLC_Mutator)

# 设置包含目录
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)

# 将fuzz_config下的文件编译成共享库
add_subdirectory(fuzz_config)

# 设置输出目录
set_target_properties(plc_mutator PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})