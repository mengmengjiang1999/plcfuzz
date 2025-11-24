#!/bin/bash

echo "build_plcfiles.sh"


# 删掉plclogic文件夹
rm -rf ./plclogic

# 重建一个plclogic
mkdir -p ./plclogic

ls -lh ./tools/iec2c
ls -lh ./tools/iec2iec

# 3. 将PLC逻辑代码编译成C语言代码
./tools/iec2c -T ./plclogic $1