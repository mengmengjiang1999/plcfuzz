#!/bin/bash

for input_file in ./inputfiles/*.ld; do
    # 获取文件名（不带路径）
    filename=$(basename "$input_file")
    filename="${filename%.*}"

    # 构造输出文件路径
    output_file="./outputfiles/${filename}.st"
    # 执行python脚本并将结果输出到指定文件
    python3 main.py "$input_file"  "$output_file"
    
    # 打印处理信息（可选）
    echo "Processed $input_file -> $output_file"
done