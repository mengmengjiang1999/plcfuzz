from race_condition_detector import RaceConditionDetector

from plc_reachability_graph import PLCReachabilityGraph

def detect_race_conditions(petri_net_data, max_depth=50):
    """
    完整的竞争条件检测函数
    输入: Petri网数据结构
    输出: 检测结果报告
    """
    # 初始化检测器
    detector = RaceConditionDetector(petri_net_data)
    
    print("🔍 开始竞争条件检测...")
    print(f"Petri网信息: {len(petri_net_data['places'])}库所, "
          f"{len(petri_net_data['transitions'])}变迁, "
          f"{len(petri_net_data['arcs'])}弧")
    
    # 步骤1: 生成PLC可达图
    print("📊 生成PLC可达图...")
        # 创建PLC可达图生成器
    reachability_generator = PLCReachabilityGraph(petri_net_data)
    reachability_graph = reachability_generator.generate_plc_reachability_graph(max_depth)

    print(f"生成 {len(reachability_graph['nodes'])} 个状态节点")
    print(f"生成 {len(reachability_graph['edges'])} 条状态转移边")
    
    # 步骤2: 检测竞争节点
    print("🎯 检测竞争节点...")
    racing_nodes = detector.detect_racing_nodes()
    print(f"发现 {len(racing_nodes)} 个竞争节点")
    
    # 步骤3: 查找竞争路径
    print("🔄 查找竞争路径...")
    race_paths = detector.find_race_paths()
    print(f"发现 {len(race_paths)} 条竞争路径")
    
    # 步骤4: 生成检测报告
    report = generate_detection_report(petri_net_data, racing_nodes, race_paths)
    
    return report

def generate_detection_report(petri_net, racing_nodes, race_paths):
    """生成详细的检测报告"""
    report = {
        'has_race': len(race_paths) > 0,
        'racing_nodes_count': len(racing_nodes),
        'race_paths_count': len(race_paths),
        'racing_nodes': racing_nodes,
        'race_paths': race_paths,
        'severity': 'none'
    }
    
    if len(race_paths) > 0:
        if len(race_paths) <= 2:
            report['severity'] = 'low'
        elif len(race_paths) <= 5:
            report['severity'] = 'medium'
        else:
            report['severity'] = 'high'
        
        # 分析竞争类型
        report['race_types'] = analyze_race_types(race_paths, petri_net)
    
    return report

def analyze_race_types(race_paths, petri_net):
    """分析竞争类型"""
    race_types = {
        'self_holding': 0,      # 自保持循环
        'mutual_triggering': 0, # 相互触发
        'scan_order': 0,         # 扫描顺序依赖
        'other': 0               # 其他类型
    }
    
    for path in race_paths:
        # 分析路径特征判断竞争类型
        involved_coils = set()
        
        for edge in path:
            for trans_id in edge['transitions']:
                transition = next((t for t in petri_net['transitions'] if t['id'] == trans_id), None)
                if transition and '_ON' in trans_id:
                    coil_name = trans_id.split('_')[1]  # 提取线圈名
                    involved_coils.add(coil_name)
        
        if len(involved_coils) == 1:
            race_types['self_holding'] += 1
        elif len(involved_coils) == 2:
            race_types['mutual_triggering'] += 1
        else:
            race_types['other'] += 1
    
    return race_types

def example_usage():
    """使用示例"""
    # 假设这是您的Petri网数据
    example_petri_net = {
        'places': [
            {'id': 'p_I0.0_0', 'variable': 'I0.0', 'state': 0},
            {'id': 'p_I0.0_1', 'variable': 'I0.0', 'state': 1},
            {'id': 'p_Q0.0_0', 'variable': 'Q0.0', 'state': 0},
            {'id': 'p_Q0.0_1', 'variable': 'Q0.0', 'state': 1},
            # ... 更多库所
        ],
        'transitions': [
            {'id': 't_I0.0_ON_0', 'type': 'sensing'},
            {'id': 't_I0.0_OFF_1', 'type': 'sensing'},
            {'id': 't_Q0.0_ON_2', 'type': 'computing'},
            {'id': 't_Q0.0_OFF_3', 'type': 'computing'},
            # ... 更多变迁
        ],
        'arcs': [
            {'id': 'arc_0', 'source': 'p_I0.0_0', 'target': 't_I0.0_ON_0', 'type': 'regular'},
            {'id': 'arc_1', 'source': 't_I0.0_ON_0', 'target': 'p_I0.0_1', 'type': 'regular'},
            # ... 更多弧
        ],
        'initial_marking': {
            'p_I0.0_0': 1, 'p_I0.0_1': 0,
            'p_Q0.0_0': 1, 'p_Q0.0_1': 0
        }
    }
    
    # 运行竞争条件检测
    result = detect_race_conditions(example_petri_net)
    
    # 输出检测结果
    print("\n" + "="*60)
    print("🏁 竞争条件检测结果")
    print("="*60)
    
    if result['has_race']:
        print(f"❌ 发现竞争条件！严重程度: {result['severity'].upper()}")
        print(f"   竞争节点数量: {result['racing_nodes_count']}")
        print(f"   竞争路径数量: {result['race_paths_count']}")
        
        print(f"\n📈 竞争类型分析:")
        for race_type, count in result['race_types'].items():
            if count > 0:
                print(f"   - {race_type}: {count}处")
        
        print(f"\n🔧 建议措施:")
        if result['race_types']['self_holding'] > 0:
            print("   * 检查自保持逻辑，避免循环依赖")
        if result['race_types']['mutual_triggering'] > 0:
            print("   * 添加互锁逻辑防止相互触发")
        
    else:
        print("✅ 未检测到竞争条件 - 程序稳定")
    
    print("="*60)
    
    return result

# 性能优化版本（处理大型Petri网）
def optimized_detect_races(petri_net, max_states=1000):
    """优化版的竞争检测，限制状态空间大小"""
    # 实现状态空间剪枝和近似检测
    pass

def visualize_detection_results(report, petri_net):
    """可视化检测结果"""
    try:
        import matplotlib.pyplot as plt
        import networkx as nx
        
        # 创建可达图可视化
        G = nx.DiGraph()
        
        # 添加节点和边
        for i, node in enumerate(report.get('racing_nodes', [])):
            G.add_node(f"RN_{i}", color='red', size=300)
        
        for edge in report.get('race_paths', []):
            if edge['from'] in G.nodes and edge['to'] in G.nodes:
                G.add_edge(edge['from'], edge['to'], color='red', width=2)
        
        # 绘制图形
        plt.figure(figsize=(12, 8))
        pos = nx.spring_layout(G)
        nx.draw(G, pos, with_labels=True, node_color='lightcoral', 
                edge_color='red', width=2, font_weight='bold')
        plt.title("Race Condition Detection Results")
        plt.show()
        
    except ImportError:
        print("可视化需要安装matplotlib和networkx库")
        print("安装命令: pip install matplotlib networkx")

if __name__ == "__main__":
    # 运行示例检测
    detection_result = example_usage()