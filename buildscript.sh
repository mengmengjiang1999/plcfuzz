#!/bin/bash

# 定义各步骤的执行函数
build_plcfiles() {
    echo "Building PLC files..."
    ./build_scripts/build_plcfiles.sh ./testcases/auto_generate.st
}

build_c() {
    echo "Building C code..."
    ./build_scripts/build.sh
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
    build_plcfiles
    build_c
    static_analyse
    build_shared_library
    build_fuzz
}

# 参数解析
if [ $# -eq 0 ]; then
    # 无参数时执行全部流程
    all
else
    # 根据参数执行指定步骤
    for arg in "$@"; do
        case $arg in
            plc)
                build_plcfiles
                ;;
            c)
                build_c
                ;;
            analyze|analysis)
                static_analyse
                ;;
            lib|library)
                build_shared_library
                ;;
            fuzz)
                build_fuzz
                ;;
            all)
                all
                ;;
            *)
                echo "Unknown option: $arg"
                echo "Available options:"
                echo "  plc        Build PLC files"
                echo "  c          Build C code"
                echo "  analyze    Run static analysis"
                echo "  lib        Build shared library"
                echo "  fuzz       Build fuzz target"
                echo "  all        Run all steps (default)"
                exit 1
                ;;
        esac
    done
fi