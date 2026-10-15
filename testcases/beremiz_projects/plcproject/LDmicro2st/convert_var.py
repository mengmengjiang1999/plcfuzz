
import re
import sys

def convert_var(input_file, output_file):
    """转换var"""
    with open(input_file, 'r') as f:
        content = f.readlines()
    
    in_program = False
    st_program = []
    
    for line in content:
        line = line.strip()
        if line == 'PROGRAM':
            in_program = True
            st_program.append('VAR')
            # 提取IO列表中的变量声明
            for io_line in content:
                if io_line.startswith('    Y') or io_line.startswith('    X'):
                    var = io_line.strip().split()[0]
                    st_program.append(f'    {var}  AT IX'+io_line.strip().split()[3]+'.'+io_line.strip().split()[4]+': BOOL;')
            st_program.append('END_VAR')
            continue
        
    # todo:需要检查代码是否有重复定义变量名的问题
    
    st_program.append('END_PROGRAM')
    
    with open(output_file, 'w') as f:
        f.write('\n'.join(st_program))
        
    return st_program
        

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print(f'Usage: {sys.argv[0]} input.ld output.st')
        sys.exit(1)
    convert_var(sys.argv[1], sys.argv[2])
    print(f'Successfully converted {sys.argv[1]} to {sys.argv[2]}')