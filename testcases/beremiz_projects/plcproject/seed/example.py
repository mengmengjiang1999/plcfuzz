# 按钮信号防抖测试（单位：ms）
button_bounce_seeds = [
    {'signal': [False]*5 + [True]*2 + [False] + [True]*10, 'duration': 15},
    {'signal': [True, False]*10, 'duration': 5},  # 高频抖动
    {'signal': [False, True, None, True], 'duration': 100}  # 含信号丢失
]



# 使用AFL++的种子标记
def prioritize_seeds(seeds):
    coverage_stats = get_coverage_data()
    return sorted(
        seeds,
        key=lambda x: len(coverage_stats.get(x, [])),
        reverse=True
    )[:100]  # 保留覆盖率最高的100个种子
    
import math
    
# 不同引脚采用不同变化速率
for i in range(num_pins):
    if i % 2 == 0:
        # 偶数引脚：10Hz变化
        seeds[i].append(math.sin(2*math.pi*10*time.time()))
    else:
        # 奇数引脚：1Hz变化 
        seeds[i].append(math.sin(2*math.pi*1*time.time()))