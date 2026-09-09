#pragma once

#include <array>
#include <iostream>
#include <string>
#include <typeinfo>

#include "ladder.h"

template <typename T, int Dim = 1>
class BasicInputBlock {
   public:
    int cycles = 0;
    std::array<T, PLC_INPUT_SIZE> input{};
    friend std::istream& operator>>(std::istream& is, BasicInputBlock<T, Dim>& obj) {
        is >> obj.cycles;

        for (int i = 0; i < PLC_INPUT_SIZE; i++) {
            uint64_t tmp;
            is >> tmp;
            obj.input[i] = static_cast<T>(tmp);
        }
        return is;
    }
    void print() const {
        std::cout << "BasicInputBlock<" << typeid(T).name() << ", " << Dim << ">" << std::endl;
        std::cout << "cycles: " << cycles << std::endl;
        for (int i = 0; i < PLC_INPUT_SIZE; i++) {
            std::cout << input[i] << " ";
        }
        std::cout << std::endl;
    }
    std::string serialize_data() const {
        std::string buffer = std::to_string(this->cycles);
        for (int i = 0; i < PLC_INPUT_SIZE; i++) {
            buffer += " " + std::to_string(this->input[i]);
        }
        return buffer;
    }

    size_t size() const {
        return sizeof(cycles) +          // int类型的大小
               sizeof(T) * PLC_INPUT_SIZE;  // 一维数组的大小
    }
};

template <typename T>
class BasicInputBlock<T, 2> {
   public:
    int cycles = 0;
    std::array<std::array<T, 8>, PLC_INPUT_SIZE> input{};
    friend std::istream& operator>>(std::istream& is, BasicInputBlock<T, 2>& obj) {
        is >> obj.cycles;
        // std::cout << "cycles=" << obj.cycles << std::endl;
        for (int i = 0; i < PLC_INPUT_SIZE; i++) {
            for (int j = 0; j < 8; j++) {
                uint64_t tmp;
                is >> tmp;
                // std::cout << "i=" << i << " j=" << j << " tmp=" << tmp << std::endl;
                obj.input[i][j] = static_cast<T>(tmp);
                // std::cout << "i=" << i << " j=" << j << " input=" << obj.input[i][j] << std::endl;
            }
        }
        return is;
    }
    void print() const {
        std::cout << "BasicInputBlock<" << typeid(T).name() << ">" << std::endl;
        std::cout << "cycles: " << cycles << std::endl;
        for (int i = 0; i < PLC_INPUT_SIZE; i++) {
            for (int j = 0; j < 8; j++) {
                std::cout << static_cast<uint64_t>(input[i][j]) << " ";
            }
            std::cout << std::endl;
        }
        std::cout << std::endl;
    }

    std::string serialize_data() const {
        std::string buffer = std::to_string(this->cycles);
        for (int i = 0; i < PLC_INPUT_SIZE; i++) {
            for (int j = 0; j < 8; j++) {
                buffer += " " + std::to_string(static_cast<uint64_t>(this->input[i][j]));
            }
        }
        return buffer;
    }
    size_t size() const {
        return sizeof(cycles) +              // int类型的大小
               sizeof(T) * PLC_INPUT_SIZE * 8;  // 二维数组的大小
    }
};

class BoolBlock : public BasicInputBlock<unsigned char, 2> {};

class ByteBlock : public BasicInputBlock<IEC_BYTE, 1> {};

class IntBlock : public BasicInputBlock<IEC_UINT, 1> {};

class DIntBlock : public BasicInputBlock<IEC_UDINT, 1> {};

class LIntBlock : public BasicInputBlock<IEC_ULINT, 1> {};

class IntMemoryBlock : public BasicInputBlock<IEC_UINT, 1> {};

class DIntMemoryBlock : public BasicInputBlock<IEC_UDINT, 1> {};
