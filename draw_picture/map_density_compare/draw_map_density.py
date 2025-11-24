import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import matplotlib

# 设置中文字体（如果需要显示中文）
plt.rcParams['font.sans-serif'] = ['SimHei', 'Arial Unicode MS', 'DejaVu Sans']
plt.rcParams['axes.unicode_minus'] = False

def plot_coverage_symplc_comparison(csv_file_path,symplc_file_path):
    """
    绘制Coverage Rate和SymPLC的对比柱状图
    
    参数:
        csv_file_path: CSV文件路径
    """
    # 读取数据
    df = pd.read_csv(csv_file_path)
    symplc_df = pd.read_csv(symplc_file_path)
    df = pd.merge(df, symplc_df, on='filename')
    
    # 按文件名排序（自然排序）
    # df['filename'] = df['filename'].str.extract('(\d+)').astype(float)
    
    
    df = df.sort_values('filename',key=lambda x: x.str.extract(r'(\d+)', expand=False).astype(float))
    
    # 创建图形和坐标轴
    fig, ax1 = plt.subplots(figsize=(14, 8))
    
    # 设置柱状图的位置和宽度
    x = np.arange(len(df))
    width = 0.35
    
    # 绘制Coverage Rate柱状图（左侧Y轴）
    bars1 = ax1.bar(x - width/2, df['Coverage Rate'] * 100, width, 
                   label='Coverage Rate (%)', alpha=0.7, color='skyblue', edgecolor='black')
    
    # 创建第二个Y轴用于SymPLC
    ax2 = ax1.twinx()
    
    # 绘制SymPLC柱状图（右侧Y轴）
    bars2 = ax2.bar(x + width/2, df['SymPLC'], width, 
                   label='SymPLC', alpha=0.7, color='lightcoral', edgecolor='black')
    
    # 设置坐标轴标签和标题
    ax1.set_xlabel('Industrial Cases', fontsize=12, fontweight='bold')
    ax1.set_ylabel('Coverage Rate (%)', fontsize=12, fontweight='bold', color='skyblue')
    ax2.set_ylabel('SymPLC', fontsize=12, fontweight='bold', color='lightcoral')
    ax1.set_title('Coverage Rate vs SymPLC Comparison', fontsize=14, fontweight='bold')
    
    # 设置X轴刻度标签
    ax1.set_xticks(x)
    ax1.set_xticklabels(df['filename'], rotation=45, ha='right')
    
    # 设置Y轴范围
    ax1.set_ylim(0, 110)
    ax2.set_ylim(0, 110)
    
    # 添加数值标签
    for bar in bars1:
        height = bar.get_height()
        ax1.text(bar.get_x() + bar.get_width()/2., height + 1,
                f'{height:.1f}%', ha='center', va='bottom', fontsize=8)
    
    for bar in bars2:
        height = bar.get_height()
        ax2.text(bar.get_x() + bar.get_width()/2., height + 1,
                f'{height:.1f}', ha='center', va='bottom', fontsize=8)
    
    # 添加图例
    lines1, labels1 = ax1.get_legend_handles_labels()
    lines2, labels2 = ax2.get_legend_handles_labels()
    ax1.legend(lines1 + lines2, labels1 + labels2, loc='upper right')
    
    # 添加网格
    ax1.grid(True, alpha=0.3, axis='y')
    ax2.grid(True, alpha=0.3, axis='y')
    
    # 调整布局
    plt.tight_layout()
    
    # 显示图形
    plt.show()
    
    # 保存图形（可选）
    plt.savefig('coverage_symplc_comparison.png', dpi=300, bbox_inches='tight')

# 使用示例
if __name__ == "__main__":
    # 替换为您的CSV文件路径
    csv_file = "map_density_results.csv"  # 请修改为实际文件路径
    symplc_file = "map_density_results_symplc.csv"  # 请修改为实际文件路径
    plot_coverage_symplc_comparison(csv_file,symplc_file)