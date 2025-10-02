class LadderDiagramToPetriNetConverter:
    """
    将梯形图(LD)转换为普通Petri网(PN)的转换器
    基于论文《Modeling and Race Detection of Ladder Diagrams via Ordinary Petri Nets》的算法
    """
    
    def __init__(self):
        self.places = {}          # 存储所有库所: {place_id: place_data}
        self.transitions = {}     # 存储所有变迁: {transition_id: transition_data}
        self.arcs = []           # 存储所有弧: [(source, target, type)]
        self.initial_marking = {} # 初始标识: {place_id: token_count}
        self.variable_counter = 0
        self.transition_counter = 0
    
    def create_place(self, variable_name, state):
        """创建库所"""
        place_id = f"p_{variable_name}_{state}"
        if place_id not in self.places:
            self.places[place_id] = {
                'id': place_id,
                'variable': variable_name,
                'state': state,
                'type': 'regular'
            }
            # 初始状态：OFF状态有1个token，ON状态有0个token
            self.initial_marking[place_id] = 1 if state == 0 else 0
        return place_id
    
    def create_transition(self, prefix="t"):
        """创建变迁"""
        transition_id = f"{prefix}_{self.transition_counter}"
        self.transition_counter += 1
        self.transitions[transition_id] = {
            'id': transition_id,
            'type': 'computing'  # 默认为计算变迁，后续可调整
        }
        return transition_id
    
    def add_arc(self, source, target, arc_type='regular'):
        """添加弧"""
        arc_id = f"arc_{len(self.arcs)}"
        self.arcs.append({
            'id': arc_id,
            'source': source,
            'target': target,
            'type': arc_type
        })
        return arc_id
    
    def process_variable(self, variable_name, variable_type):
        """为每个变量创建ON/OFF状态库所"""
        off_place = self.create_place(variable_name, 0)
        on_place = self.create_place(variable_name, 1)
        return off_place, on_place
    
    def find_instruction_paths(self, rung, target_coil):
        """
        查找指令路径（简化实现）
        在实际应用中需要实现完整的图遍历算法
        """
        paths = []
        current_path = []
        
        def dfs(element_index, current_path):
            if element_index >= len(rung):
                return
            
            element = rung[element_index]
            
            if isinstance(element, tuple) and element[1] == 'COIL' and element[0] == target_coil:
                paths.append(current_path.copy())
                return
            
            if isinstance(element, tuple):
                current_path.append(element)
                dfs(element_index + 1, current_path)
                current_path.pop()
            elif isinstance(element, set):
                # 处理并联逻辑
                for parallel_path in element:
                    for parallel_element in parallel_path:
                        current_path.append(parallel_element)
                        dfs(element_index + 1, current_path)
                        current_path.pop()
        
        dfs(0, [])
        return paths
    
    def find_cut_sets(self, rung, target_coil):
        """
        查找割集（简化实现）
        在实际应用中需要实现最小割集算法
        """
        cut_sets = []
        # 简化为将每个串联元素视为一个割集
        for element in rung:
            if isinstance(element, tuple) and element[1] != 'COIL':
                cut_sets.append([element])
            elif isinstance(element, set):
                for parallel_path in element:
                    cut_sets.append(list(parallel_path))
        
        return cut_sets
    
    def convert_rung(self, rung, rung_index):
        """转换单个梯级"""
        # 1. 识别本梯级中的所有线圈（赋值节点）
        coils = []
        for element in rung:
            if isinstance(element, tuple) and element[1] == 'COIL':
                coils.append(element[0])
        
        for coil in coils:
            # 为线圈变量创建库所
            coil_off, coil_on = self.process_variable(coil, 'coil')
            
            # 2. 查找指令路径并创建"通电"变迁
            instruction_paths = self.find_instruction_paths(rung, coil)
            
            for path_index, path in enumerate(instruction_paths):
                transition_id = self.create_transition(f"t{rung_index}_ON")
                
                # 添加弧：从线圈OFF到变迁，从变迁到线圈ON
                self.add_arc(coil_off, transition_id)
                self.add_arc(transition_id, coil_on)
                
                # 为路径中的每个触点添加双向弧
                for contact in path:
                    if contact[1] in ['NO', 'NC']:
                        contact_var = contact[0]
                        contact_off, contact_on = self.process_variable(contact_var, 'contact')
                        
                        # 根据触点类型选择状态库所
                        state_place = contact_on if contact[1] == 'NO' else contact_off
                        self.add_arc(state_place, transition_id, 'bidirectional')
            
            # 3. 查找割集并创建"断电"变迁（普通线圈才需要）
            cut_sets = self.find_cut_sets(rung, coil)
            
            for cutset_index, cutset in enumerate(cut_sets):
                transition_id = self.create_transition(f"t{rung_index}_OFF")
                
                # 添加弧：从线圈ON到变迁，从变迁到线圈OFF
                self.add_arc(coil_on, transition_id)
                self.add_arc(transition_id, coil_off)
                
                # 为割集中的每个触点添加双向弧
                for contact in cutset:
                    if isinstance(contact, tuple) and contact[1] in ['NO', 'NC']:
                        contact_var = contact[0]
                        contact_off, contact_on = self.process_variable(contact_var, 'contact')
                        
                        # 根据触点类型选择状态库所
                        state_place = contact_off if contact[1] == 'NO' else contact_on
                        self.add_arc(state_place, transition_id, 'bidirectional')
    
    def process_input_variables(self, ld_program):
        """处理输入变量（创建自循环变迁）"""
        all_variables = set()
        
        # 收集所有变量
        for rung in ld_program:
            for element in rung:
                if isinstance(element, tuple):
                    all_variables.add(element[0])
                elif isinstance(element, set):
                    for parallel_path in element:
                        for contact in parallel_path:
                            all_variables.add(contact[0])
        
        # 为每个输入变量创建自循环变迁
        for var in all_variables:
            off_place, on_place = self.process_variable(var, 'input')
            
            # 创建ON变迁（OFF → ON）
            on_transition = self.create_transition(f"t_{var}_ON")
            self.add_arc(off_place, on_transition)
            self.add_arc(on_transition, on_place)
            
            # 创建OFF变迁（ON → OFF）
            off_transition = self.create_transition(f"t_{var}_OFF")
            self.add_arc(on_place, off_transition)
            self.add_arc(off_transition, off_place)
    
    def convert(self, ld_program):
        """主转换函数"""
        print("开始转换LD程序到Petri网...")
        
        # 1. 处理所有输入变量
        self.process_input_variables(ld_program)
        
        # 2. 处理每个梯级
        for rung_index, rung in enumerate(ld_program):
            print(f"处理梯级 {rung_index + 1}: {rung}")
            self.convert_rung(rung, rung_index + 1)
        
        # 3. 构建结果
        result = {
            'places': list(self.places.values()),
            'transitions': list(self.transitions.values()),
            'arcs': self.arcs,
            'initial_marking': self.initial_marking,
            'metadata': {
                'source_ld': ld_program,
                'conversion_time': 'now',
                'algorithm_version': '1.0'
            }
        }
        
        print(f"转换完成！生成 {len(self.places)} 个库所, {len(self.transitions)} 个变迁, {len(self.arcs)} 条弧")
        return result
    
    def export_pnml(self, output_file=None):
        """导出为PNML格式（Petri网标记语言）"""
        # 这里可以实现PNML导出功能
        pass
    
    def visualize(self):
        """可视化生成的Petri网"""
        # 这里可以实现可视化功能（使用graphviz等库）
        pass
    

def print_full_petri_net(petri_net):
    """
    打印完整的Petri网结构
    Args:
        petri_net: 转换后的Petri网数据结构
    """
    print("\n" + "="*80)
    print("📊 完整的Petri网结构")
    print("="*80)
    
    # 1. 打印所有库所(Places)
    print("\n🏛️ 库所(Places):")
    print(f"总数: {len(petri_net['places'])}")
    for place in petri_net['places']:
        tokens = petri_net['initial_marking'].get(place['id'], 0)
        print(f"  {place['id']} (变量: {place['variable']}, 状态: {place['state']}, 初始令牌: {tokens})")
    
    # 2. 打印所有变迁(Transitions)
    print("\n🔄 变迁(Transitions):")
    print(f"总数: {len(petri_net['transitions'])}")
    for transition in petri_net['transitions']:
        print(f"  {transition['id']} (类型: {transition['type']})")
    
    # 3. 打印所有弧(Arcs)
    print("\n➡️ 弧(Arcs):")
    print(f"总数: {len(petri_net['arcs'])}")
    for arc in petri_net['arcs']:
        print(f"  {arc['id']}: {arc['source']} → {arc['target']} (类型: {arc['type']})")
    
    # 4. 打印初始标识
    print("\n🔢 初始标识(Initial Marking):")
    for place_id, tokens in petri_net['initial_marking'].items():
        print(f"  {place_id}: {tokens} token(s)")
    
    print("="*80 + "\n")
    
    # import json
    
    print(petri_net)
    
    #     # 将字典写入 JSON 文件
    # with open("petri_net.json", "w", encoding="utf-8") as f:
    #     json.dump(petri_net, f, ensure_ascii=False, indent=4)
    
    return petri_net


# 示例使用
def example_usage():
    """使用示例"""
    # 定义LD程序（按照您提供的格式）
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
    
    # 创建转换器并执行转换
    converter = LadderDiagramToPetriNetConverter()
    petri_net = converter.convert(plc_ladder_diagram_logic)
    
    # # 输出转换结果摘要
    # print("\n=== 转换结果摘要 ===")
    # print(f"库所数量: {len(petri_net['places'])}")
    # print(f"变迁数量: {len(petri_net['transitions'])}")
    # print(f"弧数量: {len(petri_net['arcs'])}")
    
    # print("\n=== 前5个库所 ===")
    # for place in petri_net['places'][:5]:  # 直接切片列表
    #     print(f"  {place['id']} (变量: {place['variable']}, 状态: {place['state']})")

    
    # print("\n=== 前5个变迁 ===")
    # for transition in list(petri_net['transitions'])[:5]:
    #     print(f"  {transition['id']} (类型: {transition['type']})")
    
        
    # 打印完整的Petri网结构
    print_full_petri_net(petri_net)
    
    return petri_net


if __name__ == "__main__":
    # 运行示例
    result = example_usage()