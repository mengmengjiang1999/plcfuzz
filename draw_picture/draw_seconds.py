import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# 设置中文字体和样式
plt.rcParams['font.sans-serif'] = ['SimHei', 'DejaVu Sans'] # 支持中文
sns.set_style("whitegrid")

# 读取数据
df = pd.read_csv('./fuzzer_stats_summary.csv')

# 创建条形图
plt.figure(figsize=(14, 9))
bars = plt.bar(df['group'], df['execs_per_sec'], color=sns.color_palette("viridis", len(df)))

# 在条形顶端显示数值
for bar, value in zip(bars, df['execs_per_sec']):
    plt.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 0.1, f'{value:.2f}', 
             ha='center', va='bottom', fontsize=9)

plt.xlabel('Test Group')
plt.ylabel('Execution Efficiency (execs/sec)')
plt.title('AFL Fuzzing Execution Efficiency Comparison')
plt.xticks(rotation=45) # 如果组名太长，可以旋转45度
plt.tight_layout()
plt.savefig('tight_plot.png', bbox_inches='tight')
# plt.show()