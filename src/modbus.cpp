//-----------------------------------------------------------------------------
// Copyright 2015 Thiago Alves
// Based on the LDmicro software by Jonathan Westhues.
// This file is part of the OpenPLC Software Stack under the GNU GPL.
//-----------------------------------------------------------------------------

#include "modbus_runtime_internal.h"

namespace {

enum FunctionCode {
    kReadCoils = 1,
    kReadInputs = 2,
    kReadHoldingRegisters = 3,
    kReadInputRegisters = 4,
    kWriteCoil = 5,
    kWriteRegister = 6,
    kWriteMultipleCoils = 15,
    kWriteMultipleRegisters = 16
};

}  // namespace

int MessageLength = 0;

int word(unsigned char byte1, unsigned char byte2) {
    return static_cast<int>((static_cast<unsigned int>(byte1) << 8U) | byte2);
}

void ModbusError(unsigned char* buffer, int error_code) {
    buffer[4] = 0;
    buffer[5] = 3;
    buffer[7] = static_cast<unsigned char>(buffer[7] | 0x80U);
    buffer[8] = static_cast<unsigned char>(error_code);
    MessageLength = 9;
}

int processModbusMessage(unsigned char* buffer, int buffer_size) {
    MessageLength = 0;
    if(buffer_size < 8) {
        ModbusError(buffer, MODBUS_ERROR_FUNCTION);
    } else if(buffer[7] == kReadCoils) {
        ReadCoils(buffer, buffer_size);
    } else if(buffer[7] == kReadInputs) {
        ReadDiscreteInputs(buffer, buffer_size);
    } else if(buffer[7] == kReadHoldingRegisters) {
        ReadHoldingRegisters(buffer, buffer_size);
    } else if(buffer[7] == kReadInputRegisters) {
        ReadInputRegisters(buffer, buffer_size);
    } else if(buffer[7] == kWriteCoil) {
        WriteCoil(buffer, buffer_size);
    } else if(buffer[7] == kWriteRegister) {
        WriteRegister(buffer, buffer_size);
    } else if(buffer[7] == kWriteMultipleCoils) {
        WriteMultipleCoils(buffer, buffer_size);
    } else if(buffer[7] == kWriteMultipleRegisters) {
        WriteMultipleRegisters(buffer, buffer_size);
    } else {
        ModbusError(buffer, MODBUS_ERROR_FUNCTION);
    }
    return MessageLength;
}
