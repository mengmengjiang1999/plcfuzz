from ladder_to_ld import LDGraphConverter
from ld_to_petrinet import LDGraphToPetriNetConverter
from race_analyzer import RaceConditionAnalyzer


from typing import Dict

def create_test_petri_net() -> Dict:
    """创建包含竞态条件的测试Petri网"""
    
    return {
        'places': [
            'p_I0.0_0', 'p_I0.0_1',  # 输入变量 I0.0
            'p_Q0.0_0', 'p_Q0.0_1',  # 输出变量 Q0.0
            'p_I0.1_0', 'p_I0.1_1',  # 输入变量 I0.1  
            'p_Q0.1_0', 'p_Q0.1_1',  # 输出变量 Q0.1
            'p_M0.0_0', 'p_M0.0_1'   # 内部变量 M0.0
        ],
        'transitions': [
            't1_1_1', 't1_1_0',      # Q0.0 的ON/OFF变迁
            't2_1_1', 't2_1_0',      # Q0.1 的ON/OFF变迁
            't3_1_1', 't3_1_0',      # 相互触发变迁
            't_I0.0_on', 't_I0.0_off', # 输入变量变迁
            't_I0.1_on', 't_I0.1_off'
        ],
        'arcs': [
            # Q0.0 的控制逻辑
            ('p_I0.0_0', 't1_1_1'), ('t1_1_1', 'p_I0.0_1'),
            ('p_Q0.0_0', 't1_1_1'), ('t1_1_1', 'p_Q0.0_1'),
            ('p_I0.0_1', 't1_1_0'), ('t1_1_0', 'p_I0.0_0'),
            ('p_Q0.0_1', 't1_1_0'), ('t1_1_0', 'p_Q0.0_0'),
            
            # Q0.1 的控制逻辑（包含相互触发）
            ('p_I0.1_0', 't2_1_1'), ('t2_1_1', 'p_I0.1_1'),
            ('p_Q0.1_0', 't2_1_1'), ('t2_1_1', 'p_Q0.1_1'),
            ('p_Q0.0_1', 't2_1_1'),  # Q0.0 触发 Q0.1
            ('p_I0.1_1', 't2_1_0'), ('t2_1_0', 'p_I0.1_0'),
            ('p_Q0.1_1', 't2_1_0'), ('t2_1_0', 'p_Q0.1_0'),
            ('p_Q0.1_1', 't3_1_1'), ('t3_1_1', 'p_Q0.0_1'),  # Q0.1 触发 Q0.0
            ('p_Q0.0_1', 't3_1_0'), ('t3_1_0', 'p_Q0.1_1'),
            
            # 输入变量自循环
            ('p_I0.0_0', 't_I0.0_on'), ('t_I0.0_on', 'p_I0.0_1'),
            ('p_I0.0_1', 't_I0.0_off'), ('t_I0.0_off', 'p_I0.0_0'),
            ('p_I0.1_0', 't_I0.1_on'), ('t_I0.1_on', 'p_I0.1_1'),
            ('p_I0.1_1', 't_I0.1_off'), ('t_I0.1_off', 'p_I0.1_0')
        ],
        'marking': {
            'p_I0.0_0': 1, 'p_I0.0_1': 0,
            'p_Q0.0_0': 1, 'p_Q0.0_1': 0,
            'p_I0.1_0': 1, 'p_I0.1_1': 0,
            'p_Q0.1_0': 1, 'p_Q0.1_1': 0,
            'p_M0.0_0': 1, 'p_M0.0_1': 0
        },
        'variable_mapping': {
            'I0.0': {'on': 'p_I0.0_1', 'off': 'p_I0.0_0'},
            'Q0.0': {'on': 'p_Q0.0_1', 'off': 'p_Q0.0_0'},
            'I0.1': {'on': 'p_I0.1_1', 'off': 'p_I0.1_0'},
            'Q0.1': {'on': 'p_Q0.1_1', 'off': 'p_Q0.1_0'},
            'M0.0': {'on': 'p_M0.0_1', 'off': 'p_M0.0_0'}
        }
    }

    # return {'places': ['p_Q0.1_0', 'p_I0.1_1', 'p_Q0.0_1', 'p_I0.3_1', 'p_I0.2_0', 'p_Q0.1_1', 'p_Q0.2_1', 'p_I0.0_1', 'p_M1_0', 'p_Q0.2_0', 'p_I0.0_0', 'p_I0.1_0', 'p_Q0.0_0', 'p_M1_1', 'p_I0.3_0', 'p_I0.2_1'], 'transitions': ['t_3_1_1', 't_3_1_0', 't_I0.3_off', 't_I0.3_on', 't_M1_off', 't_I0.2_off', 't_I0.1_off', 't_2_2_1', 't_3_2_1', 't_Q0.2_off', 't_2_1_1', 't_I0.0_on', 't_Q0.2_on', 't_2_2_0', 't_3_2_0', 't_2_1_0', 't_I0.2_on', 't_I0.0_off', 't_1_1_0', 't_1_1_1', 't_I0.1_on', 't_M1_on', 't_1_2_0'], 'arcs': [('t_2_2_0', 'p_Q0.1_0'), ('p_I0.3_0', 't_3_2_0'), ('p_I0.1_0', 't_I0.1_on'), ('p_I0.3_1', 't_3_2_1'), ('t_I0.3_off', 'p_I0.3_0'), ('p_M1_0', 't_M1_on'), ('t_I0.1_off', 'p_I0.1_0'), ('p_I0.1_1', 't_I0.1_off'), ('t_I0.1_on', 'p_I0.1_1'), ('p_I0.0_1', 't_1_1_1'), ('p_I0.3_0', 't_3_1_0'), ('t_3_1_1', 'p_Q0.2_1'), ('p_I0.2_1', 't_2_2_1'), ('p_Q0.2_1', 't_3_1_1'), ('p_Q0.0_1', 't_1_2_0'), ('p_Q0.1_1', 't_2_2_1'), ('t_1_2_0', 'p_Q0.0_0'), ('t_2_2_1', 'p_I0.1_1'), ('t_3_2_0', 'p_Q0.2_0'), ('p_Q0.2_1', 't_3_2_0'), ('t_3_2_0', 'p_I0.3_0'), ('p_Q0.0_0', 't_1_1_1'), ('p_Q0.2_1', 't_Q0.2_off'), ('t_2_2_0', 'p_I0.1_0'), ('p_Q0.0_1', 't_1_1_0'), ('p_Q0.1_1', 't_2_1_0'), ('p_Q0.1_1', 't_2_2_0'), ('p_Q0.2_0', 't_3_1_1'), ('p_Q0.2_1', 't_3_2_1'), ('t_1_1_1', 'p_Q0.0_1'), ('t_2_1_0', 'p_I0.1_0'), ('t_M1_on', 'p_M1_1'), ('t_2_1_0', 'p_Q0.1_0'), ('t_I0.3_on', 'p_I0.3_1'), ('t_2_1_1', 'p_Q0.1_1'), ('t_I0.0_on', 'p_I0.0_1'), ('p_Q0.2_0', 't_3_2_1'), ('t_1_2_0', 'p_I0.0_0'), ('t_2_2_1', 'p_Q0.1_1'), ('p_Q0.0_1', 't_1_1_1'), ('t_3_1_0', 'p_Q0.2_0'), ('t_3_1_0', 'p_I0.3_0'), ('t_M1_off', 'p_M1_0'), ('t_2_2_1', 'p_I0.2_1'), ('p_Q0.1_1', 't_2_1_1'), ('p_I0.3_1', 't_I0.3_off'), ('t_2_1_1', 'p_I0.1_1'), ('p_Q0.2_0', 't_Q0.2_on'), ('p_I0.3_0', 't_I0.3_on'), ('p_I0.0_0', 't_I0.0_on'), ('p_Q0.1_0', 't_2_2_1'), ('t_1_1_1', 'p_I0.0_1'), ('t_3_2_1', 'p_Q0.2_1'), ('p_I0.1_0', 't_2_1_0'), ('p_I0.2_1', 't_I0.2_off'), ('t_1_1_0', 'p_Q0.0_0'), ('p_I0.2_0', 't_I0.2_on'), ('t_I0.2_on', 'p_I0.2_1'), ('t_2_1_1', 'p_M1_1'), ('p_I0.0_1', 't_I0.0_off'), ('p_Q0.2_1', 't_3_1_0'), ('t_1_1_0', 'p_I0.0_0'), ('p_I0.1_1', 't_2_1_1'), ('p_Q0.1_0', 't_2_1_1'), ('t_Q0.2_on', 'p_Q0.2_1'), ('p_I0.0_0', 't_1_2_0'), ('p_I0.1_1', 't_2_2_1'), ('t_Q0.2_off', 'p_Q0.2_0'), ('p_I0.0_0', 't_1_1_0'), ('p_I0.1_0', 't_2_2_0'), ('t_3_1_1', 'p_I0.3_1'), ('t_I0.0_off', 'p_I0.0_0'), ('t_3_2_1', 'p_I0.3_1'), ('p_M1_1', 't_M1_off'), ('t_I0.2_off', 'p_I0.2_0'), ('p_I0.3_1', 't_3_1_1'), ('p_M1_1', 't_2_1_1')], 'marking': {'p_M1_0': 1, 'p_M1_1': 0, 'p_I0.2_0': 1, 'p_I0.2_1': 0, 'p_Q0.1_0': 1, 'p_Q0.1_1': 0, 'p_Q0.2_0': 1, 'p_Q0.2_1': 0, 'p_I0.0_0': 1, 'p_I0.0_1': 0, 'p_I0.1_0': 1, 'p_I0.1_1': 0, 'p_Q0.0_0': 1, 'p_Q0.0_1': 0, 'p_I0.3_0': 1, 'p_I0.3_1': 0}, 'variable_mapping': {'M1': {'on': 'p_M1_1', 'off': 'p_M1_0'}, 'I0.2': {'on': 'p_I0.2_1', 'off': 'p_I0.2_0'}, 'Q0.1': {'on': 'p_Q0.1_1', 'off': 'p_Q0.1_0'}, 'Q0.2': {'on': 'p_Q0.2_1', 'off': 'p_Q0.2_0'}, 'I0.0': {'on': 'p_I0.0_1', 'off': 'p_I0.0_0'}, 'I0.1': {'on': 'p_I0.1_1', 'off': 'p_I0.1_0'}, 'Q0.0': {'on': 'p_Q0.0_1', 'off': 'p_Q0.0_0'}, 'I0.3': {'on': 'p_I0.3_1', 'off': 'p_I0.3_0'}}}

def demonstrate_race_detection():
    """演示竞态检测的完整流程"""
    
    # 1. 创建测试用的Petri网（从LD Graph转换得到）
    test_petri_net = create_test_petri_net()
    
    # 2. 初始化竞态分析器
    analyzer = RaceConditionAnalyzer(test_petri_net)
    
    # 3. 执行竞态检测
    results = analyzer.detect_races()
    
    # 4. 可视化结果
    analyzer.visualize_results(results)
    
    return results

def integrated_test_with_ld_graph():
    """与LD Graph转换器集成的完整测试"""
    
    # 1. 创建梯形图程序
    ladder_program=[
        [  # 第一个
            {   # 并联逻辑
                'path1': [('I0.0', 'NO')],
                'path2': [('10.1', 'NO')]  # 相互触发
            },
            ('I0.2', 'NO'),
            ('Q0.0', 'COIL')
        ],
        [('I0.2', 'NC'), ('I0.1','NO'),('Q0.0', 'NC')]
    ]
    # ladder_program = [
    #     # 梯级1: 简单逻辑
    #     [('I0.0', 'NO'), ('Q0.0', 'COIL')],
        
    #     # 梯级2: 包含相互触发的复杂逻辑
    #     [
    #         ('I0.1', 'NO'),
    #         {   # 并联逻辑
    #             'path1': [('I0.2', 'NC')],
    #             'path2': [('Q0.0', 'NO')]  # 相互触发
    #         },
    #         ('Q0.1', 'COIL')
    #     ],
        
    #     # 梯级3: 自保持电路
    #     [
    #         ('I0.3', 'NO'),
    #         {   # 自保持
    #             'path1': [('I0.3', 'NO')],
    #             'path2': [('Q0.1', 'NO')]
    #         },
    #         ('Q0.1', 'COIL')
    #     ]
    # ]
    # ladder_program = [
    #     [{'path1': [('I0.0', 'NO')],
    #             'path2': [('Q0.4', 'NO')]}, ('I0.1', 'NC'),('I0.4','NO') ],
    #     [('Q0.4','NO'),('I0.1', 'NO'),('Q0.0', 'NO')],
    #     [('I0.4','NO'),('Q0.0', 'NO')],
    #     [('Q0.0','NO'),('I0.3', 'NO'),('Q0.1', 'NO')],
    #     [('Q0.4','NO'),('Q0.1', 'NO'),('Q0.3', 'NC'),('Q0.2', 'NO')],
    #     [('Q0.4','NO'),('I0.2', 'NO'),('Q0.2', 'NO'),('Q0.3', 'NO')],
    # ]
    
    # 2. 转换为LD Graph
    ld_converter = LDGraphConverter()
    ld_graph = ld_converter.convert_to_ld_graph(ladder_program)
    
    print(ld_graph)
    
    
    # 3. 转换为Petri网
    petri_converter = LDGraphToPetriNetConverter()
    petri_net = petri_converter.convert(ld_graph)
    
    print(petri_net)
    
    # 4. 竞态检测
    analyzer = RaceConditionAnalyzer(petri_net)
    results = analyzer.detect_races()
    
    return results

# 运行示例
if __name__ == "__main__":
    print("开始竞态条件检测演示...")
    
    # 运行基本示例
    results = demonstrate_race_detection()
    
    # 运行集成测试
    print("\n" + "="*60)
    print("集成测试结果")
    print("="*60)
    integrated_results = integrated_test_with_ld_graph()
    
    # 比较结果
    print(f"基本测试检测到 {results['statistics']['race_paths_count']} 条竞态路径")
    print(f"集成测试检测到 {integrated_results['statistics']['race_paths_count']} 条竞态路径")
    
    if integrated_results['statistics']['race_paths_count'] > 0:
        print("✅ 成功检测到梯形图中的竞态条件")
    else:
        print("❌ 未检测到竞态条件")