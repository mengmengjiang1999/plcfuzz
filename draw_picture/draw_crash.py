import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

def plot_afl_analysis(csv_file="afl_crash_data.csv"):
    """
    绘制AFL测试用例的time_sec和execs分析图表
    """
    # 读取CSV文件
    df = pd.read_csv(csv_file)
    
    # 设置中文字体
    plt.rcParams['font.sans-serif'] = ['SimHei', 'Arial Unicode MS', 'DejaVu Sans']
    plt.rcParams['axes.unicode_minus'] = False
    
    # 创建图形
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(15, 8))
    
    # 设置x轴位置
    x = np.arange(len(df['filename']))
    
    # 第一个子图：时间分布柱状图
    bars1 = ax1.bar(x, df['time_diff_sec'], color='skyblue', alpha=0.7, edgecolor='navy')
    ax1.set_xlabel('Test Case')
    ax1.set_ylabel('Time (seconds)')
    ax1.set_title('Discovery Time Distribution by Test Case')
    ax1.set_xticks(x)
    ax1.set_xticklabels(df['filename'], rotation=45)
    ax1.grid(axis='y', alpha=0.3)
    
    # 在柱状图上添加数值标签
    for bar in bars1:
        height = bar.get_height()
        ax1.text(bar.get_x() + bar.get_width()/2., height + 100,
                f'{int(height)}', ha='center', va='bottom', fontsize=8)
    
    # 第二个子图：执行次数分布柱状图
    bars2 = ax2.bar(x, df['execs'], color='lightcoral', alpha=0.7, edgecolor='darkred')
    ax2.set_xlabel('Test Case')
    ax2.set_ylabel('Execution Count')
    ax2.set_title('Execution Count Required to Trigger Crash')
    ax2.set_xticks(x)
    ax2.set_xticklabels(df['filename'], rotation=45)
    ax2.grid(axis='y', alpha=0.3)
    
    # 在柱状图上添加数值标签
    for bar in bars2:
        height = bar.get_height()
        ax2.text(bar.get_x() + bar.get_width()/2., height + 50,
                f'{int(height)}', ha='center', va='bottom', fontsize=8)
    
    # 调整布局
    plt.tight_layout()
    
    # 保存图表
    plt.savefig('afl_time_execs_comparison.png', dpi=300, bbox_inches='tight')
    plt.show()

def plot_combined_chart(csv_file="afl_crash_data.csv"):
    """
    绘制双Y轴组合图表
    """
    # 读取CSV文件
    df = pd.read_csv(csv_file)
    
    # 创建图形和主Y轴
    fig, ax1 = plt.subplots(figsize=(12, 6))
    
    # 设置x轴位置
    x = np.arange(len(df['filename']))
    width = 0.35
    
    # Plot time_sec bar chart
    bars1 = ax1.bar(x - width/2, df['time_diff_sec'], width, 
                    label='Time (seconds)', color='skyblue', alpha=0.8)
    ax1.set_xlabel('Test Case')
    ax1.set_ylabel('Time (seconds)', color='blue')
    ax1.tick_params(axis='y', labelcolor='blue')
    
    # 创建第二个Y轴
    ax2 = ax1.twinx()
    
    # Plot execs bar chart
    bars2 = ax2.bar(x + width/2, df['execs'], width,
                    label='Execution Count', color='lightcoral', alpha=0.8)
    ax2.set_ylabel('Execution Count', color='red')
    ax2.tick_params(axis='y', labelcolor='red')
    
    # 设置x轴标签
    ax1.set_xticks(x)
    ax1.set_xticklabels(df['filename'], rotation=45)
    
    # 添加图例
    lines1, labels1 = ax1.get_legend_handles_labels()
    lines2, labels2 = ax2.get_legend_handles_labels()
    ax1.legend(lines1 + lines2, labels1 + labels2, loc='upper left')
    
    # 设置标题
    plt.title('AFL Test Case Discovery Time and Execution Count Comparison')
    
    # 调整布局
    plt.tight_layout()
    
    # 保存图表

    plt.savefig('afl_combined_chart.png', dpi=300, bbox_inches='tight')
    plt.show()

def plot_line_trend(csv_file="afl_crash_data.csv"):
    """
    绘制时间趋势折线图
    """
    # 读取CSV文件
    df = pd.read_csv(csv_file)
    
    # 创建图形
    plt.figure(figsize=(12, 6))
    
    # 绘制折线图
    plt.plot(df['filename'], df['time_diff_sec'], marker='o', linewidth=2, 
             label='Discovery Time (seconds)', color='blue', markersize=6)
    plt.plot(df['filename'], df['execs'], marker='s', linewidth=2, 
             label='Execution Count', color='red', markersize=6)
    
    # 设置标签和标题
    plt.xlabel('Test Case')
    plt.ylabel('Value')
    plt.title('AFL Test Case: Discovery Time and Execution Count Trend')
    plt.legend()
    plt.xticks(rotation=45)
    plt.grid(True, alpha=0.3)
    
    # 调整布局
    plt.tight_layout()
    
    # 保存图表
    plt.savefig('afl_trend_chart.png', dpi=300, bbox_inches='tight')
    plt.show()

# 主程序
if __name__ == "__main__":
    
    import os
    os.system("mkdir ./crash_data")
    # 绘制分离柱状图
    plot_afl_analysis("./crash_data.csv")
    
    # 绘制双Y轴组合图
    plot_combined_chart("./crash_data.csv")
    
    # 绘制趋势折线图
    plot_line_trend("./crash_data.csv")