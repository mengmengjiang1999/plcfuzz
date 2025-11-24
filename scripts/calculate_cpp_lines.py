import os
from pathlib import Path

def count_lines_in_file(file_path):
    """
    统计单个文件的行数
    
    参数:
        file_path: 文件路径
        
    返回:
        文件的行数（整数）
    """
    try:
        # 使用UTF-8编码打开文件
        with open(file_path, 'r', encoding='utf-8') as f:
            return len(f.readlines())
    except UnicodeDecodeError:
        try:
            # 如果UTF-8失败，尝试GBK编码（常见于中文文件）
            with open(file_path, 'r', encoding='gbk') as f:
                return len(f.readlines())
        except:
            print(f"无法读取文件（编码问题）: {file_path}")
            return 0
    except Exception as e:
        print(f"处理文件时出错 {file_path}: {str(e)}")
        return 0

def count_all_lines(directory, target_extensions=None):
    """
    统计目录下所有文件的行数
    
    参数:
        directory: 要统计的目录路径
        target_extensions: 要统计的文件扩展名列表，如 ['.py', '.txt']
                         如果为None，则统计所有文件
                         
    返回:
        total_files: 文件总数
        total_lines: 总行数
    """
    total_files = 0
    total_lines = 0
    
    # 使用pathlib进行目录遍历
    for file_path in Path(directory).rglob('*'):
        if file_path.is_file():
            # 如果有指定扩展名要求，进行检查
            if target_extensions is not None:
                if file_path.suffix.lower() not in target_extensions:
                    continue
            
            # 跳过常见的隐藏目录（如.git, node_modules等）
            if any(part.startswith('.') and part not in ['.', '..'] 
                   for part in file_path.parts):
                continue
                
            lines = count_lines_in_file(file_path)
            total_files += 1
            total_lines += lines
            
            # 可选：显示每个文件的统计信息
            print(f"{file_path}: {lines} 行")
    
    return total_files, total_lines

def calculate_plclogic():
    """主函数"""
    # 设置要统计的目录路径
    directory = "../plclogic"
    if not directory:
        directory = os.getcwd()
    
    # 检查目录是否存在
    if not os.path.exists(directory):
        print(f"错误：目录 '{directory}' 不存在")
        return
    
    # 设置要统计的文件类型（None表示所有文件）
    # 如果只想统计特定类型的文件，可以取消下面的注释并修改列表
    target_extensions = None  # 统计所有文件
    # target_extensions = ['.py', '.txt', '.md']  # 只统计Python、文本和Markdown文件
    
    print(f"开始统计目录: {directory}")
    if target_extensions:
        print(f"目标文件类型: {', '.join(target_extensions)}")
    print("-" * 50)
    
    # 执行统计
    total_files, total_lines = count_all_lines(directory, target_extensions)
    
    # 输出结果
    print("-" * 50)
    print(f"统计完成！")
    print(f"总文件数: {total_files}")
    print(f"总行数: {total_lines}")
    if total_files > 0:
        print(f"平均每个文件行数: {total_lines / total_files:.1f}")
        
    return total_lines

# 运行脚本
if __name__ == "__main__":
    calculate_plclogic()