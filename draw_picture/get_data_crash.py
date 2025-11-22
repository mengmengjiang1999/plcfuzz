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
        line = line.strip().split(',')
        if not line:
            continue
        
        parsed_data.append({
                'filename': f'auto{i+1}',  # 新增文件名列：auto1, auto2, ..., auto12
                'id': line[0].strip()[3:],
                'sig': line[1].strip()[4:],
                'src': line[2].strip()[4:],
                'time_ms': line[3].strip()[5:],
                'time_sec': str(int(line[3].strip()[5:]) // 1000),  # 转换为秒
                'execs': line[4].strip()[6:],
                'op': line[5].strip()[3:],
                'rep': line[6].strip()[4:]
        })
    
    if not parsed_data:
        print("没有解析到有效数据")
        return
    
    # 创建DataFrame
    df = pd.DataFrame(parsed_data)
    
    # 重新排列列的顺序，将filename放在第一列
    columns_order = ['filename'] + [col for col in df.columns if col != 'filename']
    df = df[columns_order]
    
    
    df['time_diff_sec'] = df['time_sec'].astype(int).diff()
    
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
# parse_from_txt_file("afl_crash_without_static.txt", "crash_data_without_static.csv")

parse_from_txt_file("afl_crash_filename.txt", "crash_data.csv")
