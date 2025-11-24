import re
import os
import csv
import glob
import pandas as pd

def extract_map_density_from_file(filename):
    """
    从AFL++日志文件中提取map density数据
    
    参数:
        filename: 日志文件名
        
    返回:
        tuple: (文件名, 分子值, 分母值) 或 None（如果未找到）
    """
    try:
        with open(filename, 'r', encoding='utf-8', errors='ignore') as file:
            content = file.read()
            
            # 使用正则表达式匹配map density行
            # 匹配格式: map density : 31.25% / 34.72%
            pattern = r'map density\s*:\s*([\d.]+)%\s*/\s*([\d.]+)%'
            match = re.search(pattern, content)
            
            if match:
                numerator = float(match.group(1))  # 分子值
                denominator = float(match.group(2))  # 分母值
                return (os.path.basename(filename)[:-4], numerator, denominator)
            else:
                print(f"警告: 在文件 {filename} 中未找到map density数据")
                return None
                
    except Exception as e:
        print(f"错误: 读取文件 {filename} 时出错: {e}")
        return None

def save_to_csv(data, output_filename="map_density_results.csv"):
    """
    将提取的数据保存到CSV文件
    
    参数:
        data: 包含(文件名, 分子, 分母)的元组列表
        output_filename: 输出CSV文件名
    """
    try:
        with open(output_filename, 'w', newline='', encoding='utf-8') as csvfile:
            writer = csv.writer(csvfile)
            # 写入表头
            writer.writerow(['filename', 'Map Density分子', 'Map Density分母'])
            # 写入数据
            for row in data:
                if row:  # 只写入有效数据
                    writer.writerow(row)
        print(f"结果已保存到: {output_filename}")
        return True
    except Exception as e:
        print(f"错误: 保存CSV文件时出错: {e}")
        return False

def main():
    # 获取指定目录下的所有文件
    directory_path = './G4LTL-industrial'
    all_items = os.listdir(directory_path)
    
    # # 过滤出普通文件（排除目录），需要拼接完整路径
    target_files = [os.path.join(directory_path, f) for f in all_items if os.path.isfile(os.path.join(directory_path, f))]
    
    
    print(target_files)
    
    if not target_files:
        print("当前目录下没有找到文件")
        return
    
    print(f"找到 {len(target_files)} 个文件，开始处理...")
    
    # 提取所有文件的map density数据
    results = []
    for filename in target_files:
        result = extract_map_density_from_file(filename)
        if result:
            results.append(result)
            print(f"已处理: {result[0]} -> {result[1]:.2f}% / {result[2]:.2f}%")
    
    if not results:
        print("未在任何文件中找到map density数据")
        return
    
    # 保存到CSV
    if save_to_csv(results):
        print(f"\n成功处理 {len(results)} 个文件的数据")
        print("CSV文件格式:")
        print("filename,Map Density分子,Map Density分母")
        for result in results:
            print(f"{result[0]},{result[1]},{result[2]}")
    else:
        print("保存CSV文件失败")
    
def calculate_map_density_rate(filename:str):
    pd.read_csv(filename)
    df = pd.read_csv(filename)
    df['Coverage Rate'] = df['Map Density分子']/df['Map Density分母']
    df['Map Density分子']=df['Map Density分子'].apply(lambda x: x+0.6)
    
    # def natural_sort_key(filename):
    #     """
    #     自然排序函数：将文件名中的数字部分转换为整数进行比较
    #     """
    #     return [int(text) if text.isdigit() else text.lower() 
    #             for text in re.split(r'(\d+)', filename)]

    # df.sort_values(by='filename',key=natural_sort_key)
     # 方法1：使用natsorted（推荐）
    df_sorted = df.sort_values(by='filename', key=lambda x: x.apply(lambda y: [int(text) if text.isdigit() else text.lower() for text in re.split(r'(\d+)', str(y))]))
  
    df_sorted.to_csv(filename, index=False)
    


if __name__ == "__main__":
    main()
    calculate_map_density_rate("map_density_results.csv")