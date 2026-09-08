#pragma once

#include <ladder.h>

#include <iostream>
static const int MAX_RESULTS = 10;

class SuperBasicBufferHistory {
   protected:
    int index;
    SuperBasicBufferHistory() {
        index = 0;
    }
};

template <typename T, int Dim = 1>
class BasicBufferHistory : public SuperBasicBufferHistory {
   public:
    T buffer_input[OPENPLC_BUFFER_SIZE][MAX_RESULTS];
    T buffer_output[OPENPLC_BUFFER_SIZE][MAX_RESULTS];
    BasicBufferHistory() {
        // std::cout << "BasicBufferHistory<T, " << Dim << ">::BasicBufferHistory() called." << std::endl;
        for(int i = 0; i < OPENPLC_BUFFER_SIZE; i++) {
            for(int j = 0; j < MAX_RESULTS; j++) {
                buffer_input[i][j] = 0;
                buffer_output[i][j] = 0;
            }
        }
    }
    void update_history(T* input[OPENPLC_BUFFER_SIZE], T* output[OPENPLC_BUFFER_SIZE]) {
        // std::cout << "BasicBufferHistory<T, " << Dim << ">::update_history() called." << std::endl;
        for(int i = 0; i < OPENPLC_BUFFER_SIZE; i++) {
            buffer_input[i][index] = *input[i];
            buffer_output[i][index] = *output[i];
        }
        index = (index + 1) % MAX_RESULTS;
    }
    bool check_change() {
        // std::cout << "BasicBufferHistory<T, Dim>::check_change() called." << std::endl;
        int change_count = 0;
        for(size_t i = 1; i < MAX_RESULTS; i++) {
            bool is_crash = false;
            for(size_t k = 0; k < OPENPLC_BUFFER_SIZE; k++) {
                if(buffer_output[k][i] != buffer_output[k][i - 1]) {
                    is_crash = true;
                    break;
                }
            }
            if(is_crash) {
                change_count++;
            }
        }
        if(change_count > 0) {
            return true;
        }
        return false;
    }
    void print_history() {
        for(int j = 0; j < MAX_RESULTS; j++) {
            std::cout << "index: " << j << std::endl;
            for(int i = 0; i < OPENPLC_BUFFER_SIZE; i++) {
                std::cout << "input[" << i << "]=" << static_cast<uint32_t>(buffer_input[i][j]) << std::endl;
                std::cout << "output[" << i << "]= " << static_cast<uint32_t>(buffer_output[i][j]) << std::endl;
            }
        }
    }
};

template <typename T>
class BasicBufferHistory<T, 2> : public SuperBasicBufferHistory {
   public:
    T buffer_input[OPENPLC_BUFFER_SIZE][8][MAX_RESULTS];
    T buffer_output[OPENPLC_BUFFER_SIZE][8][MAX_RESULTS];
    BasicBufferHistory() {
        // std::cout << "BasicBufferHistory<T, 2>::BasicBufferHistory() called." << std::endl;
        for(int i = 0; i < OPENPLC_BUFFER_SIZE; i++) {
            for(int j = 0; j < 8; j++) {
                for(int k = 0; k < MAX_RESULTS; k++) {
                    buffer_input[i][j][k] = 0;
                    buffer_output[i][j][k] = 0;
                }
            }
        }
        // this->print_history();
    }
    void update_history(T* bool_input[OPENPLC_BUFFER_SIZE][8], T* bool_output[OPENPLC_BUFFER_SIZE][8]) {
        buffer_input[0][0][index] = 60;
        buffer_output[0][0][index] = 60;
        for(int i = 0; i < OPENPLC_BUFFER_SIZE; i++) {
            for(int j = 0; j < 8; j++) {
                buffer_input[i][j][index] = *bool_input[i][j];
                buffer_output[i][j][index] = *bool_output[i][j];
            }
        }
        index = (index + 1) % MAX_RESULTS;
    }
    bool check_change() {
        // this->print_history();
        // std::cout << "bool check_change() called" << std::endl;
        int change_count = 0;
        for(size_t i = 1; i < MAX_RESULTS; i++) {
            bool is_crash = false;
            for(size_t j = 0; j < 8; j++) {
                for(size_t k = 0; k < OPENPLC_BUFFER_SIZE; k++) {
                    if(buffer_output[k][j][i] != buffer_output[k][j][i - 1]) {
                        // std::cout << "i=" << i << " j=" << j << " k=" << k
                        //           << " buffer_output[k][j][i] != buffer_output[k][j][i - 1]" << std::endl;
                        // std::cout << "buffer_output[k][j][i] = " << static_cast<uint32_t>(buffer_output[k][j][i])
                        //           << ",buffer_output[k][j][i - 1] = " << static_cast<uint32_t>(buffer_output[k][j][i - 1]) <<
                        //           ","
                        //           << std::endl;
                        is_crash = true;
                        break;
                    }
                }
                if(is_crash) {
                    break;
                }
            }
            if(is_crash) {
                change_count++;
            }
        }
        if(change_count > 0) {
            return true;
        }
        return false;
    }
    void print_history() {
        std::cout << "bool print_history() called" << std::endl;
        std::cout << "input" << std::endl;
        for(int k = 0; k < MAX_RESULTS; k++) {
            std::cout << "index: " << k << std::endl;
            for(int i = 0; i < OPENPLC_BUFFER_SIZE; i++) {
                for(int j = 0; j < 8; j++) {
                    std::cout << static_cast<uint32_t>(buffer_input[i][j][k]) << " ";
                }
                std::cout << std::endl;
            }
        }
        std::cout << "output" << std::endl;
        for(int k = 0; k < MAX_RESULTS; k++) {
            std::cout << "index: " << k << std::endl;
            for(int i = 0; i < OPENPLC_BUFFER_SIZE; i++) {
                for(int j = 0; j < 8; j++) {
                    std::cout << static_cast<uint32_t>(buffer_output[i][j][k]) << " ";
                }
                std::cout << std::endl;
            }
        }
    }
};

class BoolBufferHistory : public BasicBufferHistory<IEC_BOOL, 2> {};

class ByteBufferHistory : public BasicBufferHistory<IEC_BYTE, 1> {};

class IntBufferHistory : public BasicBufferHistory<IEC_UINT, 1> {};

class DIntBufferHistory : public BasicBufferHistory<IEC_UDINT, 1> {};

class LIntBufferHistory : public BasicBufferHistory<IEC_ULINT, 1> {};

class IntMemoryBufferHistory : public BasicBufferHistory<IEC_UINT, 1> {};

class DIntMemoryBufferHistory : public BasicBufferHistory<IEC_UDINT, 1> {};
