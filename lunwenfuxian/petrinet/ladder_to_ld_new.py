import json

# 正确的逻辑结构输入：集合用于并联，且集合中的路径必须是元组
# plc_ladder_diagram_logic 是用于 convert_ladder_to_ld_graph 函数的输入
plc_ladder_diagram_logic = [
    # Rung 1: 简单串联
    [
        ('I0.0', 'NO'),
        ('Q0.0', 'COIL')
    ],

    # Rung 2: I0.1 串联 (I0.2 并联 M1) 串联 Q0.1
    [
        ('I0.1', 'NO'),
        {  # <-- 使用集合 (set) 明确标记并联逻辑
            (('I0.2', 'NC'),),  # 路径 1：必须是元组，且内容是元组
            (('M1', 'NO'),)     # 路径 2：必须是元组
        },
        ('Q0.1', 'COIL')
    ]
]


# 打印辅助函数：将集合转换为列表以便 JSON 序列化
def safe_for_print(data):
    if isinstance(data, list):
        return [safe_for_print(item) for item in data]
    elif isinstance(data, set):
        # 递归地将集合转换为列表 (JSON 兼容)
        return [safe_for_print(item) for item in list(data)]
    elif isinstance(data, tuple):
        return tuple(safe_for_print(list(data)))
    else:
        return data

# (转换函数 convert_ladder_to_ld_graph 保持我们上次修正的版本不变，因为它处理集合的逻辑是正确的)

def convert_ladder_to_ld_graph(ladder_program):
    # ... (函数体与上一个回答中提供的修正版本完全一致，处理 list 和 set 的逻辑是分离的)
    LD_GRAPH = {
        '$N_{in}$': [],
        '$N_{out}$': []
    }

    def add_edge(u, v):
        if u not in LD_GRAPH:
            LD_GRAPH[u] = []
        if v not in LD_GRAPH[u]:
            LD_GRAPH[u].append(v)

    def process_segment(segment, current_predecessor_nodes):
        
        # 1. 处理单个元件 (元组)
        if isinstance(segment, tuple) and len(segment) == 2 and isinstance(segment[0], str): 
            component_name = segment[0]
            for pred_node in current_predecessor_nodes:
                add_edge(pred_node, component_name)
            return [component_name]
        
        # 2. 处理串联结构 (列表: [...])
        elif isinstance(segment, list):
            path_end_nodes = current_predecessor_nodes
            for item in segment:
                path_end_nodes = process_segment(item, path_end_nodes)
            return path_end_nodes
        
        # 3. 处理并联结构 (集合: {...})
        elif isinstance(segment, set):
            all_parallel_ends = []
            for path_segment in segment:
                # 关键：每个路径都从共同的前驱节点开始
                end_nodes = process_segment(path_segment, current_predecessor_nodes)
                all_parallel_ends.extend(end_nodes)
            return all_parallel_ends
        
        return current_predecessor_nodes 


    # 遍历每一个 Rung
    for rung in ladder_program:
        rung_start_predecessors = ['$N_{in}$']
        rung_end_nodes = process_segment(rung, rung_start_predecessors)

        for end_node in rung_end_nodes:
            add_edge(end_node, '$N_{out}$')
                
    if '$N_{out}$' in LD_GRAPH:
        del LD_GRAPH['$N_{out}$']

    return LD_GRAPH


# 运行转换
ld_graph_result = convert_ladder_to_ld_graph(plc_ladder_diagram_logic)

# 打印结果（使用辅助函数解决 JSON 错误）
print("--- 梯形图输入（使用集合和元组）---")
print(json.dumps(safe_for_print(plc_ladder_diagram_logic), indent=4))
print("\n--- LD图 (邻接表) 结果 ---")
print(json.dumps(ld_graph_result, indent=4))