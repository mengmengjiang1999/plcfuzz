import os


if __name__ == '__main__':
    base_folder = "../testcases/G4LTL-industrial/"
    # base_folder = "../testcases/auto_race/"
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
            
            # 统计c++代码行数
            # 先编译
            os.system(f"../tools/iec2c -T ./plclogic $1 {os.path.join(root, file)}")
            # 
            cpp_base_folder = "../plclogic/"
            # 统计cpp_base_folder下的所有C++代码
            cpp_lines = 0
            cpp_blank_lines = 0
            for root_cpp, dirs_cpp, files_cpp in os.walk(cpp_base_folder):
                for file_cpp in files_cpp:
                    if file_cpp.endswith(".c") or file_cpp.endswith(".h"):
                        cpp_lines += sum(1 for line in open(os.path.join(root_cpp, file_cpp)))
                        cpp_blank_lines += sum(1 for line in open(os.path.join(root_cpp, file_cpp)) if line.isspace())
            cpp_line_message[file] = cpp_lines
            cpp_blank_line_message[file] = cpp_blank_lines
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
        cpp_blank_line = cpp_blank_line_message[file]
        print(f"{file}\t&\t{line}\t&\t{blank_line}\t&\t{cpp_line}\t&\t{cpp_blank_line}\t\\\\")