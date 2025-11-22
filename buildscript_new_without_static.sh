#!/bin/bash

# 检查是否提供了参数
if [ $# -eq 0 ]; then
    echo "错误: 请指定要编译的ST文件名。"
    echo "用法: $0 <文件名>"
    exit 1
fi

filename=$1

echo "filename: $filename"

# 定义各步骤的执行函数
build_plcfiles() {
    echo "Building PLC files..."
    local plc_file_name="$1"
    ./build_scripts/build_plcfiles.sh ./testcases/auto_race/$plc_file_name.st 
}

build_c() {
    echo "Building C code..."
    make
}

static_analyse() {
    echo "Running static analysis..."
    python3 ./static_analyse/main.py
}

build_shared_library() {
    echo "Building shared library..."
    ./build_scripts/build_shared_library.sh
}

build_fuzz() {
    echo "Building fuzz target..."
    ./build_scripts/buildfuzz.sh
}

# 默认执行全部流程
all() {
    local plc_file_name="$1"
    build_plcfiles $plc_file_name
    build_c
    static_analyse
    build_shared_library
    build_fuzz
}

# 参数解析
all $filename
./runfuzz_without_static.sh
mkdir -p ./results/without_static_$filename
cp -r ./findings/default ./results/without_static_$filename/findings