# 修正后的梯形图输入：用嵌套列表替代集合
plc_ladder_diagram = [
    # Rung 1: 串联
    [
        ('I0.0', 'NO'),
        ('Q0.0', 'COIL')
    ],

    # Rung 2: 
    # I0.1 串联着 (I0.2 并联 M1)，然后再串联 Q0.1
    [
        ('I0.1', 'NO'),
        [  # 外层列表是串联
            [  # 嵌套的内层列表表示并联结构
                ('I0.2', 'NC'),
            ],
            [
                ('M1', 'NO')
            ]
        ],
        ('Q0.1', 'COIL')
    ],
]

# 示例输入：I0.1 串联 (I0.2 并联 M1) 串联 Q0.1
plc_ladder_diagram_correct = [
    [
        ('I0.1', 'NO'),
        {  # 并联结构，使用集合
            [('I0.2', 'NC')],  # 并联路径 1
            [('M1', 'NO')]     # 并联路径 2
        },
        ('Q0.1', 'COIL')
    ]
]

def convert_ladder_to_ld_graph(ladder_program):
    """
    将结构化的梯形图程序转换为LD图（邻接表）。
    Args:
        ladder_program (list): 结构化的梯形图输入。
                               - 列表 [...]：表示串联关系。
                               - 集合 {...}：表示并联关系。
                               - 元组 ('Name', 'Type')：表示单个元件。
    Returns:
        dict: LD图的邻接表。
    """
    LD_GRAPH = {
        '$N_{in}$': [],
        '$N_{out}$': []
    }

    # 辅助函数：添加边，并确保节点存在且无重复边
    def add_edge(u, v):
        if u not in LD_GRAPH:
            LD_GRAPH[u] = []
        if v not in LD_GRAPH[u]:
            LD_GRAPH[u].append(v)

    # 递归函数：处理片段，返回该片段所有路径的终点节点列表
    def process_segment(segment, current_predecessor_nodes):
        
        # 1. 处理单个元件 (元组: ('Name', 'Type'))
        if isinstance(segment, tuple) and len(segment) == 2 and isinstance(segment[0], str): 
            component_name = segment[0]
            
            # 添加从所有前驱到新元件的边
            for pred_node in current_predecessor_nodes:
                add_edge(pred_node, component_name)
                
            # 新元件成为下一个环节的唯一前驱
            return [component_name]
        
        # 2. 处理串联结构 (列表: [...])
        elif isinstance(segment, list):
            path_end_nodes = current_predecessor_nodes
            # 遍历列表中的每一个元件或子结构
            for item in segment:
                # 关键点：将上一个 item 的终点作为当前 item 的起点
                path_end_nodes = process_segment(item, path_end_nodes)
            return path_end_nodes
        
        # 3. 处理并联结构 (集合: {...})
        elif isinstance(segment, set):
            
            all_parallel_ends = []
            
            # 遍历集合中的每个并联路径
            for path_segment in segment:
                # 关键点：每个并联路径都从相同的 current_predecessor_nodes 开始 (分叉逻辑)
                end_nodes = process_segment(path_segment, current_predecessor_nodes)
                all_parallel_ends.extend(end_nodes)
            
            # 返回所有路径的终点，这些终点将作为下一个串联元件的共同前驱 (汇聚逻辑)
            return all_parallel_ends

        # 如果段不是预期的类型，返回前驱节点 (跳过)
        return current_predecessor_nodes 


    # 遍历每一个 Rung
    for rung in ladder_program:
        # 1. 规则：左母线连接到每一行的第一个元件
        rung_start_predecessors = ['$N_{in}$']

        # 2. 核心处理
        rung_end_nodes = process_segment(rung, rung_start_predecessors)

        # 3. 规则：每一行的最后一个元件连接到右母线
        for end_node in rung_end_nodes:
            add_edge(end_node, '$N_{out}$')
                
    # 移除 $N_{out}$ 的空列表
    if '$N_{out}$' in LD_GRAPH:
        del LD_GRAPH['$N_{out}$']

    return LD_GRAPH

# 运行转换
ld_graph_result = convert_ladder_to_ld_graph(plc_ladder_diagram_correct)

# 打印结果
print("--- 梯形图输入 ---")
import json
print(json.dumps(plc_ladder_diagram_correct, indent=4))
print("\n--- LD图 (邻接表) 结果 ---")
print(json.dumps(ld_graph_result, indent=4))