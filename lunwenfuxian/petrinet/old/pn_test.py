from ladder_to_pn import LadderDiagramToPetriNetConverter

from plc_reachability_graph import PLCReachabilityGraph

from race_condition_detector import RaceConditionDetector

# 示例使用
def example_usage():
    """使用示例"""
    # 定义LD程序
    plc_ladder_diagram_logic = [
        # Rung 1: 简单串联 - I0.0 控制 Q0.0
        [
            ('I0.0', 'NO'),
            ('Q0.0', 'COIL')
        ],
        
        # Rung 2: 复杂逻辑 - I0.1 串联 (I0.2 并联 M1) 串联 Q0.1
        [
            ('I0.1', 'NO'),
            {  # 并联逻辑
                (('I0.2', 'NC'),),  # 路径1
                (('M1', 'NO'),)     # 路径2
            },
            ('Q0.1', 'COIL')
        ],
        
        # Rung 3: 自保持电路 - I0.3 并联 Q0.2 串联 Q0.2
        [
            ('I0.3', 'NO'),
            {  # 并联逻辑（自保持）
                (('I0.3', 'NO'),),
                (('Q0.2', 'NO'),)
            },
            ('Q0.2', 'COIL')
        ]
    ]
    
    print("🚀 开始PLC竞争条件检测流程...")

    # 创建转换器并执行转换
    converter = LadderDiagramToPetriNetConverter()
    petri_net = converter.convert(plc_ladder_diagram_logic)
    
    #  得到了petri_net
    
    print(petri_net)
    
    # 创建可达图生成器并执行生成
    reachability_generator = PLCReachabilityGraph(petri_net)
    reachability_graph = reachability_generator.generate_plc_reachability_graph(max_depth=50)
    
    #   得到了reachability_graph
    print("🔍 创建竞争条件检测器...")
    # 3. 创建竞争检测器实例
    detector = RaceConditionDetector(petri_net)
    detector.plc_reachability_graph = reachability_graph  # 必须设置
    
    print("🎯 检测竞争节点...")
    # 4. 检测竞争节点
    racing_nodes = detector.detect_racing_nodes()
    print(f"发现 {len(racing_nodes)} 个竞争节点")
    
    # 在调用find_race_paths之前添加
    print("可达图节点结构示例:", reachability_graph['nodes'][0])
    print("可达图边结构示例:", reachability_graph['edges'][0])
    print("竞争节点示例:", racing_nodes[0])
    
    print("🔄 查找竞争路径...")
    # 5. 查找竞争路径
    race_paths = detector.find_race_paths()
    print(f"发现 {len(race_paths)} 条竞争路径")
    
    # 6. 输出详细结果
    print("\n" + "="*60)
    print("🏁 竞争条件检测结果")
    print("="*60)


    print("\n🔎 详细竞争路径分析：")
    if not race_paths:
        print("⚠️ 未检测到明确的竞争路径")
    else:
        for i, path in enumerate(race_paths, 1):
            print(f"\n🔄 竞争路径 {i}:")
            for j, edge in enumerate(path, 1):
                print(f"  步骤{j}: {edge['from']} --{edge['type']}-> {edge['to']}")
                if 'transitions' in edge:
                    print(f"      触发变迁: {', '.join(edge['transitions'])}")

    print("\n💡 竞争节点分析：")
    for i, node in enumerate(racing_nodes, 1):
        print(f"  节点{i}: {node}")
    print("="*60)



if __name__ == "__main__":
    example_usage()