#pragma once

#include <iostream>

#include "ladder.h"

template <typename T, int Dim = 1>
class BasicInputBlock {
   public:
    int cycles;
    T input[BUFFER_SIZE];
    BasicInputBlock() = default;
    friend std::istream& operator>>(std::istream& is, BasicInputBlock<T, Dim>& obj) {
        is >> obj.cycles;
        for (int i = 0; i < BUFFER_SIZE; i++) {
            is >> obj.input[i];
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
};

template <typename T>
class BasicInputBlock<T, 2> {
   public:
    int cycles;
    T input[BUFFER_SIZE][8];
    BasicInputBlock() = default;
    friend std::istream& operator>>(std::istream& is, BasicInputBlock<T, 2>& obj) {
        is >> obj.cycles;
        for (int i = 0; i < BUFFER_SIZE; i++) {
            for (int j = 0; j < 8; j++) {
                uint32_t tmp;
                is >> tmp;
                obj.input[i][j] = (T)tmp;
            }
            //     is >> obj.input[i][j];
            // }
        }
        return is;
    }
    virtual void print() {
        std::cout << "BasicInputBlock<" << typeid(T).name() << ">" << std::endl;
        std::cout << "cycles: " << cycles << std::endl;
        for (int i = 0; i < BUFFER_SIZE; i++) {
            for (int j = 0; j < 8; j++) {
                std::cout << (uint32_t)input[i][j] << " ";
            }
            std::cout << std::endl;
        }
        std::cout << std::endl;
    };
};

class BoolBlock : public BasicInputBlock<unsigned char, 2> {};

class ByteBlock : public BasicInputBlock<IEC_BYTE, 1> {};

class DIntBlock : public BasicInputBlock<IEC_DINT, 1> {};

class DIntMemoryBlock : public BasicInputBlock<IEC_UDINT, 1> {};

class IntBlock : public BasicInputBlock<IEC_INT, 1> {};

class IntMemoryBlock : public BasicInputBlock<IEC_UINT, 1> {};

class LIntBlock : public BasicInputBlock<IEC_LINT, 1> {};