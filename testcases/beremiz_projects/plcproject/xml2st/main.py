import xml.etree.ElementTree as ET
from collections import defaultdict

class OpenPLC_XML_to_ST:
    def __init__(self, xml_file):
        self.xml_file = xml_file
        self.st_code = ""
        self.variables = set()
        self.rung_count = 0
        self.var_map = defaultdict(list)  # 存储变量对应的所有操作

    def parse_xml(self):
        try:
            tree = ET.parse(self.xml_file)
            root = tree.getroot()
            
            # 提取硬件配置信息
            config = root.find('.//configuration')
            if config is not None:
                scan_cycle = config.find('scan_cycle')
                if scan_cycle is not None:
                    self.st_code += f"// 扫描周期: {scan_cycle.text}ms\n\n"
            
            # 解析主程序
            main_pou = root.find(".//pou[@name='MAIN']")
            if main_pou is None:
                raise ValueError("未找到MAIN程序组织单元")
                
            ladder = main_pou.find('ladder')
            if ladder is None:
                raise ValueError("梯形图定义不存在")
            
            self._process_ladder(ladder)
            return self._generate_final_st()
            
        except ET.ParseError as e:
            raise ValueError(f"XML解析错误: {str(e)}")

    def _process_ladder(self, ladder):
        """处理梯形图元素"""
        # 按Y坐标分组形成梯级
        rungs = defaultdict(list)
        for elem in ladder:
            if elem.tag == 'block':
                y_pos = int(elem.get('y'))
                rungs[y_pos].append(elem)
            elif elem.tag == 'line':
                continue  # 连接线在ST中不需要显式表示
        
        # 按Y坐标排序处理梯级
        for y_pos in sorted(rungs.keys()):
            self.rung_count += 1
            self.st_code += f"// 梯级 {self.rung_count}\n"
            self._process_rung(rungs[y_pos])
            self.st_code += "\n"


    def _process_rung(self, rung_blocks):
        """处理单个梯级"""
        # 分类存储元素
        contacts = []
        coils = []
        functions = []
        
        for block in rung_blocks:
            block_type = block.get('type')
            if block_type in ('contact', 'negated_contact'):
                contacts.append(block)
            elif block_type == 'coil':
                coils.append(block)
            elif block_type in ('ton', 'tof', 'ctd', 'ctu'):  # 功能块
                functions.append(block)
        
        # 生成ST条件部分
        conditions = []
        for contact in contacts:
            var = contact.find("field[@name='VAR']").text
            edge = contact.find("field[@name='EDGE']")
            is_normal = (edge is None) or (edge.text == '0')
            
            self.variables.add(var)
            conditions.append(f"NOT {var}" if not is_normal else var)
        
        # 生成ST输出部分
        outputs = []
        for coil in coils:
            var = coil.find("field[@name='VAR']").text
            negated = coil.find("field[@name='NEGATED']")
            is_negated = (negated is not None) and (negated.text == '1')
            
            self.variables.add(var)
            self.var_map[var].append(self.rung_count)
            outputs.append(f"{var} := {'FALSE' if is_negated else 'TRUE'};")
        
        # 生成功能块代码
        for func in functions:
            outputs.append(self._process_function_block(func))
        
        # 组合成完整ST语句
        if conditions:
            self.st_code += f"IF {' AND '.join(conditions)} THEN\n"
            for output in outputs:
                self.st_code += f"  {output}\n"
            self.st_code += "END_IF;"
        else:  # 无条件梯级
            for output in outputs:
                self.st_code += f"{output}\n"

    def _process_function_block(self, block):
        """处理功能块指令"""
        block_type = block.get('type')
        var = block.find("field[@name='VAR']").text
        
        if block_type == 'ton':  # 通电延时定时器
            pt = block.find("field[@name='PT']").text
            en = block.find("field[@name='EN']").text
            q = block.find("field[@name='Q']").text
            
            self.variables.update([var, en, q])
            return f"{var}(IN := {en}, PT := {pt}, Q => {q});"
        
        elif block_type == 'ctud':  # 加减计数器
            cu = block.find("field[@name='CU']").text
            cd = block.find("field[@name='CD']").text
            pv = block.find("field[@name='PV']").text
            qu = block.find("field[@name='QU']").text
            qd = block.find("field[@name='QD']").text
            
            self.variables.update([var, cu, cd, qu, qd])
            return f"{var}(CU := {cu}, CD := {cd}, PV := {pv}, QU => {qu}, QD => {qd});"
        
        elif block_type == 'sr':
            set_in = block.find("field[@name='SET']").text
            reset_in = block.find("field[@name='RESET']").text
            out = block.find("field[@name='OUT']").text
            return f"{var}(SET := {set_in}, RESET := {reset_in}, OUT => {out});"
        
        else:
            raise ValueError(f"不支持的功能块类型: {block_type}")

    def _generate_final_st(self):
        """生成完整的ST程序"""
        # 变量声明部分
        var_declaration = "VAR\n"
        io_vars = {'I': [], 'Q': [], 'M': []}
        
        for var in sorted(self.variables):
            if var.startswith('%I'):
                io_vars['I'].append(var)
            elif var.startswith('%Q'):
                io_vars['Q'].append(var)
            else:
                io_vars['M'].append(var)
        
        for var_type, vars in io_vars.items():
            if vars:
                var_declaration += f"  // {var_type}区域\n"
                for var in vars:
                    var_declaration += f"  {var} : BOOL;\n"
        
        var_declaration += "END_VAR\n\n"
        
        # 添加交叉引用注释
        cross_ref = "// 变量使用位置:\n"
        for var, rungs in sorted(self.var_map.items()):
            cross_ref += f"// {var} : 梯级 {', '.join(map(str, rungs))}\n"
        
        return f"{var_declaration}{cross_ref}\n{self.st_code}"

# 使用示例
if __name__ == "__main__":
    try:
        converter = OpenPLC_XML_to_ST("openplc_project.xml")
        st_code = converter.parse_xml()
        
        with open("output.st", "w") as f:
            f.write(st_code)
        print("转换成功，结果已保存到output.st")
        
    except Exception as e:
        print(f"转换失败: {str(e)}")