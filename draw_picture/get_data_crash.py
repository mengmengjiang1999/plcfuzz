import csv
import re
import pandas as pd

def parse_afl_to_csv(input_text, output_file="afl_crash_data.csv"):
    """
    解析AFL崩溃数据文本并保存为CSV格式
    
    参数:
    input_text: 包含文件名的文本字符串
    output_file: 输出的CSV文件名
    """
    # 按行分割文本
    lines = input_text.strip().split('\n')
    
    # 解析字段
    parsed_data = []
    
    for i,line in enumerate(lines):
        line = line.strip()
        if not line:
            continue
            
        # 使用正则表达式提取字段
        pattern = r"id:(\d+),sig:(\d+),src:(\d+),time:(\d+),execs:(\d+),op:(\w+),rep:(\d+)"
        match = re.match(pattern, line)
        
        if match:
            parsed_data.append({
                'filename': f'auto{i+1}',  # 新增文件名列：auto1, auto2, ..., auto12
                'id': match.group(1),
                'sig': match.group(2),
                'src': match.group(3),
                'time_ms': match.group(4),
                'time_sec': str(int(match.group(4)) // 1000),  # 转换为秒
                'execs': match.group(5),
                'op': match.group(6),
                'rep': match.group(7)
            })
        else:
            print(f"警告: 无法解析行: {line}")
    
    if not parsed_data:
        print("没有解析到有效数据")
        return
    
    # 创建DataFrame
    df = pd.DataFrame(parsed_data)
    
    # 重新排列列的顺序，将filename放在第一列
    columns_order = ['filename'] + [col for col in df.columns if col != 'filename']
    df = df[columns_order]
    
    # 保存为CSV
    df.to_csv(output_file, index=False, encoding='utf-8')
    
    print(f"数据已保存为 {output_file}")
    print(f"共解析了 {len(parsed_data)} 条记录")
    
    # 显示数据预览
    print("\n数据预览 (前5行):")
    for i, row in enumerate(parsed_data[:5]):
        print(f"{i+1}. {row}")


# 如果您想从文件读取文本，可以使用这个版本：
def parse_from_txt_file(input_file, output_file="afl_crash_data.csv"):
    """
    从TXT文件读取并解析
    """
    with open(input_file, 'r', encoding='utf-8') as f:
        input_text = f.read()
    
    return parse_afl_to_csv(input_text, output_file)

# 使用方法（如果文本保存在文件中）：
parse_from_txt_file("alf_crash_filename.txt", "crash_data.csv")
