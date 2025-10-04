#!/bin/bash

echo "build_plcfiles.sh"

# 1. plclogic文件夹下面存储的就是PLC逻辑代码编译成的C++文件
cd ./plclogic
# 2. 清除旧的构建文件，重新编译
rm -rf *
cd ..

ls -lh ./tools/iec2c

# 3. 将PLC逻辑代码编译成C语言代码
./tools/iec2c -T ./plclogic $1