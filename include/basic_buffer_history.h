#pragma once

#include <cstddef>
#include <cstdint>
#include <iostream>

#include "ladder.h"

static const std::size_t MAX_RESULTS = 10;

class SuperBasicBufferHistory {
   protected:
    std::size_t next_index_ = 0;
    std::size_t sample_count_ = 0;

    void finish_sample() {
        next_index_ = (next_index_ + 1) % MAX_RESULTS;
        if (sample_count_ < MAX_RESULTS) {
            ++sample_count_;
        }
    }

    std::size_t chronological_index(std::size_t offset) const {
        const std::size_t oldest = sample_count_ < MAX_RESULTS ? 0 : next_index_;
        return (oldest + offset) % MAX_RESULTS;
    }

   public:
    std::size_t sample_count() const { return sample_count_; }
};

template <typename T, int Dim = 1>
class BasicBufferHistory : public SuperBasicBufferHistory {
   public:
    T buffer_input[OPENPLC_BUFFER_SIZE][MAX_RESULTS] = {};
    T buffer_output[OPENPLC_BUFFER_SIZE][MAX_RESULTS] = {};

    void update_history(T* input[OPENPLC_BUFFER_SIZE], T* output[OPENPLC_BUFFER_SIZE]) {
        for (std::size_t i = 0; i < OPENPLC_BUFFER_SIZE; ++i) {
            buffer_input[i][next_index_] = *input[i];
            buffer_output[i][next_index_] = *output[i];
        }
        finish_sample();
    }

    bool check_change() const {
        if (sample_count_ < 2) {
            return false;
        }
        for (std::size_t offset = 1; offset < sample_count_; ++offset) {
            const std::size_t previous = chronological_index(offset - 1);
            const std::size_t current = chronological_index(offset);
            for (std::size_t slot = 0; slot < OPENPLC_BUFFER_SIZE; ++slot) {
                if (buffer_output[slot][current] != buffer_output[slot][previous]) {
                    return true;
                }
            }
        }
        return false;
    }

    void print_history() const {
        for (std::size_t offset = 0; offset < sample_count_; ++offset) {
            const std::size_t history_index = chronological_index(offset);
            std::cout << "index: " << history_index << std::endl;
            for (std::size_t slot = 0; slot < OPENPLC_BUFFER_SIZE; ++slot) {
                std::cout << "input[" << slot << "]=" << static_cast<uint64_t>(buffer_input[slot][history_index])
                          << std::endl;
                std::cout << "output[" << slot << "]=" << static_cast<uint64_t>(buffer_output[slot][history_index])
                          << std::endl;
            }
        }
    }
};

template <typename T>
class BasicBufferHistory<T, 2> : public SuperBasicBufferHistory {
   public:
    T buffer_input[OPENPLC_BUFFER_SIZE][8][MAX_RESULTS] = {};
    T buffer_output[OPENPLC_BUFFER_SIZE][8][MAX_RESULTS] = {};

    void update_history(T* input[OPENPLC_BUFFER_SIZE][8], T* output[OPENPLC_BUFFER_SIZE][8]) {
        for (std::size_t slot = 0; slot < OPENPLC_BUFFER_SIZE; ++slot) {
            for (std::size_t bit = 0; bit < 8; ++bit) {
                buffer_input[slot][bit][next_index_] = *input[slot][bit];
                buffer_output[slot][bit][next_index_] = *output[slot][bit];
            }
        }
        finish_sample();
    }

    bool check_change() const {
        if (sample_count_ < 2) {
            return false;
        }
        for (std::size_t offset = 1; offset < sample_count_; ++offset) {
            const std::size_t previous = chronological_index(offset - 1);
            const std::size_t current = chronological_index(offset);
            for (std::size_t slot = 0; slot < OPENPLC_BUFFER_SIZE; ++slot) {
                for (std::size_t bit = 0; bit < 8; ++bit) {
                    if (buffer_output[slot][bit][current] != buffer_output[slot][bit][previous]) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    void print_history() const {
        for (std::size_t offset = 0; offset < sample_count_; ++offset) {
            const std::size_t history_index = chronological_index(offset);
            std::cout << "index: " << history_index << std::endl;
            for (std::size_t slot = 0; slot < OPENPLC_BUFFER_SIZE; ++slot) {
                for (std::size_t bit = 0; bit < 8; ++bit) {
                    std::cout << static_cast<uint64_t>(buffer_output[slot][bit][history_index]) << ' ';
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
