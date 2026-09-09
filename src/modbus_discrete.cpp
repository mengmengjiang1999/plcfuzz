//-----------------------------------------------------------------------------
// Copyright 2015 Thiago Alves
// Based on the LDmicro software by Jonathan Westhues.
// This file is part of the OpenPLC Software Stack under the GNU GPL.
//-----------------------------------------------------------------------------

#include <pthread.h>

#include "ladder.h"
#include "modbus_runtime_internal.h"

void ReadCoils(unsigned char *buffer, int bufferSize) {
    int Start, ByteDataLength, CoilDataLength;
    int mb_error = ERR_NONE;

    // this request must have at least 12 bytes. If it doesn't, it's a corrupted message
    if (bufferSize < 12) {
        ModbusError(buffer, ERR_ILLEGAL_DATA_VALUE);
        return;
    }

    Start = word(buffer[8], buffer[9]);
    CoilDataLength = word(buffer[10], buffer[11]);
    ByteDataLength = CoilDataLength / 8;  // calculating the size of the message in bytes
    if (ByteDataLength * 8 < CoilDataLength)
        ByteDataLength++;

    // asked for too many coils
    if (ByteDataLength > 255) {
        ModbusError(buffer, ERR_ILLEGAL_DATA_ADDRESS);
        return;
    }

    // preparing response
    buffer[4] = highByte(ByteDataLength + 3);
    buffer[5] = lowByte(ByteDataLength + 3);  // Number of bytes after this one
    buffer[8] = ByteDataLength;               // Number of bytes of data

    pthread_mutex_lock(&bufferLock);
    for (int i = 0; i < ByteDataLength; i++) {
        for (int j = 0; j < 8; j++) {
            int position = Start + i * 8 + j;
            if (position < MAX_COILS) {
                if (bool_output[position / 8][position % 8] != NULL) {
                    bitWrite(buffer[9 + i], j, *bool_output[position / 8][position % 8]);
                } else {
                    bitWrite(buffer[9 + i], j, 0);
                }
            } else  // invalid address
            {
                mb_error = ERR_ILLEGAL_DATA_ADDRESS;
            }
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
// Implementation of Modbus/TCP Read Discrete Inputs
//-----------------------------------------------------------------------------
void ReadDiscreteInputs(unsigned char *buffer, int bufferSize) {
    int Start, ByteDataLength, InputDataLength;
    int mb_error = ERR_NONE;

    // this request must have at least 12 bytes. If it doesn't, it's a corrupted message
    if (bufferSize < 12) {
        ModbusError(buffer, ERR_ILLEGAL_DATA_VALUE);
        return;
    }

    Start = word(buffer[8], buffer[9]);
    InputDataLength = word(buffer[10], buffer[11]);
    ByteDataLength = InputDataLength / 8;
    if (ByteDataLength * 8 < InputDataLength)
        ByteDataLength++;

    // asked for too many inputs
    if (ByteDataLength > 255) {
        ModbusError(buffer, ERR_ILLEGAL_DATA_ADDRESS);
        return;
    }

    // Preparing response
    buffer[4] = highByte(ByteDataLength + 3);
    buffer[5] = lowByte(ByteDataLength + 3);  // Number of bytes after this one
    buffer[8] = ByteDataLength;               // Number of bytes of data

    pthread_mutex_lock(&bufferLock);
    for (int i = 0; i < ByteDataLength; i++) {
        for (int j = 0; j < 8; j++) {
            int position = Start + i * 8 + j;
            if (position < MAX_DISCRETE_INPUT) {
                if (bool_input[position / 8][position % 8] != NULL) {
                    bitWrite(buffer[9 + i], j, *bool_input[position / 8][position % 8]);
                } else {
                    bitWrite(buffer[9 + i], j, 0);
                }
            } else  // invalid address
            {
                mb_error = ERR_ILLEGAL_DATA_ADDRESS;
            }
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
// Implementation of Modbus/TCP Read Holding Registers
//-----------------------------------------------------------------------------
void WriteCoil(unsigned char *buffer, int bufferSize) {
    int Start;
    int mb_error = ERR_NONE;

    // this request must have at least 12 bytes. If it doesn't, it's a corrupted message
    if (bufferSize < 12) {
        ModbusError(buffer, ERR_ILLEGAL_DATA_VALUE);
        return;
    }

    Start = word(buffer[8], buffer[9]);

    if (Start < MAX_COILS) {
        unsigned char value;
        if (word(buffer[10], buffer[11]) > 0) {
            value = 1;
        } else {
            value = 0;
        }

        pthread_mutex_lock(&bufferLock);
        if (bool_output[Start / 8][Start % 8] != NULL) {
            *bool_output[Start / 8][Start % 8] = value;
        }
        pthread_mutex_unlock(&bufferLock);
    }

    else  // invalid address
    {
        mb_error = ERR_ILLEGAL_DATA_ADDRESS;
    }

    if (mb_error != ERR_NONE) {
        ModbusError(buffer, mb_error);
    } else {
        buffer[4] = 0;
        buffer[5] = 6;  // Number of bytes after this one.
        MessageLength = 12;
    }
}

//-----------------------------------------------------------------------------
// Implementation of Modbus/TCP Write Holding Register
//-----------------------------------------------------------------------------
void WriteMultipleCoils(unsigned char *buffer, int bufferSize) {
    int Start, ByteDataLength, CoilDataLength;
    int mb_error = ERR_NONE;

    // this request must have at least 12 bytes. If it doesn't, it's a corrupted message
    if (bufferSize < 12) {
        ModbusError(buffer, ERR_ILLEGAL_DATA_VALUE);
        return;
    }

    Start = word(buffer[8], buffer[9]);
    CoilDataLength = word(buffer[10], buffer[11]);
    ByteDataLength = CoilDataLength / 8;
    if (ByteDataLength * 8 < CoilDataLength)
        ByteDataLength++;

    // this request must have all the bytes it wants to write. If it doesn't, it's a corrupted message
    if ((bufferSize < (13 + ByteDataLength)) || (buffer[12] != ByteDataLength)) {
        ModbusError(buffer, ERR_ILLEGAL_DATA_VALUE);
        return;
    }

    // preparing response
    buffer[4] = 0;
    buffer[5] = 6;  // Number of bytes after this one.

    pthread_mutex_lock(&bufferLock);
    for (int i = 0; i < ByteDataLength; i++) {
        for (int j = 0; j < 8; j++) {
            int position = Start + i * 8 + j;
            if (position < MAX_COILS) {
                if (bool_output[position / 8][position % 8] != NULL)
                    *bool_output[position / 8][position % 8] = bitRead(buffer[13 + i], j);
            } else  // invalid address
            {
                mb_error = ERR_ILLEGAL_DATA_ADDRESS;
            }
        }
    }
    pthread_mutex_unlock(&bufferLock);

    if (mb_error != ERR_NONE) {
        ModbusError(buffer, mb_error);
    } else {
        MessageLength = 12;
    }
}
