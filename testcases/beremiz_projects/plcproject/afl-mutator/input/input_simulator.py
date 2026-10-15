
import random
import time

# 生成故障注入序列
def mutate_digital_input(original):
    mutations = [
        lambda x: not x,                  # 位翻转
        lambda x: random.choice([True, False]),  # 随机化
        lambda x: x if random.random() > 0.1 else None  # 信号丢失
    ]
    return random.choice(mutations)(original)

# 示例：急停按钮信号测试
emergency_stop = [True]*5 + [False]*5  # 正常序列
fuzzed_input = [mutate_digital_input(x) for x in emergency_stop]


import numpy as np

def mutate_analog_input(value, min=0, max=27648):
    noise_types = [
        lambda: value + np.random.normal(0, 100),  # 高斯噪声
        lambda: np.random.uniform(min, max),       # 随机值
        lambda: max + 1000,                        # 超量程
        lambda: -1                                 # 负值异常
    ]
    return round(random.choice(noise_types)())


# 注入扫描周期扰动
def inject_timing_jitter(base_interval=100):
    jitter = random.randint(-20, 20)  # ±20%抖动
    return max(10, base_interval + jitter)  # 防止负值

# # 使用示例
# for _ in range(1000):
#     delay_ms = inject_timing_jitter()
#     set_hardware_inputs(fuzzed_input)
#     time.sleep(delay_ms / 1000)
#     check_outputs()

