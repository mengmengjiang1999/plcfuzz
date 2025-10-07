import copy
from typing import List, Dict, Any, Tuple, Set, Union
from collections import defaultdict

class LadderDiagramToPetriNetConverter:
    """
    梯形图到Petri网转换器
    基于论文《Modeling and Race Detection of Ladder Diagrams via Ordinary Petri Nets》的算法
    """
    
    def __init__(self):
        self.places = {}          # 存储所有库所: {place_id: place_data}
        self.transitions = {}     # 存储所有变迁: {transition_id: transition_data}
        self.arcs = []           # 存储所有弧: [(source, target, type)]
        self.initial_marking = {} # 初始标识: {place_id: token_count}
        self.variable_counter = 0
        self.transition_counter = 0
        self.ld_graph = {'vertices': [], 'edges': []}
    
    def build_ld_graph(self, ld_program: List) -> Dict:
        """
        构建LD图（论文中的Definition 2）
        """
        vertices = []
        edges = []
        
        # 添加左侧和右侧电源轨顶点
        for i in range(len(ld_program)):
            vertices.append({'id': f'vl_{i}', 'type': 'left_power_rail'})
            vertices.append({'id': f'vr_{i}', 'type': 'right_power_rail'})
        
        # 处理每个梯级
        for rung_index, rung in enumerate(ld_program):
            prev_vertex = f'vl_{rung_index}'
            coil_vertex = None
            
            for element in rung:
                if isinstance(element, tuple):
                    # 简单元件（触点或线圈）
                    var_name, element_type = element
                    vertex_id = self._create_vertex_id(var_name, element_type, rung_index)
                    
                    # 添加顶点
                    vertices.append({
                        'id': vertex_id,
                        'variable': var_name,
                        'element_type': element_type,
                        'rung_index': rung_index
                    })
                    
                    # 添加上一个元件到当前元件的边
                    edges.append({'from': prev_vertex, 'to': vertex_id, 'type': 'horizontal'})
                    prev_vertex = vertex_id
                    
                    if element_type == 'COIL':
                        coil_vertex = vertex_id
                
                elif isinstance(element, dict):
                    # 并联逻辑
                    parallel_paths = list(element.values())[0] if isinstance(element, dict) else element
                    
                    # 添加并联分支
                    branch_start = prev_vertex
                    branch_ends = []
                    
                    for path in parallel_paths:
                        current_vertex = branch_start
                        for path_element in path:
                            if isinstance(path_element, tuple):
                                var_name, element_type = path_element
                                vertex_id = self._create_vertex_id(var_name, element_type, rung_index)
                                
                                vertices.append({
                                    'id': vertex_id,
                                    'variable': var_name,
                                    'element_type': element_type,
                                    'rung_index': rung_index
                                })
                                
                                edges.append({'from': current_vertex, 'to': vertex_id, 'type': 'horizontal'})
                                current_vertex = vertex_id
                        
                        branch_ends.append(current_vertex)
                    
                    # 添加汇合点
                    if len(branch_ends) > 1:
                        merge_vertex = f'merge_{rung_index}_{self.variable_counter}'
                        self.variable_counter += 1
                        vertices.append({'id': merge_vertex, 'type': 'merge_point'})
                        
                        for end_vertex in branch_ends:
                            edges.append({'from': end_vertex, 'to': merge_vertex, 'type': 'horizontal'})
                        
                        prev_vertex = merge_vertex
            
            # 连接到右侧电源轨
            if coil_vertex:
                edges.append({'from': coil_vertex, 'to': f'vr_{rung_index}', 'type': 'horizontal'})
            else:
                edges.append({'from': prev_vertex, 'to': f'vr_{rung_index}', 'type': 'horizontal'})
        
        self.ld_graph = {'vertices': vertices, 'edges': edges}
        return self.ld_graph
    
    def _create_vertex_id(self, var_name: str, element_type: str, rung_index: int) -> str:
        """创建顶点ID（论文中的顶点命名规则）"""
        type_map = {
            'NO': '0',    # 常开触点
            'NC': '1',    # 常闭触点
            'COIL': '2',  # 线圈
            'SET': '4',   # 置位线圈
            'RESET': '5'  # 复位线圈
        }
        return f'v_{var_name}_{type_map.get(element_type, "0")}_{rung_index}'
    
    def convert(self, ld_program: List) -> Dict:
        """
        主转换算法（论文中的Algorithm 1）
        """
        # 1. 构建LD图
        self.build_ld_graph(ld_program)
        
        # 2. 为每个变量创建库所对
        self._create_place_pairs(ld_program)
        
        # 3. 处理每个梯级的赋值节点（线圈）
        assigned_nodes = self._find_assigned_nodes()
        
        for node in assigned_nodes:
            # 4. 处理指令路径
            instruction_paths = self._find_instruction_paths(node)
            for path in instruction_paths:
                self._add_transition_for_instruction_path(node, path)
            
            # 5. 处理割集（仅对非置位/复位线圈）
            if not self._is_set_reset_coil(node):
                cut_sets = self._find_cut_sets(node)
                for cut_set in cut_sets:
                    self._add_transition_for_cut_set(node, cut_set)
        
        # 6. 处理输入变量
        self._add_input_transitions(ld_program)
        
        # 7. 消除冗余结构（论文中的Algorithm 2）
        self._reduce_redundant_structures()
        
        return self._build_result(ld_program)
    
    def _create_place_pairs(self, ld_program: List):
        """为每个变量创建ON/OFF库所对"""
        variables = set()
        
        # 提取所有变量
        for rung in ld_program:
            for element in rung:
                if isinstance(element, tuple):
                    var_name, element_type = element
                    variables.add(var_name)
                elif isinstance(element, dict):
                    for path in element.values():
                        for path_element in path:
                            if isinstance(path_element, tuple):
                                var_name, element_type = path_element
                                variables.add(var_name)
        
        # 为每个变量创建库所对
        for var in variables:
            # OFF状态库所
            off_place_id = f'p_{var}_0'
            self.places[off_place_id] = {
                'id': off_place_id,
                'variable': var,
                'state': 0,
                'type': 'variable_state'
            }
            self.initial_marking[off_place_id] = 1  # 初始状态为OFF
            
            # ON状态库所
            on_place_id = f'p_{var}_1'
            self.places[on_place_id] = {
                'id': on_place_id,
                'variable': var,
                'state': 1,
                'type': 'variable_state'
            }
            self.initial_marking[on_place_id] = 0
    
    def _find_assigned_nodes(self) -> List[Dict]:
        """找出所有赋值节点（连接到右侧电源轨的线圈）"""
        assigned_nodes = []
        for vertex in self.ld_graph['vertices']:
            if vertex.get('element_type') == 'COIL':
                # 检查是否连接到右侧电源轨
                for edge in self.ld_graph['edges']:
                    if edge['from'] == vertex['id'] and edge['to'].startswith('vr_'):
                        assigned_nodes.append(vertex)
                        break
        return assigned_nodes
    
    def _find_instruction_paths(self, coil_node: Dict) -> List[List[Dict]]:
        """
        找出指令路径（论文中的Definition 3）
        从左侧电源轨到线圈节点的所有路径
        """
        rung_index = coil_node['rung_index']
        left_power_rail = f'vl_{rung_index}'
        
        def dfs_find_paths(current: str, path: List, visited: Set) -> List[List]:
            if current == left_power_rail:
                return [path[::-1]]  # 反转路径使其从左到右
            
            paths = []
            visited.add(current)
            
            for edge in self.ld_graph['edges']:
                if edge['to'] == current and edge['from'] not in visited:
                    new_path = path + [self._get_vertex_by_id(edge['from'])]
                    paths.extend(dfs_find_paths(edge['from'], new_path, visited.copy()))
            
            return paths
        
        return dfs_find_paths(coil_node['id'], [coil_node], set())
    
    def _find_cut_sets(self, coil_node: Dict) -> List[Set[Dict]]:
        """
        找出割集（论文中的Definition 4）
        能够切断左侧电源轨到线圈连接的最小节点集合
        """
        # 简化的割集查找算法
        rung_index = coil_node['rung_index']
        relevant_vertices = [v for v in self.ld_graph['vertices'] 
                             if v.get('rung_index') == rung_index and v['id'] != coil_node['id']]
        
        cut_sets = []
        # 这里实现一个简化的割集算法，实际实现可能需要更复杂的图算法
        for vertex in relevant_vertices:
            if vertex.get('element_type') in ['NO', 'NC']:
                cut_sets.append({vertex})
        
        return cut_sets
    
    def _add_transition_for_instruction_path(self, coil_node: Dict, path: List[Dict]):
        """为指令路径添加变迁"""
        transition_id = f't_{self.transition_counter}_on'
        self.transition_counter += 1
        
        self.transitions[transition_id] = {
            'id': transition_id,
            'type': 'computing',
            'related_coil': coil_node['variable'],
            'path_type': 'instruction'
        }
        
        # 连接到线圈的ON状态库所
        coil_on_place = f'p_{coil_node["variable"]}_1'
        coil_off_place = f'p_{coil_node["variable"]}_0'
        
        # 从OFF状态到变迁
        self.arcs.append({
            'source': coil_off_place,
            'target': transition_id,
            'type': 'regular'
        })
        
        # 从变迁到ON状态
        self.arcs.append({
            'source': transition_id,
            'target': coil_on_place,
            'type': 'regular'
        })
        
        # 为路径中的每个触点添加双向弧
        for vertex in path:
            if vertex.get('element_type') in ['NO', 'NC']:
                contact_on_place = f'p_{vertex["variable"]}_1'
                # 双向弧（论文中的bidirectional arc）
                self.arcs.append({
                    'source': contact_on_place,
                    'target': transition_id,
                    'type': 'bidirectional'
                })
    
    def _add_transition_for_cut_set(self, coil_node: Dict, cut_set: Set[Dict]):
        """为割集添加变迁"""
        transition_id = f't_{self.transition_counter}_off'
        self.transition_counter += 1
        
        self.transitions[transition_id] = {
            'id': transition_id,
            'type': 'computing',
            'related_coil': coil_node['variable'],
            'path_type': 'cut_set'
        }
        
        # 连接到线圈的OFF状态库所
        coil_on_place = f'p_{coil_node["variable"]}_1'
        coil_off_place = f'p_{coil_node["variable"]}_0'
        
        # 从ON状态到变迁
        self.arcs.append({
            'source': coil_on_place,
            'target': transition_id,
            'type': 'regular'
        })
        
        # 从变迁到OFF状态
        self.arcs.append({
            'source': transition_id,
            'target': coil_off_place,
            'type': 'regular'
        })
        
        # 为割集中的每个触点添加双向弧
        for vertex in cut_set:
            if vertex.get('element_type') in ['NO', 'NC']:
                contact_off_place = f'p_{vertex["variable"]}_0'
                # 双向弧
                self.arcs.append({
                    'source': contact_off_place,
                    'target': transition_id,
                    'type': 'bidirectional'
                })
    
    def _add_input_transitions(self, ld_program: List):
        """为输入变量添加传感变迁"""
        input_vars = set()
        
        # 识别输入变量（触点）
        for rung in ld_program:
            for element in rung:
                if isinstance(element, tuple) and element[1] in ['NO', 'NC']:
                    input_vars.add(element[0])
                elif isinstance(element, dict):
                    for path in element.values():
                        for path_element in path:
                            if isinstance(path_element, tuple) and path_element[1] in ['NO', 'NC']:
                                input_vars.add(path_element[0])
        
        # 为每个输入变量添加两个传感变迁
        for var in input_vars:
            # ON变迁
            on_transition_id = f't_{var}_ON'
            self.transitions[on_transition_id] = {
                'id': on_transition_id,
                'type': 'sensing',
                'variable': var,
                'direction': 'ON'
            }
            
            off_place = f'p_{var}_0'
            on_place = f'p_{var}_1'
            
            # OFF -> ON 变迁
            self.arcs.append({'source': off_place, 'target': on_transition_id, 'type': 'regular'})
            self.arcs.append({'source': on_transition_id, 'target': on_place, 'type': 'regular'})
            
            # OFF变迁
            off_transition_id = f't_{var}_OFF'
            self.transitions[off_transition_id] = {
                'id': off_transition_id,
                'type': 'sensing',
                'variable': var,
                'direction': 'OFF'
            }
            
            # ON -> OFF 变迁
            self.arcs.append({'source': on_place, 'target': off_transition_id, 'type': 'regular'})
            self.arcs.append({'source': off_transition_id, 'target': off_place, 'type': 'regular'})
    
    def _reduce_redundant_structures(self):
        """
        消除冗余结构（论文中的Algorithm 2）
        移除那些输入包含同一变量ON和OFF状态库所的变迁
        """
        redundant_transitions = set()
        
        for transition_id, transition in self.transitions.items():
            if transition['type'] == 'computing':
                input_places = set()
                # 收集所有输入库所
                for arc in self.arcs:
                    if arc['target'] == transition_id and arc['type'] != 'bidirectional':
                        input_places.add(arc['source'])
                
                # 检查是否有同一变量的ON和OFF库所
                var_states = defaultdict(set)
                for place_id in input_places:
                    if place_id in self.places:
                        var = self.places[place_id]['variable']
                        state = self.places[place_id]['state']
                        var_states[var].add(state)
                
                for var, states in var_states.items():
                    if 0 in states and 1 in states:
                        redundant_transitions.add(transition_id)
                        break
        
        # 移除冗余变迁及其相关弧
        for trans_id in redundant_transitions:
            del self.transitions[trans_id]
            self.arcs = [arc for arc in self.arcs if arc['source'] != trans_id and arc['target'] != trans_id]
    
    def _is_set_reset_coil(self, node: Dict) -> bool:
        """检查是否为置位或复位线圈"""
        return node.get('element_type') in ['SET', 'RESET']
    
    def _get_vertex_by_id(self, vertex_id: str) -> Dict:
        """根据ID获取顶点"""
        for vertex in self.ld_graph['vertices']:
            if vertex['id'] == vertex_id:
                return vertex
        return None
    
    def _build_result(self, ld_program: List) -> Dict:
        """构建最终结果"""
        return {
            'places': list(self.places.values()),
            'transitions': list(self.transitions.values()),
            'arcs': self.arcs,
            'initial_marking': self.initial_marking,
            'metadata': {
                'source_ld': ld_program,
                'conversion_time': 'now',
                'algorithm_version': '1.0',
                'based_on': 'Luo et al. IEEE Transactions 2018'
            }
        }


# 使用示例
def example_usage():
    """示例用法"""
    # 定义LD程序（按照提供的格式）
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
    
    # 创建转换器实例
    converter = LadderDiagramToPetriNetConverter()
    
    # 执行转换
    petri_net = converter.convert(plc_ladder_diagram_logic)
    
    # 输出结果
    print("转换完成！")
    print(f"生成库所数量: {len(petri_net['places'])}")
    print(f"生成变迁数量: {len(petri_net['transitions'])}")
    print(f"生成弧数量: {len(petri_net['arcs'])}")
    
    return petri_net


if __name__ == "__main__":
    result = example_usage()