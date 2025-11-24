import os

from  calculate_cpp_lines import calculate_plclogic

if __name__ == '__main__':
    base_folder = "../testcases/G4LTL-industrial/"
    # base_folder = "./testcases/auto_race/"
    total_lines = 0
    total_blank_lines = 0
    total_line_message = {}
    blank_line_message = {}
    cpp_line_message = {}
    cpp_blank_line_message = {}
    
    for root, dirs, files in os.walk(base_folder):
        for file in files:
            #  统计plc代码行数
            lines = sum(1 for line in open(os.path.join(root, file)))
            #  统计plc空白代码行数
            blank_lines = sum(1 for line in open(os.path.join(root, file)) if line.isspace())
            total_lines += lines
            total_blank_lines += blank_lines
            total_line_message[file] = lines
            blank_line_message[file] = blank_lines
            
            cpp_line_message[file] = calculate_plclogic()
    print("Total lines of code:", total_lines)
    
    for file, lines in total_line_message.items():
        print(f"{file}: {lines}")
    print("Total blank lines of code:", total_blank_lines)
    for file, blank_lines in blank_line_message.items():
        print(f"{file}: {blank_lines}")
        
    for file in total_line_message.keys():
        line = total_line_message[file]
        blank_line = blank_line_message[file]
        cpp_line = cpp_line_message[file]
        # cpp_blank_line = cpp_blank_line_message[file]
        print(f"{file}\t&\t{line}\t&\t{blank_line}\t&\t{cpp_line}\t\\\\")