cmake_minimum_required(VERSION 3.10)

# 设置包含目录
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)

# 添加共享库
add_library(plc_input_transformer SHARED plc_input_transformer.cpp)