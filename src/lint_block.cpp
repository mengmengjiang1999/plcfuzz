// #include "lint_block.h"

// #include <iostream>  // 用于输出
// #include <limits>    // 用于获取类型范围

// void LIntBlock::print() {
//     std::cout << "LintBlock::print():" << std::endl;
//     std::cout << "Cycles: " << this->cycles << std::endl;
//     for (int i = 0; i < BUFFER_SIZE; i++) {
//         std::cout << static_cast<unsigned int>(this->lint_input[i]) << " ";
//     }
//     std::cout << std::endl;
// }

// // 重载了operator
// // 假设输入数据就是一个int类型的cycle+BUFFER_SIZE*8个unsigned char类型的数据
// std::istream& operator>>(std::istream& is, LIntBlock& sim) {
//     std::cout << "operator>>(std::istream& is,LIntBlock& sim)" << std::endl;
//     printf("Inputs: \n");
//     is >> sim.cycles;
//     printf("Cycles: %d \n", sim.cycles);
//     std::cout << "BUFFER_SIZE: " << BUFFER_SIZE << std::endl;
//     for (int i = 0; i < BUFFER_SIZE; i++) {
//         int64_t temp;
//         is >> temp;
//         std::cout << i << " " << temp << " ";
//         if (temp <= static_cast<int64_t>(std::numeric_limits<int64_t>::max()))
//             sim.lint_input[i] = temp;
//         else
//             sim.lint_input[i] = 0;
//         printf("%d \n", sim.lint_input[i]);
//     }
//     // 检查行尾是否有额外数据
//     if (is.peek() == '\n') {
//         is.ignore();  // 忽略换行符
//     }
//     std::cout << "operator>>(std::istream& is,LIntBlock& sim) end" << std::endl;
//     return is;
// }
