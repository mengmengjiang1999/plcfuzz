//-----------------------------------------------------------------------------
// Copyright 2015 Thiago Alves
// Based on the LDmicro software by Jonathan Westhues.
// Internal declarations split from the OpenPLC Software Stack implementation.
//-----------------------------------------------------------------------------

#pragma once

#include <cstdint>

#include "iec_types.h"

enum {
    MODBUS_MAX_DISCRETE_INPUT = 8192,
    MODBUS_MAX_COILS = 8192,
    MODBUS_MAX_HOLDING_REGISTERS = 8192,
    MODBUS_MAX_INPUT_REGISTERS = 1024,
    MODBUS_MIN_16BIT_RANGE = 1024,
    MODBUS_MAX_16BIT_RANGE = 2047,
    MODBUS_MIN_32BIT_RANGE = 2048,
    MODBUS_MAX_32BIT_RANGE = 4095,
    MODBUS_MIN_64BIT_RANGE = 4096,
    MODBUS_MAX_64BIT_RANGE = 8191,
    MODBUS_ERROR_NONE = 0,
    MODBUS_ERROR_FUNCTION = 1,
    MODBUS_ERROR_ADDRESS = 2,
    MODBUS_ERROR_VALUE = 3
};

enum {
    MAX_DISCRETE_INPUT = MODBUS_MAX_DISCRETE_INPUT,
    MAX_COILS = MODBUS_MAX_COILS,
    MAX_HOLD_REGS = MODBUS_MAX_HOLDING_REGISTERS,
    MAX_INP_REGS = MODBUS_MAX_INPUT_REGISTERS,
    MIN_16B_RANGE = MODBUS_MIN_16BIT_RANGE,
    MAX_16B_RANGE = MODBUS_MAX_16BIT_RANGE,
    MIN_32B_RANGE = MODBUS_MIN_32BIT_RANGE,
    MAX_32B_RANGE = MODBUS_MAX_32BIT_RANGE,
    MIN_64B_RANGE = MODBUS_MIN_64BIT_RANGE,
    MAX_64B_RANGE = MODBUS_MAX_64BIT_RANGE,
    ERR_NONE = MODBUS_ERROR_NONE,
    ERR_ILLEGAL_FUNCTION = MODBUS_ERROR_FUNCTION,
    ERR_ILLEGAL_DATA_ADDRESS = MODBUS_ERROR_ADDRESS,
    ERR_ILLEGAL_DATA_VALUE = MODBUS_ERROR_VALUE
};

extern int MessageLength;
extern IEC_BOOL mb_discrete_input[MODBUS_MAX_DISCRETE_INPUT];
extern IEC_BOOL mb_coils[MODBUS_MAX_COILS];
extern IEC_UINT mb_input_regs[MODBUS_MAX_INPUT_REGISTERS];
extern IEC_UINT mb_holding_regs[MODBUS_MAX_HOLDING_REGISTERS];

int word(unsigned char byte1, unsigned char byte2);
void ModbusError(unsigned char* buffer, int error_code);
void ReadCoils(unsigned char* buffer, int buffer_size);
void ReadDiscreteInputs(unsigned char* buffer, int buffer_size);
void ReadHoldingRegisters(unsigned char* buffer, int buffer_size);
void ReadInputRegisters(unsigned char* buffer, int buffer_size);
void WriteCoil(unsigned char* buffer, int buffer_size);
void WriteRegister(unsigned char* buffer, int buffer_size);
void WriteMultipleCoils(unsigned char* buffer, int buffer_size);
void WriteMultipleRegisters(unsigned char* buffer, int buffer_size);

inline unsigned char lowByte(unsigned int value) {
    return static_cast<unsigned char>(value & 0xffU);
}

inline unsigned char highByte(unsigned int value) {
    return static_cast<unsigned char>((value >> 8U) & 0xffU);
}

inline unsigned char bitRead(unsigned char value, int bit) {
    return static_cast<unsigned char>((value >> bit) & 0x01U);
}

inline void bitWrite(unsigned char& value, int bit, bool bit_value) {
    const unsigned char mask = static_cast<unsigned char>(1U << bit);
    if(bit_value) {
        value = static_cast<unsigned char>(value | mask);
    } else {
        value = static_cast<unsigned char>(value & static_cast<unsigned char>(~mask));
    }
}
