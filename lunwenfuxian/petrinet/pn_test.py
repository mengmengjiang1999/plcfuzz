from ladder_to_pn import LadderDiagramToPetriNetConverter

from plc_reachability_graph import PLCReachabilityGraph

from race_condition_detector import RaceConditionDetector

class PLC_RACE_CONDITION_DETECTION:
    """
    PLC竞争条件检测器（完整集成版）
    整合了梯形图转换、Petri网生成和竞争条件检测功能
    输入：梯形图程序
    输出：竞争条件检测结果
    """
    
    def __init__(self):
        self.ld_program = None          # 原始梯形图程序
        self.petri_net = None           # 转换后的Petri网
        self.reachability_graph = None  # 生成的可达图
        self.racing_nodes = []          # 检测到的竞争节点
        self.race_paths = []            # 检测到的竞争路径
    
    def load_ld_program(self, ld_program):
        """
        加载梯形图程序
        Args:
            ld_program: 梯形图程序，格式为嵌套列表和元组
        """
        self.ld_program = ld_program
        print("✅ 梯形图程序加载成功")
    
    def convert_ld_to_petri_net(self):
        """
        将梯形图转换为Petri网
        """
        if not self.ld_program:
            raise ValueError("未加载梯形图程序")
        
        print("🔄 开始将梯形图转换为Petri网...")
        converter = LadderDiagramToPetriNetConverter()
        self.petri_net = converter.convert(self.ld_program)
        print("✅ 转换完成")
        return self.petri_net
    
    def generate_reachability_graph(self, max_depth=100):
        """
        生成PLC可达图
        Args:
            max_depth: 最大搜索深度
        """
        if not self.petri_net:
            raise ValueError("未生成Petri网")
        
        print("🔄 开始生成PLC可达图...")
        generator = PLCReachabilityGraph(self.petri_net)
        self.reachability_graph = generator.generate_plc_reachability_graph(max_depth)
        print(f"✅ 生成完成 - 节点数: {len(self.reachability_graph['nodes'])}, 边数: {len(self.reachability_graph['edges'])}")
        return self.reachability_graph
    
    def detect_race_conditions(self):
        """
        检测竞争条件
        """
        if not self.reachability_graph:
            raise ValueError("未生成可达图")
        
        print("🔄 开始检测竞争条件...")
        detector = RaceConditionDetector(self.petri_net)
        detector.plc_reachability_graph = self.reachability_graph
        
        print("🔍 生成可达图...")
        
        # 检测竞争节点和路径
        self.racing_nodes = detector.detect_racing_nodes()
        self.race_paths = detector.find_race_paths()
        
        print(f"✅ 检测完成 - 竞争节点: {len(self.racing_nodes)}, 竞争路径: {len(self.race_paths)}")
        return {
            'racing_nodes': self.racing_nodes,
            'race_paths': self.race_paths
        }
    
    def analyze(self, ld_program=None, max_depth=100):
        """
        完整分析流程
        Args:
            ld_program: 梯形图程序（可选）
            max_depth: 最大搜索深度
        Returns:
            dict: 包含所有分析结果
        """
        if ld_program:
            self.load_ld_program(ld_program)
        
        # 执行完整流程
        self.convert_ld_to_petri_net()
        self.generate_reachability_graph(max_depth)
        results = self.detect_race_conditions()
        
        return {
            'petri_net': self.petri_net,
            'reachability_graph': self.reachability_graph,
            'race_conditions': results
        }
    
    def print_results(self):
        """打印检测结果"""
        if not self.race_paths:
            print("\n⚠️ 未检测到竞争条件")
            return
        
        print("\n" + "="*60)
        print("🏁 竞争条件检测结果")
        print("="*60)
        
        print(f"\n🔍 检测到 {len(self.racing_nodes)} 个竞争节点和 {len(self.race_paths)} 条竞争路径")
        
        print("\n📌 竞争节点:")
        for i, node in enumerate(self.racing_nodes, 1):
            print(f"  {i}. {node}")
        
        print("\n🔄 竞争路径:")
        for i, path in enumerate(self.race_paths, 1):
            print(f"\n路径 {i}:")
            for j, edge in enumerate(path, 1):
                print(f"  步骤{j}: {edge['from']} --{edge['type']}-> {edge['to']}")
                if 'transitions' in edge:
                    print(f"      触发变迁: {', '.join(edge['transitions'])}")
        
        print("\n💡 分析建议:")
        if self.race_paths:
            print("  - 检测到潜在的竞争条件，可能导致PLC程序行为不确定")
            print("  - 建议检查自保持电路和并联逻辑的执行顺序")
            print("  - 考虑添加互锁逻辑或调整扫描顺序")
        else:
            print("  - 未检测到明显竞争条件，程序逻辑较为稳定")
        
        print("="*60)


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
    
    # 创建检测器实例
    detector = PLC_RACE_CONDITION_DETECTION()
    
    # 执行完整分析流程
    results = detector.analyze(plc_ladder_diagram_logic, max_depth=50)
    
    # 打印结果
    detector.print_results()
    
    return results


if __name__ == "__main__":
    example_usage()