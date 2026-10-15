#!/usr/bin/env python3
"""
LDmicro to Structured Text (ST) Converter
Author: PLC Security Researcher
Usage: python ldmicro_to_st.py input.ld output.st
"""

import re
import sys

from convert_var import convert_var

# 定义转换规则
CONVERSION_RULES = {
    # 触点指令
    'CONTACTS (\\w+) (\\d+) (\\d+)': {
        'type': 'contact',
        'normal': lambda m: f'{m.group(1)}',  # 常开触点 -> 直接引用
        'inverted': lambda m: f'NOT {m.group(1)}'  # 常闭触点 -> NOT
    },
    # 线圈指令
    'COIL (\\w+) (\\d+) (\\d+) (\\d+) (\\d+)': {
        'type': 'coil',
        'output': lambda m: f'{m.group(1)} := TRUE;',
        'reset': lambda m: f'{m.group(1)} := FALSE;'
    },
    # 定时器/计数器
    'CTC (\\w+) (\\d+) (\\d+) /': {
        'type': 'counter',
        'code': lambda m: f'{m.group(1)} := {m.group(1)} + 1;'
                         f'\nIF {m.group(1)} >= {m.group(2)} THEN '
                         f'{m.group(1)} := 0; END_IF;'
    },
    # 比较指令
    'EQU (\\w+) (\\d+)': {
        'type': 'compare',
        'code': lambda m: f'{m.group(1)} = {m.group(2)}'
    },
    'NEQ (\\w+) (\\d+)': {
        'type': 'compare',
        'code': lambda m: f'{m.group(1)} <> {m.group(2)}'
    },
    # 移动指令
    'MOVE (\\w+) (\\w+)': {
        'type': 'move',
        'code': lambda m: f'{m.group(1)} := {m.group(2)};'
    }
}

def convert_rung(rung_lines):
    """转换单个梯级"""
    st_code = []
    series_stack = []  # 用于处理串联逻辑
    parallel_groups = []  # 用于处理并联逻辑
    
    for line in rung_lines:
        line = line.strip()
        if line == 'SERIES':
            series_stack.append([])
        elif line == 'END':
            if series_stack:
                # 处理串联结束
                series_ops = series_stack.pop()
                if series_ops:
                    if len(series_ops) > 1:
                        st_code.append(f'IF {" AND ".join(series_ops)} THEN')
                    else:
                        st_code.append(f'IF {series_ops[0]} THEN')
        elif line == 'PARALLEL':
            parallel_groups.append([])
        elif line == 'END':
            if parallel_groups:
                # 处理并联结束
                parallel_ops = parallel_groups.pop()
                if parallel_ops:
                    st_code.append(f'IF {" OR ".join(parallel_ops)} THEN')
        else:
            # 匹配指令
            matched = False
            for pattern, rule in CONVERSION_RULES.items():
                match = re.match(pattern, line)
                if match:
                    matched = True
                    if rule['type'] == 'contact':
                        inverted = int(match.group(3))
                        contact = rule['inverted'](match) if inverted else rule['normal'](match)
                        if series_stack:
                            series_stack[-1].append(contact)
                        else:
                            st_code.append(f'IF {contact} THEN')
                    elif rule['type'] == 'coil':
                        if series_stack or parallel_groups:
                            st_code.append(rule['output'](match))
                        else:
                            st_code.append(rule['output'](match))
                    else:
                        st_code.append(rule['code'](match))
                    break
            
            if not matched and line not in ('', 'PLACEHOLDER'):
                st_code.append(f'// Unsupported instruction: {line}')
    
    return '\n'.join(st_code)

def convert_file(input_file, output_file):
    """转换整个文件"""
    with open(input_file, 'r') as f:
        content = f.readlines()
    
    in_program = False
    current_rung = []
    st_program = []
    
    for line in content:
        line = line.strip()
        if line == 'PROGRAM':
            in_program = True
            st_program.append('PROGRAM MAIN_VAR')
            st_program.append(convert_var(input_file, output_file)) # 转换变量
            st_program.append('BEGIN')
            continue
        if in_program:
            if line.startswith('RUNG'):
                if current_rung:
                    st_program.append(convert_rung(current_rung))
                    st_program.append('END_IF;')
                    current_rung = []
            else:
                current_rung.append(line)
    
    if current_rung:
        st_program.append(convert_rung(current_rung))
        st_program.append('END_IF;')
    
    st_program.append('END_PROGRAM')
    
    with open(output_file, 'w') as f:
        f.write('\n'.join(st_program))

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print(f'Usage: {sys.argv[0]} input.ld output.st')
        sys.exit(1)
    
    convert_file(sys.argv[1], sys.argv[2])
    print(f'Successfully converted {sys.argv[1]} to {sys.argv[2]}')