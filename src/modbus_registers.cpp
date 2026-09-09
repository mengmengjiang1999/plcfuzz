//-----------------------------------------------------------------------------
// Copyright 2015 Thiago Alves
// Based on the LDmicro software by Jonathan Westhues.
// This file is part of the OpenPLC Software Stack under the GNU GPL.
//-----------------------------------------------------------------------------

#include <pthread.h>

#include "ladder.h"
#include "modbus_runtime_internal.h"

void ReadHoldingRegisters(unsigned char *buffer, int bufferSize) {
    int Start, WordDataLength, ByteDataLength;
    int mb_error = ERR_NONE;

    // this request must have at least 12 bytes. If it doesn't, it's a corrupted message
    if (bufferSize < 12) {
        ModbusError(buffer, ERR_ILLEGAL_DATA_VALUE);
        return;
    }

    Start = word(buffer[8], buffer[9]);
    WordDataLength = word(buffer[10], buffer[11]);
    ByteDataLength = WordDataLength * 2;

    // asked for too many registers
    if (ByteDataLength > 255) {
        ModbusError(buffer, ERR_ILLEGAL_DATA_ADDRESS);
        return;
    }

    // preparing response
    buffer[4] = highByte(ByteDataLength + 3);
    buffer[5] = lowByte(ByteDataLength + 3);  // Number of bytes after this one
    buffer[8] = ByteDataLength;               // Number of bytes of data

    pthread_mutex_lock(&bufferLock);
    for (int i = 0; i < WordDataLength; i++) {
        int position = Start + i;
        if (position <= MIN_16B_RANGE) {
            if (int_output[position] != NULL) {
                buffer[9 + i * 2] = highByte(*int_output[position]);
                buffer[10 + i * 2] = lowByte(*int_output[position]);
            } else {
                buffer[9 + i * 2] = 0;
                buffer[10 + i * 2] = 0;
            }
        }
        // accessing memory
        // 16-bit registers
        else if (position >= MIN_16B_RANGE && position <= MAX_16B_RANGE) {
            if (int_memory[position - MIN_16B_RANGE] != NULL) {
                buffer[9 + i * 2] = highByte(*int_memory[position - MIN_16B_RANGE]);
                buffer[10 + i * 2] = lowByte(*int_memory[position - MIN_16B_RANGE]);
            } else {
                buffer[9 + i * 2] = 0;
                buffer[10 + i * 2] = 0;
            }
        }
        // 32-bit registers
        else if (position >= MIN_32B_RANGE && position <= MAX_32B_RANGE) {
            if (dint_memory[(position - MIN_32B_RANGE) / 2] != NULL) {
                if ((position - MIN_32B_RANGE) % 2 == 0)  // first word
                {
                    uint16_t tempValue = (uint16_t)(*dint_memory[(position - MIN_32B_RANGE) / 2] >> 16);
                    buffer[9 + i * 2] = highByte(tempValue);
                    buffer[10 + i * 2] = lowByte(tempValue);
                } else  // second word
                {
                    uint16_t tempValue = (uint16_t)(*dint_memory[(position - MIN_32B_RANGE) / 2] & 0xffff);
                    buffer[9 + i * 2] = highByte(tempValue);
                    buffer[10 + i * 2] = lowByte(tempValue);
                }
            } else {
                buffer[9 + i * 2] = mb_holding_regs[position];
                buffer[10 + i * 2] = mb_holding_regs[position];
            }
        }
        // 64-bit registers
        else if (position >= MIN_64B_RANGE && position <= MAX_64B_RANGE) {
            if (lint_memory[(position - MIN_64B_RANGE) / 4] != NULL) {
                if ((position - MIN_64B_RANGE) % 4 == 0)  // first word
                {
                    uint16_t tempValue = (uint16_t)(*lint_memory[(position - MIN_64B_RANGE) / 4] >> 48);
                    buffer[9 + i * 2] = highByte(tempValue);
                    buffer[10 + i * 2] = lowByte(tempValue);
                } else if ((position - MIN_64B_RANGE) % 4 == 1)  // second word
                {
                    uint16_t tempValue = (uint16_t)((*lint_memory[(position - MIN_64B_RANGE) / 4] >> 32) & 0xffff);
                    buffer[9 + i * 2] = highByte(tempValue);
                    buffer[10 + i * 2] = lowByte(tempValue);
                } else if ((position - MIN_64B_RANGE) % 4 == 2)  // third word
                {
                    uint16_t tempValue = (uint16_t)((*lint_memory[(position - MIN_64B_RANGE) / 4] >> 16) & 0xffff);
                    buffer[9 + i * 2] = highByte(tempValue);
                    buffer[10 + i * 2] = lowByte(tempValue);
                } else if ((position - MIN_64B_RANGE) % 4 == 3)  // fourth word
                {
                    uint16_t tempValue = (uint16_t)(*lint_memory[(position - MIN_64B_RANGE) / 4] & 0xffff);
                    buffer[9 + i * 2] = highByte(tempValue);
                    buffer[10 + i * 2] = lowByte(tempValue);
                }
            } else {
                buffer[9 + i * 2] = mb_holding_regs[position];
                buffer[10 + i * 2] = mb_holding_regs[position];
            }
        }
        // invalid address
        else {
            mb_error = ERR_ILLEGAL_DATA_ADDRESS;
        }
    }
    pthread_mutex_unlock(&bufferLock);

    if (mb_error != ERR_NONE) {
        ModbusError(buffer, mb_error);
    } else {
        MessageLength = ByteDataLength + 9;
    }
}

//-----------------------------------------------------------------------------
// Implementation of Modbus/TCP Read Input Registers
//-----------------------------------------------------------------------------
void ReadInputRegisters(unsigned char *buffer, int bufferSize) {
    int Start, WordDataLength, ByteDataLength;
    int mb_error = ERR_NONE;

    // this request must have at least 12 bytes. If it doesn't, it's a corrupted message
    if (bufferSize < 12) {
        ModbusError(buffer, ERR_ILLEGAL_DATA_VALUE);
        return;
    }

    Start = word(buffer[8], buffer[9]);
    WordDataLength = word(buffer[10], buffer[11]);
    ByteDataLength = WordDataLength * 2;

    // asked for too many registers
    if (ByteDataLength > 255) {
        ModbusError(buffer, ERR_ILLEGAL_DATA_ADDRESS);
        return;
    }

    // preparing response
    buffer[4] = highByte(ByteDataLength + 3);
    buffer[5] = lowByte(ByteDataLength + 3);  // Number of bytes after this one
    buffer[8] = ByteDataLength;               // Number of bytes of data

    pthread_mutex_lock(&bufferLock);
    for (int i = 0; i < WordDataLength; i++) {
        int position = Start + i;
        if (position < MAX_INP_REGS) {
            if (int_input[position] != NULL) {
                buffer[9 + i * 2] = highByte(*int_input[position]);
                buffer[10 + i * 2] = lowByte(*int_input[position]);
            } else {
                buffer[9 + i * 2] = 0;
                buffer[10 + i * 2] = 0;
            }
        } else  // invalid address
        {
            mb_error = ERR_ILLEGAL_DATA_ADDRESS;
        }
    }
    pthread_mutex_unlock(&bufferLock);

    if (mb_error != ERR_NONE) {
        ModbusError(buffer, mb_error);
    } else {
        MessageLength = ByteDataLength + 9;
    }
}

//-----------------------------------------------------------------------------
// Implementation of Modbus/TCP Write Coil
//-----------------------------------------------------------------------------
void WriteRegister(unsigned char *buffer, int bufferSize) {
    int Start;
    int mb_error = ERR_NONE;

    // this request must have at least 12 bytes. If it doesn't, it's a corrupted message
    if (bufferSize < 12) {
        ModbusError(buffer, ERR_ILLEGAL_DATA_VALUE);
        return;
    }

    Start = word(buffer[8], buffer[9]);

    pthread_mutex_lock(&bufferLock);
    // analog outputs
    if (Start <= MIN_16B_RANGE) {
        if (int_output[Start] != NULL) {
            *int_output[Start] = word(buffer[10], buffer[11]);
        }
    }
    // accessing memory
    // 16-bit registers
    else if (Start >= MIN_16B_RANGE && Start <= MAX_16B_RANGE) {
        if (int_memory[Start - MIN_16B_RANGE] != NULL) {
            *int_memory[Start - MIN_16B_RANGE] = word(buffer[10], buffer[11]);
        }
    }
    // 32-bit registers
    else if (Start >= MIN_32B_RANGE && Start <= MAX_32B_RANGE) {
        if (dint_memory[(Start - MIN_32B_RANGE) / 2] != NULL) {
            uint32_t tempValue = (uint32_t)word(buffer[10], buffer[11]);

            if ((Start - MIN_32B_RANGE) % 2 == 0)  // first word
            {
                *dint_memory[(Start - MIN_32B_RANGE) / 2] = *dint_memory[(Start - MIN_32B_RANGE) / 2] & 0x0000ffff;
                *dint_memory[(Start - MIN_32B_RANGE) / 2] = *dint_memory[(Start - MIN_32B_RANGE) / 2] | (tempValue << 16);
            } else  // second word
            {
                *dint_memory[(Start - MIN_32B_RANGE) / 2] = *dint_memory[(Start - MIN_32B_RANGE) / 2] & 0xffff0000;
                *dint_memory[(Start - MIN_32B_RANGE) / 2] = *dint_memory[(Start - MIN_32B_RANGE) / 2] | tempValue;
            }
        } else {
            mb_holding_regs[Start] = word(buffer[10], buffer[11]);
        }
    }
    // 64-bit registers
    else if (Start >= MIN_64B_RANGE && Start <= MAX_64B_RANGE) {
        if (lint_memory[(Start - MIN_64B_RANGE) / 4] != NULL) {
            uint64_t tempValue = (uint64_t)word(buffer[10], buffer[11]);

            if ((Start - MIN_64B_RANGE) % 4 == 0)  // first word
            {
                *lint_memory[(Start - MIN_64B_RANGE) / 4] = *lint_memory[(Start - MIN_64B_RANGE) / 4] & 0x0000ffffffffffff;
                *lint_memory[(Start - MIN_64B_RANGE) / 4] = *lint_memory[(Start - MIN_64B_RANGE) / 4] | (tempValue << 48);
            } else if ((Start - MIN_64B_RANGE) % 4 == 1)  // second word
            {
                *lint_memory[(Start - MIN_64B_RANGE) / 4] = *lint_memory[(Start - MIN_64B_RANGE) / 4] & 0xffff0000ffffffff;
                *lint_memory[(Start - MIN_64B_RANGE) / 4] = *lint_memory[(Start - MIN_64B_RANGE) / 4] | (tempValue << 32);
            } else if ((Start - MIN_64B_RANGE) % 4 == 2)  // third word
            {
                *lint_memory[(Start - MIN_64B_RANGE) / 4] = *lint_memory[(Start - MIN_64B_RANGE) / 4] & 0xffffffff0000ffff;
                *lint_memory[(Start - MIN_64B_RANGE) / 4] = *lint_memory[(Start - MIN_64B_RANGE) / 4] | (tempValue << 16);
            } else if ((Start - MIN_64B_RANGE) % 4 == 3)  // fourth word
            {
                *lint_memory[(Start - MIN_64B_RANGE) / 4] = *lint_memory[(Start - MIN_64B_RANGE) / 4] & 0xffffffffffff0000;
                *lint_memory[(Start - MIN_64B_RANGE) / 4] = *lint_memory[(Start - MIN_64B_RANGE) / 4] | tempValue;
            }
        } else {
            mb_holding_regs[Start] = word(buffer[10], buffer[11]);
        }
    } else  // invalid address
    {
        mb_error = ERR_ILLEGAL_DATA_ADDRESS;
    }
    pthread_mutex_unlock(&bufferLock);

    if (mb_error != ERR_NONE) {
        ModbusError(buffer, mb_error);
    } else {
        buffer[4] = 0;
        buffer[5] = 6;  // Number of bytes after this one.
        MessageLength = 12;
    }
}

//-----------------------------------------------------------------------------
// Implementation of Modbus/TCP Write Multiple Coils
//-----------------------------------------------------------------------------
void WriteMultipleRegisters(unsigned char *buffer, int bufferSize) {
    int Start, WordDataLength, ByteDataLength;
    int mb_error = ERR_NONE;

    // this request must have at least 12 bytes. If it doesn't, it's a corrupted message
    if (bufferSize < 12) {
        ModbusError(buffer, ERR_ILLEGAL_DATA_VALUE);
        return;
    }

    Start = word(buffer[8], buffer[9]);
    WordDataLength = word(buffer[10], buffer[11]);
    ByteDataLength = WordDataLength * 2;

    // this request must have all the bytes it wants to write. If it doesn't, it's a corrupted message
    if ((bufferSize < (13 + ByteDataLength)) || (buffer[12] != ByteDataLength)) {
        ModbusError(buffer, ERR_ILLEGAL_DATA_VALUE);
        return;
    }

    // preparing response
    buffer[4] = 0;
    buffer[5] = 6;  // Number of bytes after this one.

    pthread_mutex_lock(&bufferLock);
    for (int i = 0; i < WordDataLength; i++) {
        int position = Start + i;
        // analog outputs
        if (position <= MIN_16B_RANGE) {
            if (int_output[position] != NULL)
                *int_output[position] = word(buffer[13 + i * 2], buffer[14 + i * 2]);
        }
        // accessing memory
        // 16-bit registers
        else if (position >= MIN_16B_RANGE && position <= MAX_16B_RANGE) {
            if (int_memory[position - MIN_16B_RANGE] != NULL)
                *int_memory[position - MIN_16B_RANGE] = word(buffer[13 + i * 2], buffer[14 + i * 2]);
        }
        // 32-bit registers
        else if (position >= MIN_32B_RANGE && position <= MAX_32B_RANGE) {
            if (dint_memory[(Start - MIN_32B_RANGE) / 2] != NULL) {
                uint32_t tempValue = (uint32_t)word(buffer[13 + i * 2], buffer[14 + i * 2]);

                if ((position - MIN_32B_RANGE) % 2 == 0)  // first word
                {
                    *dint_memory[(position - MIN_32B_RANGE) / 2] = *dint_memory[(position - MIN_32B_RANGE) / 2] & 0x0000ffff;
                    *dint_memory[(position - MIN_32B_RANGE) / 2] =
                        *dint_memory[(position - MIN_32B_RANGE) / 2] | (tempValue << 16);
                } else  // second word
                {
                    *dint_memory[(position - MIN_32B_RANGE) / 2] = *dint_memory[(position - MIN_32B_RANGE) / 2] & 0xffff0000;
                    *dint_memory[(position - MIN_32B_RANGE) / 2] = *dint_memory[(position - MIN_32B_RANGE) / 2] | tempValue;
                }
            } else {
                mb_holding_regs[position] = word(buffer[13 + i * 2], buffer[14 + i * 2]);
            }
        }
        // 64-bit registers
        else if (position >= MIN_64B_RANGE && position <= MAX_64B_RANGE) {
            if (lint_memory[(position - MIN_64B_RANGE) / 4] != NULL) {
                uint64_t tempValue = (uint64_t)word(buffer[13 + i * 2], buffer[14 + i * 2]);

                if ((position - MIN_64B_RANGE) % 4 == 0)  // first word
                {
                    *lint_memory[(position - MIN_64B_RANGE) / 4] =
                        *lint_memory[(position - MIN_64B_RANGE) / 4] & 0x0000ffffffffffff;
                    *lint_memory[(position - MIN_64B_RANGE) / 4] =
                        *lint_memory[(position - MIN_64B_RANGE) / 4] | (tempValue << 48);
                } else if ((Start - MIN_64B_RANGE) % 4 == 1)  // second word
                {
                    *lint_memory[(position - MIN_64B_RANGE) / 4] =
                        *lint_memory[(position - MIN_64B_RANGE) / 4] & 0xffff0000ffffffff;
                    *lint_memory[(position - MIN_64B_RANGE) / 4] =
                        *lint_memory[(position - MIN_64B_RANGE) / 4] | (tempValue << 32);
                } else if ((Start - MIN_64B_RANGE) % 4 == 2)  // third word
                {
                    *lint_memory[(position - MIN_64B_RANGE) / 4] =
                        *lint_memory[(position - MIN_64B_RANGE) / 4] & 0xffffffff0000ffff;
                    *lint_memory[(position - MIN_64B_RANGE) / 4] =
                        *lint_memory[(position - MIN_64B_RANGE) / 4] | (tempValue << 16);
                } else if ((Start - MIN_64B_RANGE) % 4 == 3)  // fourth word
                {
                    *lint_memory[(position - MIN_64B_RANGE) / 4] =
                        *lint_memory[(position - MIN_64B_RANGE) / 4] & 0xffffffffffff0000;
                    *lint_memory[(position - MIN_64B_RANGE) / 4] = *lint_memory[(position - MIN_64B_RANGE) / 4] | tempValue;
                }
            } else {
                mb_holding_regs[Start] = word(buffer[10], buffer[11]);
            }
        } else  // invalid address
        {
            mb_error = ERR_ILLEGAL_DATA_ADDRESS;
        }
    }
    pthread_mutex_unlock(&bufferLock);

    if (mb_error != ERR_NONE) {
        ModbusError(buffer, mb_error);
    } else {
        MessageLength = 12;
    }
}
