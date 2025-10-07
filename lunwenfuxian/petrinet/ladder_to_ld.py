class LDGraphConverter:
    def __init__(self):
        self.vertices = set()
        self.edges = set()
        self.vertex_counter = 0
        self.coil_counter = 0
        self.rung_count = 0
        
    def convert_to_ld_graph(self, ladder_diagram):
        print("Converting ladder diagram to LD Graph...")
        """
        将梯形图转换为LD Graph
        """
        self.rung_count = len(ladder_diagram)
        self._initialize_power_rail_vertices()
        
        for rung_index, rung in enumerate(ladder_diagram, 1):
            self._process_rung(rung, rung_index)
            
        return {
            'vertices': list(self.vertices),
            'edges': list(self.edges),
            'vertex_set_VL': [f'v_l{i}' for i in range(1, self.rung_count + 1)],
            'vertex_set_VR': [f'v_r{i}' for i in range(1, self.rung_count + 1)],
            'rung_count': self.rung_count
        }
    
    def _initialize_power_rail_vertices(self):
        """初始化电源轨节点"""
        for i in range(1, self.rung_count + 1):
            self.vertices.add(f'v_l{i}')  # 左电源轨节点
            self.vertices.add(f'v_r{i}')  # 右电源轨节点
    
    def _process_rung(self, rung, rung_index):
        """处理单个梯级"""
        previous_vertex = f'v_l{rung_index}'  # 起始于左电源轨
        coil_vertex = None
        
        for element in rung:
            if isinstance(element, tuple):
                # 处理单个触点或线圈
                vertex = self._create_vertex(element, rung_index)
                self._add_edge(previous_vertex, vertex)
                previous_vertex = vertex
                
                if element[1] in ['COIL', 'SET', 'RESET']:
                    coil_vertex = vertex
                    
            elif isinstance(element, dict):
                # 处理并联逻辑
                parallel_vertices = []
                for parallel_path in element.values():
                    path_end_vertex = self._process_parallel_path(parallel_path, 
                                                                previous_vertex, 
                                                                rung_index)
                    parallel_vertices.append(path_end_vertex)
                
                # 创建并联合并点
                merge_vertex = f'merge_{rung_index}_{self.vertex_counter}'
                self.vertex_counter += 1
                self.vertices.add(merge_vertex)
                
                for p_vertex in parallel_vertices:
                    self._add_edge(p_vertex, merge_vertex)
                
                previous_vertex = merge_vertex
        
        # 连接到右电源轨
        if coil_vertex:
            self._add_edge(coil_vertex, f'v_r{rung_index}')
        else:
            self._add_edge(previous_vertex, f'v_r{rung_index}')
    
    def _process_parallel_path(self, path_elements, start_vertex, rung_index):
        """处理并联路径"""
        current_vertex = start_vertex
        
        for element in path_elements:
            if isinstance(element, tuple):
                vertex = self._create_vertex(element, rung_index)
                self._add_edge(current_vertex, vertex)
                current_vertex = vertex
            elif isinstance(element, list):
                # 嵌套路径处理
                for sub_element in element:
                    vertex = self._create_vertex(sub_element, rung_index)
                    self._add_edge(current_vertex, vertex)
                    current_vertex = vertex
        
        return current_vertex
    
    def _create_vertex(self, element, rung_index):
        """创建变量节点"""
        var_name, element_type = element
        
        # 确定类型标识符s2
        type_map = {
            'NO': 0,    # 常开触点
            'NC': 1,    # 常闭触点
            'COIL': 2,  # 普通线圈
            'SET': 4,   # 置位线圈
            'RESET': 5  # 复位线圈
        }
        
        s2 = type_map.get(element_type, 0)
        
        # 确定位置标识符s3（如果是线圈）
        if element_type in ['COIL', 'SET', 'RESET']:
            self.coil_counter += 1
            s3 = self.coil_counter
        else:
            s3 = 0  # 触点使用0
            
        vertex = f'v_{var_name}_{s2}_{s3}'
        self.vertices.add(vertex)
        
        return vertex
    
    def _add_edge(self, from_vertex, to_vertex):
        """添加边"""
        edge = (from_vertex, to_vertex)
        self.edges.add(edge)

# 使用示例
def main():
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
                'path1': [('I0.2', 'NC')],
                'path2': [('M1', 'NO')]
            },
            ('Q0.1', 'COIL')
        ],
        
        # Rung 3: 自保持电路 - I0.3 并联 Q0.2 串联 Q0.2
        [
            ('I0.3', 'NO'),
            {  # 并联逻辑（自保持）
                'path1': [('I0.3', 'NO')],
                'path2': [('Q0.2', 'NO')]
            },
            ('Q0.2', 'COIL')
        ]
    ]
    
    # 转换梯形图为LD Graph
    converter = LDGraphConverter()
    ld_graph = converter.convert_to_ld_graph(plc_ladder_diagram_logic)
    
    # 输出结果
    print("LD Graph转换结果:")
    print("=" * 50)
    
    print("\n1. 顶点集合 (Vertices):")
    for vertex in sorted(ld_graph['vertices']):
        print(f"  {vertex}")
    
    print(f"\n2. 左电源轨节点 (VL): {ld_graph['vertex_set_VL']}")
    print(f"3. 右电源轨节点 (VR): {ld_graph['vertex_set_VR']}")
    
    print("\n4. 边集合 (Edges):")
    for edge in sorted(ld_graph['edges']):
        print(f"  {edge[0]} -> {edge[1]}")
    
    print(f"\n5. 统计信息:")
    print(f"  总顶点数: {len(ld_graph['vertices'])}")
    print(f"  总边数: {len(ld_graph['edges'])}")
    print(f"  梯级数量: {ld_graph['rung_count']}")

if __name__ == "__main__":
    main()