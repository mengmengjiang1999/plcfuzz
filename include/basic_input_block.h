#pragma once

#include <iostream>

#include "ladder.h"

class SuperBasicInputBlock {};

template <typename T, int Dim = 1>
class BasicInputBlock : public SuperBasicInputBlock {
   public:
    int cycles;
    T input[BUFFER_SIZE];
    BasicInputBlock() {
        cycles = 0;
        for (int i = 0; i < BUFFER_SIZE; i++) {
            input[i] = 0;
        }
    }
    friend std::istream& operator>>(std::istream& is, BasicInputBlock<T, Dim>& obj) {
        is >> obj.cycles;
        // std::cout << "cycles=" << obj.cycles << std::endl;
        for (int i = 0; i < BUFFER_SIZE; i++) {
            uint64_t tmp;
            is >> tmp;
            obj.input[i] = (T)tmp;
            // std::cout << "i=" << i << " tmp=" << tmp << std::endl;
            // std::cout << "i=" << i << " input=" << obj.input[i] << std::endl;
        }
        return is;
    }
    virtual void print() {
        std::cout << "BasicInputBlock<" << typeid(T).name() << ", " << Dim << ">" << std::endl;
        std::cout << "cycles: " << cycles << std::endl;
        for (int i = 0; i < BUFFER_SIZE; i++) {
            std::cout << input[i] << " ";
        }
        std::cout << std::endl;
    };
    virtual std::string serialize_data() const {
        std::string buffer;
        buffer += std::to_string(this->cycles);
        for (int i = 0; i < BUFFER_SIZE; i++) {
            buffer += std::to_string(this->input[i]);
        }
        return buffer;
    }

    size_t size() const {
        return sizeof(cycles) +          // int类型的大小
               sizeof(T) * BUFFER_SIZE;  // 一维数组的大小
    }
};

template <typename T>
class BasicInputBlock<T, 2> {
   public:
    int cycles;
    T input[BUFFER_SIZE][8];
    BasicInputBlock() {
        cycles = 0;
        for (int i = 0; i < BUFFER_SIZE; i++) {
            for (int j = 0; j < 8; j++) {
                input[i][j] = 0;
            }
        }
    }
    friend std::istream& operator>>(std::istream& is, BasicInputBlock<T, 2>& obj) {
        is >> obj.cycles;
        // std::cout << "cycles=" << obj.cycles << std::endl;
        for (int i = 0; i < BUFFER_SIZE; i++) {
            for (int j = 0; j < 8; j++) {
                uint64_t tmp;
                is >> tmp;
                std::cout << "i=" << i << " j=" << j << " tmp=" << tmp << std::endl;
                obj.input[i][j] = (T)tmp;
                // std::cout << "i=" << i << " j=" << j << " input=" << obj.input[i][j] << std::endl;
            }
        }
        return is;
    }
    virtual void print() {
        std::cout << "BasicInputBlock<" << typeid(T).name() << ">" << std::endl;
        std::cout << "cycles: " << cycles << std::endl;
        for (int i = 0; i < BUFFER_SIZE; i++) {
            for (int j = 0; j < 8; j++) {
                std::cout << (uint64_t)input[i][j] << " ";
            }
            std::cout << std::endl;
        }
        std::cout << std::endl;
    };

    virtual std::string serialize_data() const {
        std::string buffer;
        buffer += std::to_string(this->cycles);
        for (int i = 0; i < BUFFER_SIZE; i++) {
            for (int j = 0; j < 8; j++) {
                buffer += std::to_string(this->input[i][j]);
            }
        }
        return buffer;
    }
    size_t size() const {
        return sizeof(cycles) +              // int类型的大小
               sizeof(T) * BUFFER_SIZE * 8;  // 一维数组的大小
    }
};

class BoolBlock : public BasicInputBlock<unsigned char, 2> {};

class ByteBlock : public BasicInputBlock<IEC_BYTE, 1> {};

class IntBlock : public BasicInputBlock<IEC_UINT, 1> {};

class DIntBlock : public BasicInputBlock<IEC_UDINT, 1> {};

class LIntBlock : public BasicInputBlock<IEC_ULINT, 1> {};

class IntMemoryBlock : public BasicInputBlock<IEC_UINT, 1> {};

class DIntMemoryBlock : public BasicInputBlock<IEC_UDINT, 1> {};
