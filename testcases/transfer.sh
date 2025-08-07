#!/bin/bash

# 参数检查
if [ $# -ne 2 ]; then
    echo "用法: $0 <输入文件夹A> <输出文件夹B>"
    exit 1
fi

input_dir="$1"
output_dir="$2"

# 检查输入文件夹是否存在
if [ ! -d "$input_dir" ]; then
    echo "错误：输入文件夹 $input_dir 不存在"
    exit 1
fi

# 创建输出文件夹（如果不存在）
mkdir -p "$output_dir"

# 遍历输入文件夹中的所有文件
for input_file in "$input_dir"/*; do
    # 跳过子目录，只处理普通文件
    if [ -f "$input_file" ]; then
        # 提取文件名（不含路径）
        filename=$(basename "$input_file")
        
        # 生成输出路径
        output_file="$output_dir/$filename"
        
        # 执行程序并保存输出
        ../ie "$input_file" > "$output_file" 2>&1
        
        # 显示进度
        echo "已处理: $filename → $(basename "$output_file")"
    fi
done

echo "处理完成！输出结果见 $output_dir"