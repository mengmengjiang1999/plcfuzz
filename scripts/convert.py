import re

def convert_plc_code(input_file, output_file):
    # 读取原始文件内容
    with open(input_file, 'r') as f:
        content = f.read()
    
    # 1. 添加LOGLEVEL类型定义
    new_content = "TYPE\n  LOGLEVEL : (CRITICAL, WARNING, INFO, DEBUG) := INFO;\nEND_TYPE\n\n"
    
    # 2. 将FUNCTION_BLOCK改为PROGRAM，同时将END_FUNCTION_BLOCK改为END_PROGRAM
    new_content += content.replace("FUNCTION_BLOCK FB_G4LTL", "PROGRAM program0").replace("END_FUNCTION_BLOCK", "END_PROGRAM")
    
    # 3. 添加CONFIGURATION部分
    # 提取输入输出变量
    input_vars = re.findall(r'VAR_INPUT([\s\S]*?)END_VAR', new_content)[0]
    output_vars = re.findall(r'VAR_OUTPUT([\s\S]*?)END_VAR', new_content)[0]
    
    # 解析输入变量
    input_lines = [line.strip() for line in input_vars.split('\n') if line.strip()]
    input_declarations = []
    for i, line in enumerate(input_lines):
        var_name = line.split(':')[0].strip()
        input_declarations.append(f"    {var_name} AT %IX0.{i} : BOOL;")
    
    # 解析输出变量
    output_lines = [line.strip() for line in output_vars.split('\n') if line.strip()]
    output_declarations = []
    for i, line in enumerate(output_lines):
        var_name = line.split(':')[0].strip()
        output_declarations.append(f"    {var_name} AT %QX0.{i} : BOOL;")
    
    # 构建CONFIGURATION部分
    configuration = """\nCONFIGURATION Config0
  VAR_GLOBAL
"""
    configuration += "\n".join(input_declarations) + "\n"
    configuration += "\n".join(output_declarations) + "\n"
    configuration += """  END_VAR
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION"""
    
    new_content += configuration
    
    # 写入输出文件
    with open(output_file, 'w') as f:
        f.write(new_content)

# 使用示例
convert_plc_code("original_plc_code2.st", "converted_plc_code2.st")