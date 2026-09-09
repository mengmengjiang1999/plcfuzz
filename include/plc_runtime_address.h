#pragma once

#include <cstddef>
#include <stdexcept>

#include "ladder.h"

class PLCInputSlot {
   public:
    static PLCInputSlot from_index(std::size_t value) {
        if (value >= PLC_INPUT_SIZE) {
            throw std::out_of_range("PLC input slot is outside the modeled input range");
        }
        return PLCInputSlot(value);
    }

    std::size_t value() const { return value_; }

   private:
    explicit PLCInputSlot(std::size_t value) : value_(value) {}
    std::size_t value_;
};

class PLCBitOffset {
   public:
    static PLCBitOffset from_index(std::size_t value) {
        if (value >= 8) {
            throw std::out_of_range("PLC bit offset is outside the byte range");
        }
        return PLCBitOffset(value);
    }

    std::size_t value() const { return value_; }

   private:
    explicit PLCBitOffset(std::size_t value) : value_(value) {}
    std::size_t value_;
};
