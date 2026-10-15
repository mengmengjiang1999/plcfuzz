import xml.etree.ElementTree as ET
from xml.dom.minidom import parseString
import re

class ST_to_OpenPLC_XML:
    def __init__(self, st_file):
        self.st_file = st_file
        self.root = ET.Element("project")
        self._init_xml_structure()
        self.current_x = 100  # 当前绘图X坐标
        self.current_y = 50   # 当前绘图Y坐标
        self.block_width = 40 # 元件宽度
        self.rung_height = 100 # 梯级高度

    def _init_xml_structure(self):
        """初始化XML文档结构"""
        # 添加配置部分
        config = ET.SubElement(self.root, "configuration")
        ET.SubElement(config, "hardware").text = "simulated"
        ET.SubElement(config, "scan_cycle").text = "100"

        # 添加主程序组织单元
        pous = ET.SubElement(self.root, "pous")
        pou = ET.SubElement(pous, "pou", name="MAIN", pouType="program")
        self.ladder = ET.SubElement(pou, "ladder")

    def parse_st(self):
        """解析ST代码并生成梯形图"""
        with open(self.st_file, 'r') as f:
            st_code = f.read()

        # 预处理：移除注释和空行
        st_code = re.sub(r'//.*?\n', '', st_code)
        st_code = re.sub(r'/\*.*?\*/', '', st_code, flags=re.DOTALL)
        st_code = '\n'.join(line for line in st_code.split('\n') if line.strip())

        # 提取变量声明
        var_decl = re.search(r'VAR\s*(.*?)\s*END_VAR', st_code, re.DOTALL)
        if var_decl:
            self._process_variables(var_decl.group(1))

        # 处理程序主体
        body = re.search(r'BEGIN\s*(.*?)\s*END_PROGRAM', st_code, re.DOTALL)
        if not body:
            raise ValueError("未找到有效的ST程序主体")

        # 分割梯级（以IF语句为界）
        rungs = re.split(r'(?<=END_IF;)', body.group(1), flags=re.IGNORECASE)
        
        for rung in rungs:
            if not rung.strip():
                continue
            self._process_rung(rung.strip())
            self.current_y += self.rung_height  # 下移一个梯级位置

        return self._generate_xml()

    def _process_variables(self, var_text):
        """处理变量声明部分"""
        # 示例实现：实际项目中可以建立变量类型映射
        pass

    def _process_rung(self, rung_text):
        """处理单个梯级"""
        # 检测IF-THEN结构
        if_match = re.match(r'IF\s+(.*?)\s+THEN\s*(.*?)\s*END_IF;', rung_text, re.DOTALL | re.IGNORECASE)
        if not if_match:
            # 处理无条件梯级（直接赋值）
            self._process_assignments(rung_text)
            return

        conditions = if_match.group(1)
        statements = if_match.group(2)

        # 处理条件部分（左侧电源轨）
        self._process_conditions(conditions)
        
        # 处理执行部分（右侧线圈）
        self._process_assignments(statements)

    def _process_conditions(self, condition_text):
        """解析条件表达式并生成触点"""
        # 分割AND连接的多个条件
        and_conditions = re.split(r'\s+AND\s+', condition_text, flags=re.IGNORECASE)
        
        x_pos = self.current_x
        for cond in and_conditions:
            # 处理NOT条件（常闭触点）
            is_normal = not cond.startswith('NOT ')
            var_name = cond[4:].strip() if not is_normal else cond.strip()
            
            # 添加触点元素
            contact = ET.SubElement(self.ladder, "block", 
                                  type="contact",
                                  x=str(x_pos),
                                  y=str(self.current_y),
                                  width=str(self.block_width),
                                  height=str(self.block_width))
            
            ET.SubElement(contact, "field", name="VAR").text = var_name
            ET.SubElement(contact, "field", name="EDGE").text = "0" if is_normal else "1"
            
            # 添加连接线（除第一个触点外）
            if x_pos != self.current_x:
                ET.SubElement(self.ladder, "line",
                             x1=str(x_pos - 20),
                             y1=str(self.current_y + self.block_width//2),
                             x2=str(x_pos),
                             y2=str(self.current_y + self.block_width//2))
            
            x_pos += self.block_width + 20

    def _process_assignments(self, assignment_text):
        """解析赋值语句并生成线圈"""
        assignments = re.findall(r'(\w+)\s*:=\s*(TRUE|FALSE|[\w\.]+)\s*;', assignment_text, re.IGNORECASE)
        
        x_pos = self.current_x + 200  # 右侧线圈区域
        for var, value in assignments:
            # 处理功能块调用（如定时器）
            if '(' in value:
                self._process_function_block(var, value, x_pos)
                x_pos += 150
                continue
                
            # 添加线圈元素
            coil = ET.SubElement(self.ladder, "block",
                               type="coil",
                               x=str(x_pos),
                               y=str(self.current_y),
                               width=str(self.block_width),
                               height=str(self.block_width))
                               
            ET.SubElement(coil, "field", name="VAR").text = var
            if value.upper() == 'FALSE':
                ET.SubElement(coil, "field", name="NEGATED").text = "1"
            
            # 添加连接线
            ET.SubElement(self.ladder, "line",
                         x1=str(x_pos - 50),
                         y1=str(self.current_y + self.block_width//2),
                         x2=str(x_pos),
                         y2=str(self.current_y + self.block_width//2))
            
            x_pos += self.block_width + 30

    def _process_function_block(self, var, fb_call, x_pos):
        """处理功能块调用（如TON定时器）"""
        # 解析功能块类型和参数
        fb_type = re.match(r'(\w+)\(', fb_call).group(1).lower()
        params = re.findall(r'(\w+)\s*:=\s*([^,)]+)', fb_call)
        
        # 添加功能块元素
        fb = ET.SubElement(self.ladder, "block",
                          type=fb_type,
                          x=str(x_pos),
                          y=str(self.current_y),
                          width=str(self.block_width * 2),
                          height=str(self.block_width * 2))
        
        ET.SubElement(fb, "field", name="VAR").text = var
        for param, arg in params:
            ET.SubElement(fb, "field", name=param.upper()).text = arg
    
    def _parse_expression(self, expr):
        """处理OR等复杂逻辑"""
        if ' OR ' in expr:
            # 创建并联分支
            self._create_parallel_branches(expr)
            
    def _infer_var_type(self, var_name):
        """根据命名规则推断变量类型"""
        if var_name.startswith('Input_'):
            return '%IX0.' + var_name.split('_')[1]
        
    # def _auto_layout(self):
    #     """基于图论的自动布局优化"""
    #     # 使用networkX计算节点位置
    #     import networkx as nx
    #     G = nx.Graph()
    #     # 添加元件连接关系...
    #     pos = nx.spring_layout(G)

    def _generate_xml(self):
        """生成格式化的XML输出"""
        rough_xml = ET.tostring(self.root, 'utf-8')
        dom = parseString(rough_xml)
        return dom.toprettyxml(indent="  ")

# 使用示例
if __name__ == "__main__":
    try:
        converter = ST_to_OpenPLC_XML("plc_program.st")
        xml_content = converter.parse_st()
        
        with open("openplc_project.xml", "w") as f:
            f.write(xml_content)
        print("转换成功，结果已保存到openplc_project.xml")
        
    except Exception as e:
        print(f"转换失败: {str(e)}")