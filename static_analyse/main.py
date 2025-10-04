import re

def extract_all_glue_variables(file_path):
    """
    从glueVars.cpp中提取所有绑定的变量（包括所有类型）
    返回格式: {
        'bool_inputs': [...],
        'bool_outputs': [...],
        'byte_inputs': [...],
        'byte_outputs': [...],
        'int_inputs': [...],
        'int_outputs': [...],
        'dint_inputs': [...],
        'dint_outputs': [...],
        'lint_inputs': [...],
        'lint_outputs': [...],
        'int_memory': [...],
        'dint_memory': [...],
        'lint_memory': [...]
    }
    """
    result = {
        'bool_inputs': [],
        'bool_outputs': [],
        'byte_inputs': [],
        'byte_outputs': [],
        'int_inputs': [],
        'int_outputs': [],
        'dint_inputs': [],
        'dint_outputs': [],
        'lint_inputs': [],
        'lint_outputs': [],
        'int_memory': [],
        'dint_memory': [],
        'lint_memory': []
    }

    with open(file_path, 'r') as f:
        content = f.read()
        
        # 提取glueVars()函数内的所有绑定语句
        gluevars_func = re.search(r'void glueVars\(\)\s*\{([^}]+)\}', content, re.DOTALL)
        if not gluevars_func:
            return result
            
        bindings = gluevars_func.group(1)
        
        # 定义所有可能的变量类型匹配模式
        patterns = {
            'bool_inputs': r'bool_input\[([^\]]+)\]\[([^\]]+)\] = \(IEC_BOOL \*\)([^;]+);',
            'bool_outputs': r'bool_output\[([^\]]+)\]\[([^\]]+)\] = \(IEC_BOOL \*\)([^;]+);',
            'byte_inputs': r'byte_input\[([^\]]+)\] = \(IEC_BYTE \*\)([^;]+);',
            'byte_outputs': r'byte_output\[([^\]]+)\] = \(IEC_BYTE \*\)([^;]+);',
            'int_inputs': r'int_input\[([^\]]+)\] = \(IEC_UINT \*\)([^;]+);',
            'int_outputs': r'int_output\[([^\]]+)\] = \(IEC_UINT \*\)([^;]+);',
            'dint_inputs': r'dint_input\[([^\]]+)\] = \(IEC_UDINT \*\)([^;]+);',
            'dint_outputs': r'dint_output\[([^\]]+)\] = \(IEC_UDINT \*\)([^;]+);',
            'lint_inputs': r'lint_input\[([^\]]+)\] = \(IEC_ULINT \*\)([^;]+);',
            'lint_outputs': r'lint_output\[([^\]]+)\] = \(IEC_ULINT \*\)([^;]+);',
            'int_memory': r'int_memory\[([^\]]+)\] = \(IEC_UINT \*\)([^;]+);',
            'dint_memory': r'dint_memory\[([^\]]+)\] = \(IEC_UDINT \*\)([^;]+);',
            'lint_memory': r'lint_memory\[([^\]]+)\] = \(IEC_ULINT \*\)([^;]+);'
        }
        
        # 遍历所有模式进行匹配
        for var_type, pattern in patterns.items():
            matches = re.finditer(pattern, bindings)
            for match in matches:
                if var_type in ['bool_inputs', 'bool_outputs']:
                    # 布尔型有额外的位索引
                    item = {
                        'array_index': match.group(1),
                        'bit_index': match.group(2),
                        'var_name': match.group(3).strip()
                    }
                else:
                    # 其他类型只有数组索引
                    item = {
                        'array_index': match.group(1),
                        'var_name': match.group(2).strip()
                    }
                result[var_type].append(item)
    
    return result

def print_variable_summary(variables):
    """打印提取的变量摘要"""
    print("=== 变量绑定汇总 ===")
    print(f"布尔输入量: {len(variables['bool_inputs'])}个")
    print(f"布尔输出量: {len(variables['bool_outputs'])}个")
    print(f"字节输入量: {len(variables['byte_inputs'])}个")
    print(f"字节输出量: {len(variables['byte_outputs'])}个")
    print(f"整型输入量: {len(variables['int_inputs'])}个")
    print(f"整型输出量: {len(variables['int_outputs'])}个")
    print(f"双字输入量: {len(variables['dint_inputs'])}个")
    print(f"双字输出量: {len(variables['dint_outputs'])}个")
    print(f"长整型输入量: {len(variables['lint_inputs'])}个")
    print(f"长整型输出量: {len(variables['lint_outputs'])}个")
    print(f"整型内存量: {len(variables['int_memory'])}个")
    print(f"双字内存量: {len(variables['dint_memory'])}个")
    print(f"长整型内存量: {len(variables['lint_memory'])}个")

def save_to_csv(variables, output_file):
    """将提取的变量保存到CSV文件"""
    import csv
    with open(output_file, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['变量类型', '数组索引', '位索引(仅布尔)', '变量名'])
        
        for var_type, var_list in variables.items():
            for var in var_list:
                if var_type in ['bool_inputs', 'bool_outputs']:
                    writer.writerow([var_type, var['array_index'], var['bit_index'], var['var_name']])
                else:
                    writer.writerow([var_type, var['array_index'], '', var['var_name']])

# 使用示例
if __name__ == "__main__":
    variables = extract_all_glue_variables("./src/glueVars.cpp")
    print_variable_summary(variables)
    
    # 保存到CSV以便后续分析
    save_to_csv(variables, "plc_variables_mapping.csv")
    
    # 打印详细变量信息（可选）
    print("\n=== 详细变量列表 ===")
    for var_type, var_list in variables.items():
        if var_list:  # 只打印有内容的类型
            print(f"\n{var_type.upper()}:")
            for var in var_list:
                if 'bit_index' in var:
                    print(f"  {var['var_name']} -> {var_type}[{var['array_index']}][{var['bit_index']}]")
                else:
                    print(f"  {var['var_name']} -> {var_type}[{var['array_index']}]")