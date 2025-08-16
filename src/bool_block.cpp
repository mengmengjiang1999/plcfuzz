// #include "bool_block.h"

// #include <iostream>  // 用于输出
// #include <limits>    // 用于获取类型范围

// void BoolBlock::print() {
//     std::cout << "BoolBlock::print():" << std::endl;
//     std::cout << "Cycles: " << this->cycles << std::endl;
//     for (int i = 0; i < BUFFER_SIZE; i++) {
//         for (int j = 0; j < 8; j++) {
//             std::cout << static_cast<unsigned int>(this->bool_input[i][j]) << " ";
//         }
//     }
//     std::cout << std::endl;
// }

// // 重载了operator
// // 假设输入数据就是一个int类型的cycle+BUFFER_SIZE*8个unsigned char类型的数据
// std::istream& operator>>(std::istream& is, BoolBlock& sim) {
//     std::cout << "operator>>(std::istream& is,BoolBlock& sim)" << std::endl;
//     printf("Inputs: \n");
//     is >> sim.cycles;
//     printf("Cycles: %d \n", sim.cycles);
//     std::cout << "BUFFER_SIZE: " << BUFFER_SIZE << std::endl;
//     for (int i = 0; i < BUFFER_SIZE * 8; i++) {
//         uint16_t temp;
//         is >> temp;
//         // std::cout << i << " " << temp << " ";
//         if (temp <= static_cast<uint16_t>(std::numeric_limits<uint16_t>::max()))
//             sim.bool_input[i / 8][i % 8] = temp;
//         else
//             sim.bool_input[i / 8][i % 8] = 0;
//     }
//     // 检查行尾是否有额外数据
//     if (is.peek() == '\n') {
//         is.ignore();  // 忽略换行符
//     }
//     // else if (!is.eof()) {
//     //     std::cerr << "警告：行尾有多余数据 boolblock\n";
//     //     is.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
//     // }
//     std::cout << "operator>>(std::istream& is,BoolBlock& sim) end" << std::endl;
//     return is;
// }
