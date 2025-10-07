import copy
from collections import deque, defaultdict
from typing import Dict, List, Set, Tuple, Union
import time

class RaceConditionAnalyzer:
    """
    基于Petri网的竞态条件分析器
    实现论文中的竞态检测算法（Algorithm 3及相关定义）
    """
    
    def __init__(self, petri_net: Dict):
        """
        初始化竞态分析器
        
        Args:
            petri_net: 转换得到的Petri网模型，包含：
                - places: 库所集合
                - transitions: 变迁集合
                - arcs: 弧集合
                - marking: 初始标识
                - variable_mapping: 变量映射
        """
        self.petri_net = petri_net
        self.reachability_graph = None
        self.racing_nodes = set()
        self.race_paths = []
        self.race_locations = []
        
        # 构建邻接表用于图遍历
        self._build_adjacency_structures()
    
    def _build_adjacency_structures(self):
        """构建邻接表数据结构"""
        self.forward_adjacency = defaultdict(list)
        self.backward_adjacency = defaultdict(list)
        
        for from_node, to_node in self.petri_net['arcs']:
            self.forward_adjacency[from_node].append(to_node)
            self.backward_adjacency[to_node].append(from_node)
    
    def detect_races(self) -> Dict:
        """
        执行完整的竞态检测流程
        
        Returns:
            包含竞态检测结果的字典
        """
        start_time = time.time()
        
        # 步骤1: 构建PLC可达图
        self.build_reachability_graph()
        
        # 步骤2: 识别竞态节点
        self.racing_nodes = self.identify_racing_nodes()
        
        # 步骤3: 查找竞态路径
        self.race_paths = self.find_race_paths(self.racing_nodes)
        
        # 步骤4: 定位竞态源
        self.race_locations = self.locate_race_sources()
        
        execution_time = time.time() - start_time
        
        return {
            'racing_nodes': self.racing_nodes,
            'race_paths': self.race_paths,
            'race_locations': self.race_locations,
            'execution_time': execution_time,
            'statistics': {  # 确保这个字典包含所有必要的键
                'total_nodes': len(self.reachability_graph['nodes']),
                'total_edges': len(self.reachability_graph['edges']),
                'racing_nodes_count': len(self.racing_nodes),
                'race_paths_count': len(self.race_paths)  # 确保这个键存在
            }
        }
    
    def build_reachability_graph(self) -> Dict:
        """
        构建PLC可达图（Algorithm 3实现）
        
        Returns:
            PLC可达图字典结构
        """
        print("开始构建PLC可达图...")
        
        # 初始化可达图
        initial_marking = self._get_marking_tuple(self.petri_net['marking'])
        reachability_graph = {
            'nodes': {initial_marking: dict(self.petri_net['marking'])},
            'edges': [],
            'node_types': {}  # 存储节点类型（输入扫描、逻辑扫描、输出扫描）
        }
        
        # 使用BFS进行状态空间探索
        queue = deque([initial_marking])
        visited = {initial_marking}
        
        while queue:
            current_marking_tuple = queue.popleft()
            current_marking = reachability_graph['nodes'][current_marking_tuple]
            
            # 获取可触发的变迁
            enabled_transitions = self._get_enabled_transitions(current_marking)
            
            for transition in enabled_transitions:
                # 触发变迁，得到新标识
                new_marking = self._fire_transition(current_marking, transition)
                new_marking_tuple = self._get_marking_tuple(new_marking)
                
                # 添加新节点
                if new_marking_tuple not in reachability_graph['nodes']:
                    reachability_graph['nodes'][new_marking_tuple] = new_marking
                    queue.append(new_marking_tuple)
                    visited.add(new_marking_tuple)
                
                # 添加边
                edge_type = self._get_edge_type(transition)
                reachability_graph['edges'].append({
                    'from': current_marking_tuple,
                    'to': new_marking_tuple,
                    'transition': transition,
                    'type': edge_type
                })
        
        self.reachability_graph = reachability_graph
        print(f"可达图构建完成: {len(reachability_graph['nodes'])} 节点, "
              f"{len(reachability_graph['edges'])} 边")
        
        return reachability_graph
    
    def identify_racing_nodes(self) -> Set[Tuple]:
        """
        识别竞态节点（基于定义8）
        
        Returns:
            竞态节点的标记元组集合
        """
        print("识别竞态节点...")
        
        racing_nodes = set()
        
        for node in self.reachability_graph['nodes']:
            if self._is_racing_node(node):
                racing_nodes.add(node)
        
        print(f"识别到 {len(racing_nodes)} 个竞态节点")
        return racing_nodes
    
    def find_race_paths(self, racing_nodes: Set[Tuple]) -> List[List[Tuple]]:
        """
        查找竞态路径（基于定义9）
        
        Args:
            racing_nodes: 竞态节点集合
            
        Returns:
            竞态路径列表
        """
        print("查找竞态路径...")
        
        race_paths = []
        
        # 对每个竞态节点作为起点查找循环路径
        for start_node in racing_nodes:
            cycles = self._find_cycles_with_racing_nodes(start_node, racing_nodes)
            race_paths.extend(cycles)
        
        print(f"发现 {len(race_paths)} 条竞态路径")
        return race_paths
    
    def locate_race_sources(self) -> List[Dict]:
        """
        定位竞态源
        
        Returns:
            竞态源信息列表
        """
        print("定位竞态源...")
        
        race_sources = []
        
        for i, race_path in enumerate(self.race_paths):
            # 提取相关子网
            subnet = self._extract_subnet_for_path(race_path)
            
            # 分析竞态原因
            analysis = self._analyze_race_cause(subnet, race_path)
            
            race_sources.append({
                'path_id': i + 1,
                'racing_nodes': [str(node) for node in race_path],
                'subnet_info': subnet,
                'cause_analysis': analysis,
                'suggested_fixes': self._suggest_fixes(analysis)
            })
        
        return race_sources
    
    def _is_racing_node(self, node: Tuple) -> bool:
        """
        判断是否为竞态节点（定义8）
        
        Args:
            node: 节点标记元组
            
        Returns:
            是否为竞态节点
        """
        # 检查虚线弧的输入和输出
        incoming_dashed = any(edge['type'] == 'dashed' 
                            for edge in self.reachability_graph['edges'] 
                            if edge['to'] == node)
        
        outgoing_dashed = any(edge['type'] == 'dashed' 
                            for edge in self.reachability_graph['edges'] 
                            if edge['from'] == node)
        
        return incoming_dashed and outgoing_dashed
    
    def _find_cycles_with_racing_nodes(self, start_node: Tuple, 
                                      racing_nodes: Set[Tuple]) -> List[List[Tuple]]:
        """
        查找包含竞态节点的循环路径
        """
        cycles = []
        visited = set()
        stack = [(start_node, [start_node])]
        
        while stack:
            current_node, current_path = stack.pop()
            
            if current_node in visited:
                if current_node == start_node and len(current_path) > 1:
                    # 检查路径是否包含至少两个竞态节点
                    racing_count = sum(1 for node in current_path if node in racing_nodes)
                    if racing_count >= 2:
                        cycles.append(current_path.copy())
                continue
            
            visited.add(current_node)
            
            # 获取后继节点
            for edge in self.reachability_graph['edges']:
                if edge['from'] == current_node and edge['type'] == 'dashed':
                    next_node = edge['to']
                    if next_node not in current_path or next_node == start_node:
                        new_path = current_path + [next_node]
                        stack.append((next_node, new_path))
        
        return cycles
    
    def _get_enabled_transitions(self, marking: Dict) -> List[str]:
        """获取在当前标识下可触发的变迁"""
        enabled = []
        
        for transition in self.petri_net['transitions']:
            if self._is_transition_enabled(transition, marking):
                enabled.append(transition)
        
        return enabled
    
    def _is_transition_enabled(self, transition: str, marking: Dict) -> bool:
        """检查变迁是否可触发"""
        # 简化的实现，实际应根据Petri网语义
        input_places = [arc[0] for arc in self.petri_net['arcs'] 
                       if arc[1] == transition]
        
        return all(marking.get(place, 0) > 0 for place in input_places)
    
    def _fire_transition(self, marking: Dict, transition: str) -> Dict:
        """触发变迁，生成新标识"""
        new_marking = marking.copy()
        
        # 处理输入库所
        input_places = [arc[0] for arc in self.petri_net['arcs'] 
                       if arc[1] == transition]
        for place in input_places:
            new_marking[place] = max(0, new_marking.get(place, 0) - 1)
        
        # 处理输出库所
        output_places = [arc[1] for arc in self.petri_net['arcs'] 
                        if arc[0] == transition]
        for place in output_places:
            new_marking[place] = new_marking.get(place, 0) + 1
        
        return new_marking
    
    def _get_marking_tuple(self, marking: Dict) -> Tuple:
        """将标识字典转换为可哈希的元组"""
        places = sorted(self.petri_net['places'])
        return tuple(marking.get(place, 0) for place in places)
    
    def _get_edge_type(self, transition: str) -> str:
        """获取边的类型（实线/虚线）"""
        # 简化的类型判断
        if transition.startswith('t_') and ('_on' in transition or '_off' in transition):
            return 'solid'  # 输入扫描
        return 'dashed'  # 计算变迁
    
    def _extract_subnet_for_path(self, race_path: List[Tuple]) -> Dict:
        """提取竞态路径相关的子网"""
        relevant_places = set()
        relevant_transitions = set()
        relevant_arcs = set()
        
        # 分析路径中涉及到的库所和变迁
        for i in range(len(race_path) - 1):
            from_node = race_path[i]
            to_node = race_path[i + 1]
            
            # 查找连接这两个节点的边
            for edge in self.reachability_graph['edges']:
                if edge['from'] == from_node and edge['to'] == to_node:
                    transition = edge['transition']
                    relevant_transitions.add(transition)
                    
                    # 获取变迁相关的库所
                    for arc in self.petri_net['arcs']:
                        if arc[0] == transition or arc[1] == transition:
                            relevant_places.add(arc[0])
                            relevant_places.add(arc[1])
                            relevant_arcs.add(arc)
        
        return {
            'places': list(relevant_places),
            'transitions': list(relevant_transitions),
            'arcs': list(relevant_arcs)
        }
    
    def _analyze_race_cause(self, subnet: Dict, race_path: List[Tuple]) -> Dict:
        """分析竞态原因"""
        # 提取关键变量
        racing_variables = set()
        for place in subnet['places']:
            if place.startswith('p_') and '_1' in place:  # ON状态库所
                var_name = place.split('_')[1]
                racing_variables.add(var_name)
        
        return {
            'racing_variables': list(racing_variables),
            'path_length': len(race_path),
            'interaction_type': self._determine_interaction_type(subnet),
            'severity_level': self._assess_severity(subnet)
        }
    
    def _determine_interaction_type(self, subnet: Dict) -> str:
        """确定竞态交互类型"""
        places = subnet['places']
        
        # 检查是否存在相互触发
        coil_places = [p for p in places if p.startswith('p_Q')]
        if len(coil_places) >= 2:
            return 'mutual_triggering'
        
        return 'self_holding'
    
    def _assess_severity(self, subnet: Dict) -> str:
        """评估竞态严重程度"""
        coil_count = len([p for p in subnet['places'] if p.startswith('p_Q')])
        
        if coil_count >= 2:
            return 'high'  # 多线圈相互触发
        elif coil_count == 1:
            return 'medium'  # 自保持电路
        else:
            return 'low'  # 输入变量竞态
    
    def _suggest_fixes(self, analysis: Dict) -> List[str]:
        """提供修正建议"""
        fixes = []
        
        if analysis['interaction_type'] == 'mutual_triggering':
            fixes.append("移除相互触发的线圈引用")
            fixes.append("增加互锁逻辑防止同时触发")
        elif analysis['interaction_type'] == 'self_holding':
            fixes.append("检查自保持电路的触发条件")
            fixes.append("增加停止条件或超时保护")
        
        fixes.append("优化扫描顺序和执行逻辑")
        fixes.append("增加状态监控和错误恢复机制")
        
        return fixes

    def visualize_results(self, results: Dict):
        """可视化竞态检测结果"""
        print("\n" + "="*60)
        print("竞态条件分析报告")
        print("="*60)
        
        print(f"分析耗时: {results['execution_time']:.3f} 秒")
        print(f"可达图规模: {results['statistics']['total_nodes']} 节点, "
              f"{results['statistics']['total_edges']} 边")
        print(f"检测结果: {results['statistics']['racing_nodes_count']} 个竞态节点, "
              f"{results['statistics']['race_paths_count']} 条竞态路径")
        
        if results['statistics']['race_paths_count'] > 0:
            print("\n发现的竞态路径:")
            for i, path in enumerate(results['race_paths'], 1):
                print(f"路径 {i}: {len(path)} 个状态")
                
            print("\n竞态源定位:")
            for location in results['race_locations']:
                print(f"\n路径 {location['path_id']}:")
                print(f"  涉及变量: {', '.join(location['cause_analysis']['racing_variables'])}")
                print(f"  交互类型: {location['cause_analysis']['interaction_type']}")
                print(f"  严重程度: {location['cause_analysis']['severity_level']}")
                print(f"  修正建议:")
                for fix in location['suggested_fixes']:
                    print(f"    - {fix}")
        else:
            print("\n✅ 未检测到竞态条件")