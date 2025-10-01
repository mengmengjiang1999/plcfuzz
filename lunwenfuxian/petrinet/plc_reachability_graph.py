class PLCReachabilityGraph:
    """
    PLC可达图生成器（完整修复版）
    基于论文《Modeling and Race Detection of Ladder Diagrams via Ordinary Petri Nets》实现
    模拟PLC扫描周期并生成可达性图用于竞争条件检测
    """
    
    def __init__(self, petri_net):
        """
        初始化PLC可达图生成器
        
        Args:
            petri_net: Petri网数据结构，包含places、transitions、arcs和initial_marking
        """
        self.petri_net = petri_net
        self.nodes = []  # 可达图节点列表
        self.edges = []  # 可达图边列表
        self.current_marking = None  # 当前标识
    
    def get_input_places(self, transition):
        """
        获取变迁的输入库所
        
        Args:
            transition: 变迁字典对象
            
        Returns:
            list: 输入库所列表
        """
        input_places = []
        for arc in self.petri_net['arcs']:
            if arc['target'] == transition['id']:
                place_id = arc['source']
                place = next((p for p in self.petri_net['places'] if p['id'] == place_id), None)
                if place:
                    input_places.append(place)
        return input_places
    
    def get_output_places(self, transition):
        """
        获取变迁的输出库所
        
        Args:
            transition: 变迁字典对象
            
        Returns:
            list: 输出库所列表
        """
        output_places = []
        for arc in self.petri_net['arcs']:
            if arc['source'] == transition['id']:
                place_id = arc['target']
                place = next((p for p in self.petri_net['places'] if p['id'] == place_id), None)
                if place:
                    output_places.append(place)
        return output_places
    
    def is_sensing_transition(self, transition):
        """
        判断是否为传感变迁（输入变量变迁）
        
        Args:
            transition: 变迁字典对象
            
        Returns:
            bool: 如果是传感变迁返回True，否则返回False
        """
        if not ('_ON' in transition['id'] or '_OFF' in transition['id']):
            return False
        
        input_places = self.get_input_places(transition)
        return any(place['variable'].startswith('I') for place in input_places)
    
    def is_computing_transition(self, transition):
        """
        判断是否为计算变迁（线圈逻辑变迁）
        
        Args:
            transition: 变迁字典对象
            
        Returns:
            bool: 如果是计算变迁返回True，否则返回False
        """
        return not self.is_sensing_transition(transition)
    
    def initialize_marking(self):
        """
        初始化标识（基于initial_marking）
        
        Returns:
            dict: 初始标识副本
        """
        self.current_marking = self.petri_net['initial_marking'].copy()
        return self.current_marking
    
    def get_enabled_transitions(self, marking, transition_type=None):
        """
        获取在当前标识下使能的变迁
        
        Args:
            marking: 当前标识
            transition_type: 变迁类型过滤（'sensing'或'computing'）
            
        Returns:
            list: 使能变迁列表
        """
        enabled_transitions = []
        
        for transition in self.petri_net['transitions']:
            # 检查变迁类型过滤
            if transition_type == 'sensing' and not self.is_sensing_transition(transition):
                continue
            if transition_type == 'computing' and not self.is_computing_transition(transition):
                continue
            
            # 检查使能条件
            input_places = self.get_input_places(transition)
            is_enabled = True
            
            for place in input_places:
                if marking.get(place['id'], 0) < 1:
                    is_enabled = False
                    break
            
            if is_enabled:
                enabled_transitions.append(transition)
        
        return enabled_transitions
    
    def fire_transition(self, transition, marking):
        """
        触发变迁，返回新标识
        
        Args:
            transition: 要触发的变迁
            marking: 当前标识
            
        Returns:
            dict: 新标识
        """
        new_marking = marking.copy()
        
        # 消耗输入库所令牌
        input_places = self.get_input_places(transition)
        for place in input_places:
            if place['id'] in new_marking:
                new_marking[place['id']] -= 1
        
        # 产生输出库所令牌
        output_places = self.get_output_places(transition)
        for place in output_places:
            if place['id'] in new_marking:
                new_marking[place['id']] += 1
            else:
                new_marking[place['id']] = 1
        
        return new_marking
    
    def hash_marking(self, marking):
        """
        生成标识的哈希值，用于状态去重
        
        Args:
            marking: 标识字典
            
        Returns:
            frozenset: 标识的哈希值
        """
        return frozenset(marking.items())
    
    def is_marking_in_list(self, marking, marking_list):
        """
        检查标识是否已在列表中
        
        Args:
            marking: 要检查的标识
            marking_list: 标识列表
            
        Returns:
            bool: 如果存在返回True，否则返回False
        """
        for existing_marking in marking_list:
            if existing_marking == marking:
                return True
        return False
    
    def generate_plc_reachability_graph(self, max_depth=100):
        """
        生成PLC可达图（模拟PLC扫描周期）
        
        Args:
            max_depth: 最大搜索深度
            
        Returns:
            dict: 包含nodes和edges的可达图
        """
        print("PLCRG: 开始生成可达图...")
        self.nodes = []
        self.edges = []
        
        # 初始状态
        initial_marking = self.initialize_marking()
        self.nodes.append(initial_marking)
        
        visited = set()
        queue = [(initial_marking, 0, [])]  # (当前标识, 深度, 路径历史)
        
        while queue:
            current_marking, depth, path = queue.pop(0)
            
            if depth > max_depth:
                print(f"⚠️ 达到最大深度限制 {max_depth}，停止搜索")
                break
            
            marking_hash = self.hash_marking(current_marking)
            if marking_hash in visited:
                continue
            
            visited.add(marking_hash)
            
            # PLC扫描周期模拟：输入扫描 → 逻辑扫描 → 输出扫描
            # 1. 输入扫描阶段（传感变迁）
            sensing_transitions = self.get_enabled_transitions(current_marking, 'sensing')
            
            for sensing_trans in sensing_transitions:
                new_marking = self.fire_transition(sensing_trans, current_marking)
                
                # 2. 逻辑扫描阶段（计算变迁）
                computing_transitions = self.get_enabled_transitions(new_marking, 'computing')
                
                for computing_trans in computing_transitions:
                    final_marking = self.fire_transition(computing_trans, new_marking)
                    
                    # 记录状态转移
                    if not self.is_marking_in_list(final_marking, self.nodes):
                        self.nodes.append(final_marking)
                    
                    edge = {
                        'from': current_marking,
                        'to': final_marking,
                        'transitions': [sensing_trans['id'], computing_trans['id']],
                        'type': 'dashed' if self.is_computing_transition(computing_trans) else 'solid'
                    }
                    self.edges.append(edge)
                    
                    # 继续探索
                    queue.append((final_marking, depth + 1, path + [edge]))
        
        return {
            'nodes': self.nodes,
            'edges': self.edges
        }


# 测试用例和示例用法
def example_usage():
    """
    PLC可达图生成器使用示例
    """
    # 示例Petri网数据
    
    import json

    # 从 JSON 文件读取数据
    with open("petri_net.json", "r", encoding="utf-8") as f:
        example_petri_net = json.load(f)

    # 打印字典内容
    print("读取的字典数据：")
    print(example_petri_net)
    print(f"数据类型：{type(example_petri_net)}")  
    # 输出: <class 'dict'>
    # example_petri_net = {
    #     'places': [
    #         {'id': 'p_I0.0_0', 'variable': 'I0.0', 'state': 0},
    #         {'id': 'p_I0.0_1', 'variable': 'I0.0', 'state': 1},
    #         {'id': 'p_Q0.0_0', 'variable': 'Q0.0', 'state': 0},
    #         {'id': 'p_Q0.0_1', 'variable': 'Q0.0', 'state': 1}
    #     ],
    #     'transitions': [
    #         {'id': 't_I0.0_ON_0', 'type': 'sensing'},
    #         {'id': 't_I0.0_OFF_1', 'type': 'sensing'},
    #         {'id': 't_Q0.0_ON_2', 'type': 'computing'},
    #         {'id': 't_Q0.0_OFF_3', 'type': 'computing'}
    #     ],
    #     'arcs': [
    #         {'id': 'arc_0', 'source': 'p_I0.0_0', 'target': 't_I0.0_ON_0', 'type': 'regular'},
    #         {'id': 'arc_1', 'source': 't_I0.0_ON_0', 'target': 'p_I0.0_1', 'type': 'regular'},
    #         {'id': 'arc_2', 'source': 'p_I0.0_1', 'target': 't_I0.0_OFF_1', 'type': 'regular'},
    #         {'id': 'arc_3', 'source': 't_I0.0_OFF_1', 'target': 'p_I0.0_0', 'type': 'regular'},
    #         {'id': 'arc_4', 'source': 'p_I0.0_1', 'target': 't_Q0.0_ON_2', 'type': 'bidirectional'},
    #         {'id': 'arc_5', 'source': 't_Q0.0_ON_2', 'target': 'p_Q0.0_1', 'type': 'regular'},
    #         {'id': 'arc_6', 'source': 'p_Q0.0_0', 'target': 't_Q0.0_OFF_3', 'type': 'regular'},
    #         {'id': 'arc_7', 'source': 't_Q0.0_OFF_3', 'target': 'p_Q0.0_0', 'type': 'regular'}
    #     ],
    #     'initial_marking': {
    #         'p_I0.0_0': 1,
    #         'p_I0.0_1': 0,
    #         'p_Q0.0_0': 1,
    #         'p_Q0.0_1': 0
    #     }
    # }
    
    print("🔧 创建PLC可达图生成器实例...")
    reachability_generator = PLCReachabilityGraph(example_petri_net)
    
    print("📊 生成可达图...")
    reachability_graph = reachability_generator.generate_plc_reachability_graph(max_depth=50)
    
    print("✅ 可达图生成完成！")
    print(f"节点数量: {len(reachability_graph['nodes'])}")
    print(f"边数量: {len(reachability_graph['edges'])}")
    
    # 显示前几个状态
    print("\n📋 前3个状态示例:")
    for i, node in enumerate(reachability_graph['nodes'][:3]):
        print(f"状态 {i}: {node}")
    
    return reachability_graph


def test_methods():
    """
    测试所有修复的方法是否正常工作
    """
    # 简单测试数据
    test_net = {
        'places': [{'id': 'p1', 'variable': 'I0.0', 'state': 0}],
        'transitions': [{'id': 't1', 'type': 'sensing'}],
        'arcs': [{'id': 'a1', 'source': 'p1', 'target': 't1', 'type': 'regular'}],
        'initial_marking': {'p1': 1}
    }
    
    generator = PLCReachabilityGraph(test_net)
    
    # 测试方法存在性
    methods_to_test = [
        'get_input_places', 'get_output_places', 
        'is_sensing_transition', 'is_computing_transition',
        'get_enabled_transitions', 'fire_transition',
        'hash_marking', 'is_marking_in_list'
    ]
    
    print("🧪 测试方法完整性...")
    for method in methods_to_test:
        if hasattr(generator, method):
            print(f"✅ {method} 方法存在")
        else:
            print(f"❌ {method} 方法缺失")
    
    # 测试具体功能
    transition = test_net['transitions'][0]
    input_places = generator.get_input_places(transition)
    print(f"📦 变迁输入库所: {[p['id'] for p in input_places]}")
    
    return True


if __name__ == "__main__":
    print("=" * 60)
    print("🏭 PLC可达图生成器测试")
    print("=" * 60)
    
    # 运行方法测试
    test_methods()
    
    print("\n" + "=" * 60)
    print("🚀 开始生成可达图示例")
    print("=" * 60)
    
    # 运行示例
    result = example_usage()
    
    print("\n" + "=" * 60)
    print("🎉 所有测试完成！")
    print("=" * 60)