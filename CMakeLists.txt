cmake_minimum_required(VERSION 3.10)
project(PLC_Input_Transformer)

# 设置包含目录
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)

# 将input_generation下的文件编译成共享库
add_subdirectory(input_generation)

# 设置输出目录
set_target_properties(plc_input_transformer PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})