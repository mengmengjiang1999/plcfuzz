import re
from collections import defaultdict

class LDMicroParser:
    def __init__(self):
        self.config = {}
        self.io_list = []
        self.rungs = []
        self.variables = defaultdict(list)
        self.errors = []
        
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
    
    def _parse_program(self, section):
        lines = section.split('\n')[1:]  # 跳过"PROGRAM"
        current_rung = []
        in_rung = False
        
        for line in lines:
            if line.strip().startswith('RUNG'):
                if current_rung:
                    self.rungs.append(current_rung)
                    current_rung = []
                in_rung = True
            elif line.strip() == 'END':
                if in_rung:
                    self.rungs.append(current_rung)
                    current_rung = []
                    in_rung = False
            elif in_rung and line.strip():
                parsed = self._parse_instruction(line.strip())
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
            (r'^CTC\s+(\w+)\s+(\d+)\s+(\d+)\s+(\w*)$', 'counter'),  # 修改后的CTC模式
            (r'^MOVE\s+(\w+)\s+(\w+)$', 'move'),
            (r'^EQU\s+(\w+)\s+(\d+)$', 'compare'),
            (r'^NEQ\s+(\w+)\s+(\d+)$', 'compare'),
            (r'^PARALLEL$', 'parallel_start'),
            (r'^SERIES$', 'series_start'),
            (r'^PLACEHOLDER$', 'placeholder')
        ]
        
        for pattern, instr_type in patterns:
            match = re.match(pattern, line)
            # if match:
            #     result = {'type': instr_type, 'raw': line}
            #     if instr_type in ['contact', 'coil', 'counter', 'move', 'compare']:
            #         result['target'] = match.group(1)
            #     return result
            
            if match:
                result = {'type': instr_type, 'raw': line}
                if instr_type == 'counter':
                    result['target'] = match.group(1)
                    result['max'] = match.group(2)
                    result['current'] = match.group(3)
                    result['reset'] = match.group(4) if match.group(4) else None
                    self.variables.add(match.group(1))
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

# 使用示例
if __name__ == "__main__":
    parser = LDMicroParser()
    # 假设LDmicro代码保存在test.ld文件中
    report = parser.parse_file('7seg-display.ld')
    
    # 打印解析结果
    print("=== 配置信息 ===")
    for key, value in report['config'].items():
        print(f"{key}: {value}")
    
    print("\n=== IO列表 ===")
    for io in report['io_list']:
        print(f"{io['name']} ({io['type']}): {io['address']}")
    
    print(f"\n=== 共找到 {report['rung_count']} 个梯级 ===")
    for rung in report['rungs']:
        print(f"\n梯级 {rung['number']} (包含 {rung['instruction_count']} 条指令):")
        for instr in rung['instructions']:
            print(f"  - {instr['raw']}")
    
    print("\n=== 变量使用情况 ===")
    for var, uses in report['variables'].items():
        print(f"{var}: {', '.join(uses)}")
    
    if report['errors']:
        print("\n=== 解析错误 ===")
        for error in report['errors']:
            print(f"错误: {error}")