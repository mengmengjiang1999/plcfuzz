import os
import pandas as pd
import re

def extract_fuzzer_stats():
    # 检查results文件夹是否存在
    if not os.path.exists('../results'):
        print("错误: 'results' 文件夹不存在！")
        print("当前目录下的内容:")
        for item in os.listdir('.'):
            print(f"  {item}")
        return None
    
    # 初始化数据列表
    data_list = []
    
    # 处理从 auto1 到 auto12 的文件
    for i in range(1, 13):
        file_name = f"fuzzer_stats_auto{i}"
        file_path = os.path.join("../results", file_name)
        
        print(f"处理文件: {file_path}")
        
        # 检查文件是否存在
        if not os.path.exists(file_path):
            print(f"  警告: 文件 {file_path} 不存在，跳过")
            continue
        
        try:
            # 读取文件内容
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
            
            # 使用正则表达式提取所需字段
            run_time_match = re.search(r'run_time\s*:\s*(\d+)', content)
            execs_done_match = re.search(r'execs_done\s*:\s*(\d+)', content)
            execs_per_sec_match = re.search(r'execs_per_sec\s*:\s*([\d.]+)', content)
            afl_banner_match = re.search(r'afl_banner\s*:\s*(.+)', content)
            
            # 提取数据，如果找不到则设为N/A
            run_time = run_time_match.group(1) if run_time_match else 'N/A'
            execs_done = execs_done_match.group(1) if execs_done_match else 'N/A'
            execs_per_sec = execs_per_sec_match.group(1) if execs_per_sec_match else 'N/A'
            afl_banner = afl_banner_match.group(1).strip() if afl_banner_match else 'N/A'
            
            # 添加到数据列表
            data_list.append({
                'group': f'auto{i}',
                'file_name': file_name,
                'afl_banner': afl_banner,
                'run_time': run_time,
                'execs_done': execs_done,
                'execs_per_sec': execs_per_sec
            })
            
            print(f"  成功提取: run_time={run_time}, execs_done={execs_done}, execs_per_sec={execs_per_sec}")
            
        except Exception as e:
            print(f"  错误处理文件 {file_path}: {e}")
            continue
    
    if not data_list:
        print("没有成功提取到任何数据！")
        return None
    
    # 创建DataFrame
    df = pd.DataFrame(data_list)
    
    # 转换数据类型（将字符串转换为数值）
    try:
        df['run_time'] = pd.to_numeric(df['run_time'], errors='coerce')
        df['execs_done'] = pd.to_numeric(df['execs_done'], errors='coerce')
        df['execs_per_sec'] = pd.to_numeric(df['execs_per_sec'], errors='coerce')
        
        
    except Exception as e:
        print(f"数据类型转换错误: {e}")
        
    
    df['run_time_seconds'] = df['run_time'] + df['execs_done']
    # df['execs_done'] = df['execs_done']
    df['execs_per_sec'] = df['execs_per_sec']*100
    
    return df

def save_to_csv(df, filename='fuzzer_stats_summary.csv'):
    """保存DataFrame到CSV文件"""
    try:
        df.to_csv(filename, index=False, encoding='utf-8')
        print(f"\n数据已成功保存到: {filename}")
        print(f"共处理了 {len(df)} 个文件")
        return True
    except Exception as e:
        print(f"保存CSV文件时出错: {e}")
        return False

# 执行提取和保存
print("开始提取fuzzer_stats数据...")
df = extract_fuzzer_stats()

if df is not None:
    # 显示提取的数据
    print("\n提取的数据预览:")
    print(df[['group', 'afl_banner', 'run_time_seconds', 'execs_done', 'execs_per_sec']])
    
    # 保存到CSV
    success = save_to_csv(df)
    
    if success:
        # 显示基本统计信息
        print("\n基本统计信息:")
        print(f"平均执行效率: {df['execs_per_sec'].mean():.2f} execs/sec")
        print(f"总执行次数: {df['execs_done'].sum():,}")
        print(f"总运行时间: {df['run_time_seconds'].sum() / 3600:.2f} 小时")
        
        # 显示CSV文件内容确认
        print("\nCSV文件前几行内容:")
        try:
            saved_df = pd.read_csv('fuzzer_stats_summary.csv')
            print(saved_df.head())
        except Exception as e:
            print(f"读取保存的CSV文件时出错: {e}")
else:
    print("未能提取到数据，请检查文件路径和格式")