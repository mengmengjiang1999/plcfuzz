from plc_reachability_graph import PLCReachabilityGraph

class RaceConditionDetector:
    """
    Petri网竞争条件检测器
    基于论文中提出的PLC可达图分析和竞争路径检测方法
    """
    
    def __init__(self, petri_net):
        self.petri_net = petri_net
        self.plc_reachability_graph = None
        self.racing_nodes = []
        self.race_paths = []
    
    def is_sensing_transition(self, transition):
        """判断是否为传感变迁（输入变量变迁）"""
        return ('_ON' in transition['id'] or '_OFF' in transition['id']) and \
               any(place['variable'].startswith('I') for place in self.get_input_places(transition))
    
    def is_computing_transition(self, transition):
        """判断是否为计算变迁（线圈逻辑变迁）"""
        return not self.is_sensing_transition(transition)
    
    def get_input_places(self, transition):
        """获取变迁的输入库所"""
        input_places = []
        for arc in self.petri_net['arcs']:
            if arc['target'] == transition['id'] and arc['type'] != 'bidirectional':
                place_id = arc['source']
                place = next((p for p in self.petri_net['places'] if p['id'] == place_id), None)
                if place:
                    input_places.append(place)
        return input_places
    
    def get_output_places(self, transition):
        """获取变迁的输出库所"""
        output_places = []
        for arc in self.petri_net['arcs']:
            if arc['source'] == transition['id']:
                place_id = arc['target']
                place = next((p for p in self.petri_net['places'] if p['id'] == place_id), None)
                if place:
                    output_places.append(place)
        return output_places
    
     

    def detect_racing_nodes(self):
        """检测竞争节点（论文定义：有虚线边进入和离开的节点）"""
        self.racing_nodes = []
        
        for node in self.plc_reachability_graph['nodes']:
            incoming_dashed = any(edge['type'] == 'dashed' 
                                for edge in self.plc_reachability_graph['edges'] 
                                if edge['to'] == node)
            
            outgoing_dashed = any(edge['type'] == 'dashed'
                                for edge in self.plc_reachability_graph['edges']
                                if edge['from'] == node)
            
            if incoming_dashed and outgoing_dashed:
                self.racing_nodes.append(node)
        
        return self.racing_nodes
    
    def find_race_paths(self):
        """查找竞争路径（只包含虚线边的回路）"""
        self.race_paths = []
        
        def dfs_find_cycles(current_node, path, visited):
            if len(path) > 1 and current_node == path[0]:
                # 找到回路
                if all(edge['type'] == 'dashed' for edge in path):
                    self.race_paths.append(path.copy())
                return
            
            if current_node in visited:
                return
            
            visited.add(current_node)
            
            for edge in self.plc_reachability_graph['edges']:
                if edge['from'] == current_node and edge['type'] == 'dashed':
                    path.append(edge)
                    dfs_find_cycles(edge['to'], path, visited)
                    path.pop()
            
            visited.remove(current_node)
        
        for racing_node in self.racing_nodes:
            dfs_find_cycles(racing_node, [], set())
        
        return self.race_paths
        

def example_usage():
    """示例用法"""
    # 示例Petri网数据
    example_petri_net = {
        'places': [
            {'id': 'p_I0.0_0', 'variable': 'I0.0', 'state': 0},
            {'id': 'p_I0.0_1', 'variable': 'I0.0', 'state': 1},
            {'id': 'p_Q0.0_0', 'variable': 'Q0.0', 'state': 0},
            {'id': 'p_Q0.0_1', 'variable': 'Q0.0', 'state': 1}
        ],
        'transitions': [
            {'id': 't_I0.0_ON_0', 'type': 'sensing'},
            {'id': 't_I0.0_OFF_1', 'type': 'sensing'},
            {'id': 't_Q0.0_ON_2', 'type': 'computing'},
            {'id': 't_Q0.0_OFF_3', 'type': 'computing'}
        ],
        'arcs': [
            {'id': 'arc_0', 'source': 'p_I0.0_0', 'target': 't_I0.0_ON_0', 'type': 'regular'},
            {'id': 'arc_1', 'source': 't_I0.0_ON_0', 'target': 'p_I0.0_1', 'type': 'regular'},
            {'id': 'arc_2', 'source': 'p_I0.0_1', 'target': 't_I0.0_OFF_1', 'type': 'regular'},
            {'id': 'arc_3', 'source': 't_I0.0_OFF_1', 'target': 'p_I0.0_0', 'type': 'regular'},
            {'id': 'arc_4', 'source': 'p_I0.0_1', 'target': 't_Q0.0_ON_2', 'type': 'bidirectional'},
            {'id': 'arc_5', 'source': 't_Q0.0_ON_2', 'target': 'p_Q0.0_1', 'type': 'regular'},
            {'id': 'arc_6', 'source': 'p_Q0.0_0', 'target': 't_Q0.0_OFF_3', 'type': 'regular'},
            {'id': 'arc_7', 'source': 't_Q0.0_OFF_3', 'target': 'p_Q0.0_0', 'type': 'regular'}
        ],
        'initial_marking': {
            'p_I0.0_0': 1,
            'p_I0.0_1': 0,
            'p_Q0.0_0': 1,
            'p_Q0.0_1': 0
        }
    }
    # 1. 生成PLC可达图
    # 正确：先创建实例，再调用实例方法
    generator = PLCReachabilityGraph(example_petri_net)
    reachability_graph = generator.generate_plc_reachability_graph()

    print("🔍 创建竞争条件检测器...")
    # 3. 创建竞争检测器实例
    detector = RaceConditionDetector(example_petri_net)
    detector.plc_reachability_graph = reachability_graph  # 必须设置
    
    print("🎯 检测竞争节点...")
    # 4. 检测竞争节点
    racing_nodes = detector.detect_racing_nodes()
    print(f"发现 {len(racing_nodes)} 个竞争节点")
    
    print("🔄 查找竞争路径...")
    # 5. 查找竞争路径
    race_paths = detector.find_race_paths()
    print(f"发现 {len(race_paths)} 条竞争路径")
    
    # 6. 输出详细结果
    print("\n" + "="*60)
    print("🏁 竞争条件检测结果")
    print("="*60)
if __name__ == "__main__":
    example_usage()
