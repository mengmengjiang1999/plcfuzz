#pragma once

#include <stdint.h>

#include <algorithm>
#include <cstddef>
#include <stdexcept>
#include <string>
#include <type_traits>

#include "plc_input_format.h"

template <typename T>
void reverse_bytes(T &value) {
    static_assert(std::is_trivially_copyable<T>::value, "Type must be trivially copyable");
    uint8_t *bytes = reinterpret_cast<uint8_t *>(&value);
    for (size_t i = 0; i < sizeof(T) / 2; ++i) {
        std::swap(bytes[i], bytes[sizeof(T) - 1 - i]);
    }
}

template <typename T>
T unsigned_bit_mask(std::size_t bit_index) {
    static_assert(std::is_unsigned<T>::value, "Bit masks require an unsigned type");
    if(bit_index >= sizeof(T) * 8) {
        throw std::out_of_range("bit index exceeds value width");
    }
    return static_cast<T>(T(1) << bit_index);
}
