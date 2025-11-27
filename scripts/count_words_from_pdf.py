import pdfplumber

import re
def count_pdf_words(pdf_path):
    total_chinese_chars = 0
    total_english_words = 0
    total_chars = 0
    with pdfplumber.open(pdf_path) as pdf:
        for page_num, page in enumerate(pdf.pages, 1):
            text = page.extract_text()
            if text:
                # 统计总字符数（包括空格、标点）
                total_chars += len(text)
                
                # 统计中文字符（Unicode中文范围）
                chinese_chars = re.findall(r'[\u4e00-\u9fff]', text)
                total_chinese_chars += len(chinese_chars)
                
                # 统计英文单词（按空格分割，过滤空字符串）
                # 先移除中文字符，避免干扰
                english_text = re.sub(r'[\u4e00-\u9fff]', ' ', text)
                english_words = [word for word in re.findall(r'\b[a-zA-Z]+\b', english_text) if len(word) > 0]
                total_english_words += len(english_words)
                
                print(f"第{page_num}页: 中文字符{len(chinese_chars)}个, 英文单词{len(english_words)}个")
    
    return total_chinese_chars, total_english_words, total_chars

if __name__ == "__main__":
    total_chinese_chars, total_english_words, total_chars = count_pdf_words("thuthesis_czm_master.pdf")
    print(f"总中文字符{total_chinese_chars}个, 总英文单词{total_english_words}个, 总字符数{total_chars}个，总字数{total_chinese_chars+total_english_words}个")