import re
from collections import defaultdict
import argparse

class LDmicroToSTConverter:
    def __init__(self):
        self.config = {}
        self.io_list = []
        self.rungs = []
        self.variables = defaultdict(list)
        self.errors = []
        self.st_code = []
        self.io_map = {}
        
    def parse_and_convert(self, input_file, output_file):
        # 解析LDmicro文件
        self.parse_file(input_file)
        
        # 转换为ST代码
        st_content = self._convert_to_st()
        
        # 写入ST文件
        with open(output_file, 'w') as f:
            f.write(st_content)
        
        print(f"成功将 {input_file} 转换为 {output_file}")
    
    def parse_file(self, file_path):
        with open(file_path, 'r') as f:
            content = f.read()
        
        # 分割文件为不同部分
        sections = re.split(r'\n\s*\n', content.strip())
        
        for section in sections:
            if section.startswith('LDmicro'):
                self._parse_header(section)
            elif section.startswith('IO LIST'):
                self._parse_io_list(section)
            elif section.startswith('PROGRAM'):
                self._parse_program(section)
        
        return self._generate_report()
    
    def _parse_header(self, section):
        lines = section.split('\n')
        for line in lines[1:]:  # 跳过第一行"LDmicro..."
            if '=' in line:
                key, value = line.split('=', 1)
                self.config[key.strip()] = value.strip()
    
    def _parse_io_list(self, section):
        lines = section.split('\n')[1:]  # 跳过"IO LIST"
        for line in lines:
            if line.strip() == 'END':
                continue
            # 解析类似 "Ycom_digit0 at 0 0 0" 的IO定义
            match = re.match(r'^\s*(\w+)\s+at\s+(\d+)\s+(\d+)\s+(\d+)', line)
            if match:
                io_name = match.group(1)
                self.io_list.append({
                    'name': io_name,
                    'type': 'Y' if io_name.startswith('Y') else 'X',
                    'address': [int(match.group(2)), int(match.group(3)), int(match.group(4))]
                })
                # 添加到IO映射表
                self.io_map[io_name] = f"%{io_name[0]}{match.group(2)}.{match.group(3)}.{match.group(4)}"
    
    def _parse_program(self, section):
        lines = section.split('\n')[1:]  # 跳过"PROGRAM"
        current_rung = []
        in_rung = False
        
        for line in lines:
            line = line.strip()
            if not line:
                continue
                
            if line.startswith('RUNG'):
                if current_rung:
                    self.rungs.append(current_rung)
                    current_rung = []
                in_rung = True
            elif line == 'END':
                if in_rung:
                    self.rungs.append(current_rung)
                    current_rung = []
                    in_rung = False
            elif in_rung:
                parsed = self._parse_instruction(line)
                if parsed:
                    current_rung.append(parsed)
                    # 记录变量使用情况
                    if 'target' in parsed:
                        self.variables[parsed['target']].append(parsed['type'])
    
    def _parse_instruction(self, line):
        # 解析各种指令
        patterns = [
            (r'^CONTACTS\s+(\w+)\s+(\d+)\s+(\d+)$', 'contact'),
            (r'^COIL\s+(\w+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)$', 'coil'),
            (r'^CTC\s+(\w+)\s+(\d+)\s+(\d+)\s*(\S*)$', 'counter'),
            (r'^MOVE\s+(\w+)\s+(\w+)$', 'move'),
            (r'^EQU\s+(\w+)\s+(\d+)$', 'compare_eq'),
            (r'^NEQ\s+(\w+)\s+(\d+)$', 'compare_neq'),
            (r'^PARALLEL$', 'parallel_start'),
            (r'^SERIES$', 'series_start'),
            (r'^PLACEHOLDER$', 'placeholder'),
            (r'^COMMENT\s+--(.+)--$', 'comment'),  # 新增COMMENT指令
            (r'^MASTER_RELAY$', 'master_relay'),  # 新增MASTER_RELAY指令
            (r'^ADD\s+(\w+)\s+(\w+)\s+(\d+)$', 'add')  # 新增ADD指令
        ]
        
        for pattern, instr_type in patterns:
            match = re.match(pattern, line)
            if match:
                result = {'type': instr_type, 'raw': line}
                if instr_type in ['contact', 'coil', 'move']:
                    result['target'] = match.group(1)
                elif instr_type == 'counter':
                    result['target'] = match.group(1)
                    result['max'] = match.group(2)
                    result['current'] = match.group(3)
                    result['reset'] = match.group(4) if match.group(4) else None
                elif instr_type in ['compare_eq', 'compare_neq']:
                    result['target'] = match.group(1)
                    result['value'] = match.group(2)
                elif instr_type == 'comment':
                    result['text'] = match.group(1)
                elif instr_type == 'add':
                    result['dest'] = match.group(1)
                    result['src'] = match.group(2)
                    result['value'] = match.group(3)
                    self.variables[result['dest']].append('var')
                    self.variables[result['src']].append('var')
                elif instr_type == 'master_relay':
                    pass  # 不需要额外处理
                return result
        
        self.errors.append(f"无法解析的指令: {line}")
        return None
    
    def _generate_report(self):
        report = {
            'config': self.config,
            'io_list': self.io_list,
            'rung_count': len(self.rungs),
            'variables': dict(self.variables),
            'errors': self.errors
        }
        
        # 添加详细梯级分析
        report['rungs'] = []
        for i, rung in enumerate(self.rungs):
            rung_report = {
                'number': i+1,
                'instruction_count': len(rung),
                'instructions': rung
            }
            report['rungs'].append(rung_report)
        
        return report
    
    def _convert_to_st(self):
        """将解析后的LDmicro代码转换为ST语言"""
        st_lines = []
        
        # 添加程序声明
        st_lines.append("PROGRAM PLC_PRG")
        st_lines.append("VAR")
        
        # 添加IO变量声明
        for io in self.io_list:
            st_lines.append(f"  {io['name']} AT {self.io_map[io['name']]} : BOOL;")
        
        # 添加其他变量声明
        for var, uses in self.variables.items():
            if var not in self.io_map:
                # 根据使用情况推断类型
                if any('counter' in use for use in uses):
                    st_lines.append(f"  {var} : INT;")
                elif any('var' in use for use in uses):
                    st_lines.append(f"  {var} : INT;")  # 假设ADD操作使用整数
                else:
                    st_lines.append(f"  {var} : WORD;")
        
        st_lines.append("END_VAR")
        st_lines.append("")
        
        # 添加配置信息作为注释
        st_lines.append("(* Configuration *)")
        for key, value in self.config.items():
            st_lines.append(f"(* {key} = {value} *)")
        st_lines.append("")
        
        # 转换每个梯级
        for rung in self.rungs:
            st_lines.extend(self._convert_rung(rung))
        
        return "\n".join(st_lines)
    
    def _convert_rung(self, rung):
        """转换单个梯级为ST代码"""
        st_lines = []
        conditions = []
        actions = []
        
        for instr in rung:
            converted = self._convert_instruction(instr)
            if converted['condition']:
                conditions.append(converted['condition'])
            if converted['action']:
                actions.append(converted['action'])
            if converted['comment']:
                st_lines.append(f"(* {converted['comment']} *)")
        
        # 生成条件判断
        if conditions:
            condition_str = " AND ".join(conditions)
            st_lines.append(f"IF {condition_str} THEN")
        else:
            st_lines.append("IF TRUE THEN")
        
        # 添加动作
        for action in actions:
            st_lines.append(f"  {action}")
        
        st_lines.append("END_IF;")
        st_lines.append("")  # 空行分隔梯级
        
        return st_lines
    
    def _convert_instruction(self, instr):
        """转换单个指令"""
        condition = ""
        action = ""
        comment = ""
        
        if instr['type'] == 'contact':
            var = self.io_map.get(instr['target'], instr['target'])
            condition = var
        elif instr['type'] == 'coil':
            var = self.io_map.get(instr['target'], instr['target'])
            action = f"{var} := TRUE;"
        elif instr['type'] == 'move':
            src = instr['raw'].split()[2]
            dest = instr['target']
            action = f"{dest} := {src};"
        elif instr['type'] == 'counter':
            var = instr['target']
            max_val = instr['max']
            reset = instr['reset']
            
            action = f"IF {var} >= {max_val} THEN\n"
            action += f"  {var} := 0;\n"
            if reset:
                action += f"ELSIF {reset} THEN\n"
                action += f"  {var} := 0;\n"
            action += "ELSE\n"
            action += f"  {var} := {var} + 1;\n"
            action += "END_IF;"
        elif instr['type'] == 'compare_eq':
            var = instr['target']
            value = instr['value']
            condition = f"({var} = {value})"
        elif instr['type'] == 'compare_neq':
            var = instr['target']
            value = instr['value']
            condition = f"({var} <> {value})"
        elif instr['type'] == 'comment':
            comment = instr['text']
        elif instr['type'] == 'master_relay':
            action = "(* MASTER_RELAY executed *)"
        elif instr['type'] == 'add':
            dest = instr['dest']
            src = instr['src']
            value = instr['value']
            action = f"{dest} := {src} + {value};"
        
        return {'condition': condition, 'action': action, 'comment': comment}

if __name__ == "__main__":
    converter = LDmicroToSTConverter()
    
    parser = argparse.ArgumentParser(description='LDmicro到ST语言转换器')
    parser.add_argument('input_file', help='输入的LDmicro文件')
    parser.add_argument('output_file', help='输出的ST文件')
    
    args = parser.parse_args()
    
    # 执行转换
    converter.parse_and_convert(args.input_file, args.output_file)
    
    # 打印解析报告（可选）
    report = converter.parse_file(args.input_file)
    
    print("\n=== 解析报告 ===")
    print(f"共解析 {report['rung_count']} 个梯级")
    print(f"发现 {len(report['errors'])} 个错误")
    
    if report['errors']:
        print("\n=== 错误列表 ===")
        for error in report['errors']:
            print(error)