import copy
from collections import deque
from typing import Dict, List, Set, Tuple, Union, Deque

class LDGraphToPetriNetConverter:
    """
    完整的LD Graph到Petri网转换器
    包含DFS/BFS图遍历算法实现
    """
    
    def __init__(self):
        self.places = set()
        self.transitions = set()
        self.arcs = set()
        self.marking = {}
        self.variable_places = {}
        self.ld_graph = None
        
    def convert(self, ld_graph: Dict) -> Dict:
        print("开始转换LD Graph到Petri网...")
        """主转换函数"""
        self.ld_graph = ld_graph
        vertices = ld_graph['vertices']
        edges = ld_graph['edges']
        
        # 构建邻接表用于图遍历
        self.adjacency_list = self._build_adjacency_list(edges)
        self.reverse_adjacency_list = self._build_reverse_adjacency_list(edges)
        
        # 执行转换步骤
        self._create_places_for_variables(vertices)
        self._process_instruction_paths(vertices)
        self._process_cut_node_sets(vertices)
        self._process_input_variables(vertices)
        self._set_initial_marking()
        
        return self._get_petri_net_model()
    
    def _build_adjacency_list(self, edges: Set[Tuple[str, str]]) -> Dict[str, List[str]]:
        """构建邻接表"""
        adjacency_list = {}
        for from_node, to_node in edges:
            if from_node not in adjacency_list:
                adjacency_list[from_node] = []
            adjacency_list[from_node].append(to_node)
        return adjacency_list
    
    def _build_reverse_adjacency_list(self, edges: Set[Tuple[str, str]]) -> Dict[str, List[str]]:
        """构建反向邻接表"""
        reverse_adjacency_list = {}
        for from_node, to_node in edges:
            if to_node not in reverse_adjacency_list:
                reverse_adjacency_list[to_node] = []
            reverse_adjacency_list[to_node].append(from_node)
        return reverse_adjacency_list
    
    def _create_places_for_variables(self, vertices: Set[str]):
        """为每个变量创建库所对"""
        variable_names = set()
        
        for vertex in vertices:
            if vertex.startswith('v_') and not (vertex.startswith('v_l') or vertex.startswith('v_r')):
                parts = vertex.split('_')
                if len(parts) >= 2:
                    var_name = parts[1]
                    variable_names.add(var_name)
        
        for var_name in variable_names:
            place_on = f'p_{var_name}_1'
            place_off = f'p_{var_name}_0'
            
            self.places.add(place_on)
            self.places.add(place_off)
            
            self.variable_places[var_name] = {'on': place_on, 'off': place_off}
            
            self.marking[place_off] = 1
            self.marking[place_on] = 0
    
    def _process_instruction_paths(self, vertices: Set[str]):
        """处理指令路径 - 使用BFS算法"""
        coil_nodes = self._identify_coil_nodes(vertices)
        
        for coil_node in coil_nodes:
            var_name, coil_type, rung_index = self._parse_vertex_name(coil_node)
            
            if var_name not in self.variable_places:
                continue
                
            # 使用BFS查找所有从左电源轨到线圈的路径
            instruction_paths = self._find_all_paths_bfs(f'v_l{rung_index}', coil_node)
            
            for path_index, path in enumerate(instruction_paths, 1):
                # 移除电源轨节点，只保留指令节点
                instruction_path = [node for node in path if not node.startswith('v_l') and not node.startswith('v_r')]
                
                if not instruction_path:
                    continue
                    
                # 创建变迁
                transition_name = f't_{rung_index}_{path_index}_1'
                self.transitions.add(transition_name)
                
                # 连接变迁到线圈ON库所
                coil_on_place = self.variable_places[var_name]['on']
                self.arcs.add((transition_name, coil_on_place))
                
                # 连接线圈OFF库所到变迁
                coil_off_place = self.variable_places[var_name]['off']
                self.arcs.add((coil_off_place, transition_name))
                
                # 为路径中的每个节点添加双向弧
                for node in instruction_path:
                    node_var_name, _, _ = self._parse_vertex_name(node)
                    if node_var_name in self.variable_places:
                        node_on_place = self.variable_places[node_var_name]['on']
                        self.arcs.add((node_on_place, transition_name))
                        self.arcs.add((transition_name, node_on_place))
    
    def _process_cut_node_sets(self, vertices: Set[str]):
        """处理切断节点集 - 使用DFS算法"""
        coil_nodes = self._identify_coil_nodes(vertices)
        
        for coil_node in coil_nodes:
            var_name, coil_type, rung_index = self._parse_vertex_name(coil_node)
            
            if var_name not in self.variable_places:
                continue
                
            # 使用DFS查找最小切断集
            cut_sets = self._find_min_cut_sets_dfs(f'v_l{rung_index}', coil_node)
            
            for set_index, cut_set in enumerate(cut_sets, 1):
                # 创建变迁
                transition_name = f't_{rung_index}_{set_index}_0'
                self.transitions.add(transition_name)
                
                # 连接变迁到线圈OFF库所
                coil_off_place = self.variable_places[var_name]['off']
                self.arcs.add((transition_name, coil_off_place))
                
                # 连接线圈ON库所到变迁
                coil_on_place = self.variable_places[var_name]['on']
                self.arcs.add((coil_on_place, transition_name))
                
                # 为切断集中的每个节点添加双向弧
                for node in cut_set:
                    node_var_name, _, _ = self._parse_vertex_name(node)
                    if node_var_name in self.variable_places:
                        node_off_place = self.variable_places[node_var_name]['off']
                        self.arcs.add((node_off_place, transition_name))
                        self.arcs.add((transition_name, node_off_place))
    
    def _find_all_paths_bfs(self, start: str, end: str) -> List[List[str]]:
        """
        使用BFS算法查找所有从start到end的路径
        避免循环路径，确保路径简单
        """
        if start not in self.adjacency_list or end not in self.reverse_adjacency_list:
            return []
            
        # 使用BFS进行层级遍历
        queue = deque([(start, [start])])
        all_paths = []
        
        while queue:
            current_node, current_path = queue.popleft()
            
            if current_node == end:
                all_paths.append(current_path.copy())
                continue
                
            if current_node not in self.adjacency_list:
                continue
                
            for neighbor in self.adjacency_list[current_node]:
                # 避免循环
                if neighbor not in current_path:
                    new_path = current_path + [neighbor]
                    queue.append((neighbor, new_path))
        
        return all_paths
    
    def _find_min_cut_sets_dfs(self, start: str, end: str) -> List[Set[str]]:
        """
        使用DFS算法查找最小切断节点集
        基于最大流最小割定理的简化实现
        """
        # 首先找到所有路径
        all_paths = self._find_all_paths_bfs(start, end)
        
        if not all_paths:
            return []
        
        # 提取所有指令节点
        all_instruction_nodes = set()
        for path in all_paths:
            for node in path:
                if not (node.startswith('v_l') or node.startswith('v_r')):
                    all_instruction_nodes.add(node)
        
        # 简化实现：返回包含每个路径至少一个节点的最小集合
        # 实际应使用标准的最大流最小割算法
        min_cut_sets = []
        
        # 方法1: 每个路径的第一个指令节点
        first_node_cut = set()
        for path in all_paths:
            for node in path:
                if not (node.startswith('v_l') or node.startswith('v_r')):
                    first_node_cut.add(node)
                    break
        min_cut_sets.append(first_node_cut)
        
        # 方法2: 选择出现在最多路径中的节点
        node_frequency = {}
        for path in all_paths:
            for node in path:
                if not (node.startswith('v_l') or node.startswith('v_r')):
                    node_frequency[node] = node_frequency.get(node, 0) + 1
        
        if node_frequency:
            max_freq_node = max(node_frequency.items(), key=lambda x: x[1])[0]
            min_cut_sets.append({max_freq_node})
        
        return min_cut_sets
    
    def _process_input_variables(self, vertices: Set[str]):
        """处理输入变量"""
        input_vars = set()
        for vertex in vertices:
            if vertex.startswith('v_'):
                parts = vertex.split('_')
                if len(parts) >= 3 and parts[2] in ['0', '1']:
                    input_vars.add(parts[1])
        
        for var_name in input_vars:
            if var_name not in self.variable_places:
                continue
                
            on_place = self.variable_places[var_name]['on']
            off_place = self.variable_places[var_name]['off']
            
            transition_on = f't_{var_name}_on'
            self.transitions.add(transition_on)
            self.arcs.add((off_place, transition_on))
            self.arcs.add((transition_on, on_place))
            
            transition_off = f't_{var_name}_off'
            self.transitions.add(transition_off)
            self.arcs.add((on_place, transition_off))
            self.arcs.add((transition_off, off_place))
    
    def _set_initial_marking(self):
        """设置初始标识"""
        for place in self.places:
            if place.endswith('_0'):
                self.marking[place] = 1
            else:
                self.marking[place] = 0
    
    def _identify_coil_nodes(self, vertices: Set[str]) -> List[str]:
        """识别线圈节点"""
        coil_nodes = []
        for vertex in vertices:
            if vertex.startswith('v_'):
                parts = vertex.split('_')
                if len(parts) >= 3 and parts[2] in ['2', '3', '4', '5']:
                    coil_nodes.append(vertex)
        return coil_nodes
    
    def _parse_vertex_name(self, vertex: str) -> Tuple[str, str, int]:
        """解析顶点名称"""
        parts = vertex.split('_')
        if len(parts) >= 4:
            return parts[1], parts[2], int(parts[3])
        return "", "", 0
    
    def _get_petri_net_model(self) -> Dict:
        """获取Petri网模型"""
        return {
            'places': list(self.places),
            'transitions': list(self.transitions),
            'arcs': list(self.arcs),
            'marking': copy.deepcopy(self.marking),
            'variable_mapping': copy.deepcopy(self.variable_places)
        }

class GraphAnalysisTools:
    """图分析工具类"""
    
    @staticmethod
    def analyze_graph_structure(ld_graph: Dict) -> Dict:
        """分析图结构特征"""
        vertices = ld_graph['vertices']
        edges = ld_graph['edges']
        
        # 构建邻接表
        adjacency_list = {}
        for from_node, to_node in edges:
            if from_node not in adjacency_list:
                adjacency_list[from_node] = []
            adjacency_list[from_node].append(to_node)
        
        # 计算图指标
        in_degree = {}
        out_degree = {}
        
        for node in vertices:
            in_degree[node] = 0
            out_degree[node] = 0
        
        for from_node, to_node in edges:
            out_degree[from_node] += 1
            in_degree[to_node] += 1
        
        # 识别关键节点
        coil_nodes = [v for v in vertices if v.startswith('v_') and len(v.split('_')) >= 3 
                     and v.split('_')[2] in ['2', '3', '4', '5']]
        
        return {
            'total_vertices': len(vertices),
            'total_edges': len(edges),
            'max_in_degree': max(in_degree.values()),
            'max_out_degree': max(out_degree.values()),
            'coil_nodes_count': len(coil_nodes),
            'avg_degree': len(edges) / len(vertices) if vertices else 0
        }

# 使用示例和测试
def test_complete_conversion():
    """测试完整的转换过程"""
    
    # 创建测试LD Graph
    # test_ld_graph = {
    #     'vertices': {
    #         'v_l1', 'v_r1', 'v_l2', 'v_r2',
    #         'v_I0.0_0_0', 'v_Q0.0_2_1',
    #         'v_I0.1_0_0', 'v_I0.2_1_0', 'v_M1_0_0', 'v_Q0.1_2_2'
    #     },
    #     'edges': {
    #         ('v_l1', 'v_I0.0_0_0'), ('v_I0.0_0_0', 'v_Q0.0_2_1'), ('v_Q0.0_2_1', 'v_r1'),
    #         ('v_l2', 'v_I0.1_0_0'), ('v_I0.1_0_0', 'v_I0.2_1_0'), ('v_I0.2_1_0', 'v_Q0.1_2_2'),
    #         ('v_I0.1_0_0', 'v_M1_0_0'), ('v_M1_0_0', 'v_Q0.1_2_2'), ('v_Q0.1_2_2', 'v_r2')
    #     },
    #     'rung_count': 2
    # }
    test_ld_graph = {'vertices': ['v_r1', 'v_Q0.0_2_1', 'v_I0.2_1_0', 'v_I0.3_0_0', 'v_r3', 'v_Q0.2_0_0', 'v_Q0.2_2_3', 'v_M1_0_0', 'v_l3', 'merge_2_0', 'v_I0.0_0_0', 'v_r2', 'v_I0.1_0_0', 'v_l2', 'v_l1', 'v_Q0.1_2_2', 'merge_3_1'], 'edges': [('v_l1', 'v_I0.0_0_0'), ('v_l2', 'v_I0.1_0_0'), ('v_I0.3_0_0', 'v_Q0.2_0_0'), ('v_I0.3_0_0', 'merge_3_1'), ('v_I0.3_0_0', 'v_I0.3_0_0'), ('v_Q0.2_0_0', 'merge_3_1'), ('merge_2_0', 'v_Q0.1_2_2'), ('v_I0.1_0_0', 'v_M1_0_0'), ('v_Q0.0_2_1', 'v_r1'), ('v_l3', 'v_I0.3_0_0'), ('v_Q0.1_2_2', 'v_r2'), ('v_M1_0_0', 'merge_2_0'), ('v_I0.1_0_0', 'v_I0.2_1_0'), ('v_I0.0_0_0', 'v_Q0.0_2_1'), ('merge_3_1', 'v_Q0.2_2_3'), ('v_Q0.2_2_3', 'v_r3'), ('v_I0.2_1_0', 'merge_2_0')], 'vertex_set_VL': ['v_l1', 'v_l2', 'v_l3'], 'vertex_set_VR': ['v_r1', 'v_r2', 'v_r3'], 'rung_count': 3}
    
    print("测试LD Graph结构:")
    print("=" * 50)
    analysis = GraphAnalysisTools.analyze_graph_structure(test_ld_graph)
    for key, value in analysis.items():
        print(f"{key}: {value}")
    
    # 执行转换
    converter = LDGraphToPetriNetConverter()
    petri_net = converter.convert(test_ld_graph)
    
    print(petri_net)
    
    print("\n转换结果:")
    print("=" * 50)
    print(f"库所数量: {len(petri_net['places'])}")
    print(f"变迁数量: {len(petri_net['transitions'])}")
    print(f"弧数量: {len(petri_net['arcs'])}")
    
    # 显示部分结果
    print("\n前10个库所:")
    for place in sorted(list(petri_net['places']))[:10]:
        print(f"  {place}: {petri_net['marking'][place]} tokens")
    
    print("\n前10个变迁:")
    for transition in sorted(list(petri_net['transitions']))[:10]:
        print(f"  {transition}")
    
    return petri_net

def performance_test():
    """性能测试"""
    import time
    
    # 创建更大规模的测试图
    large_ld_graph = {
        'vertices': set(),
        'edges': set(),
        'rung_count': 5
    }
    
    # 添加顶点和边
    for i in range(1, 6):
        large_ld_graph['vertices'].add(f'v_l{i}')
        large_ld_graph['vertices'].add(f'v_r{i}')
        
        for j in range(10):  # 每个梯级10个元素
            large_ld_graph['vertices'].add(f'v_I{i}.{j}_0_0')
            large_ld_graph['vertices'].add(f'v_Q{i}.{j}_2_{i*10+j}')
            
            if j > 0:
                large_ld_graph['edges'].add((f'v_I{i}.{j-1}_0_0', f'v_I{i}.{j}_0_0'))
            large_ld_graph['edges'].add((f'v_I{i}.{j}_0_0', f'v_Q{i}.{j}_2_{i*10+j}'))
        
        large_ld_graph['edges'].add((f'v_l{i}', f'v_I{i}.0_0_0'))
        large_ld_graph['edges'].add((f'v_Q{i}.9_2_{i*10+9}', f'v_r{i}'))
    
    print("性能测试:")
    print("=" * 50)
    analysis = GraphAnalysisTools.analyze_graph_structure(large_ld_graph)
    for key, value in analysis.items():
        print(f"{key}: {value}")
    
    # 计时转换
    start_time = time.time()
    converter = LDGraphToPetriNetConverter()
    petri_net = converter.convert(large_ld_graph)
    end_time = time.time()
    
    print(f"\n转换时间: {end_time - start_time:.3f} 秒")
    print(f"生成库所: {len(petri_net['places'])}")
    print(f"生成变迁: {len(petri_net['transitions'])}")
    print(f"生成弧: {len(petri_net['arcs'])}")

if __name__ == "__main__":
    # 运行测试
    test_result = test_complete_conversion()
    print("\n" + "="*60)
    performance_test()