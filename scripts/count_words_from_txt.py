
if __name__ == '__main__':
    # 读某个文件夹下的所有文件，统计其中的字数
    folder_path = "./words/"
    import os
    word_count = 0
    for file_name in os.listdir(folder_path):
        file_path = os.path.join(folder_path, file_name)
        with open(file_path, 'r') as f:
            for line in f:
                words = line.split()
                for word in words:
                    word_count += len(word)
    print("Total word count:", word_count)