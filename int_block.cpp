#include "int_block.h"

#include <iostream>  // 用于输出
#include <limits>    // 用于获取类型范围

IntBlock::IntBlock() {}

void IntBlock::print() {
    std::cout << "IntBlock::print():" << std::endl;
    std::cout << "Cycles: " << this->cycles << std::endl;
    for (int i = 0; i < BUFFER_SIZE; i++) {
        for (int j = 0; j < 8; j++) {
            std::cout << static_cast<unsigned int>(this->int_input[i][j]) << " ";
        }
    }
    std::cout << std::endl;
}

// 重载了operator
// 假设输入数据就是一个int类型的cycle+BUFFER_SIZE*8个unsigned char类型的数据
std::istream& operator>>(std::istream& is, IntBlock& sim) {
    std::cout << "operator>>(std::istream& is,IntBlock& sim)" << std::endl;
    printf("Inputs: \n");
    is >> sim.cycles;
    printf("Cycles: %d \n", sim.cycles);
    std::cout << "BUFFER_SIZE: " << BUFFER_SIZE << std::endl;
    std::cout << static_cast<unsigned int>(std::numeric_limits<unsigned char>::max()) << std::endl;
    for (int i = 0; i < BUFFER_SIZE * 8; i++) {
        unsigned int temp;
        is >> temp;
        std::cout << i << " " << temp << " ";
        if (temp <= static_cast<unsigned int>(std::numeric_limits<unsigned char>::max()))
            sim.int_input[i / 8][i % 8] = temp;
        else
            sim.int_input[i / 8][i % 8] = 0;
        printf("%d \n", sim.int_input[i / 8][i % 8]);
    }
    // 检查行尾是否有额外数据
    if (is.peek() == '\n') {
        is.ignore();  // 忽略换行符
    } else if (!is.eof()) {
        std::cerr << "警告：行尾有多余数据\n";
        is.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    }
    // 重要：返回值是is
    return is;
}
