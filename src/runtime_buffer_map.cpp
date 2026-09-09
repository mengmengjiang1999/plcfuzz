//-----------------------------------------------------------------------------
// Copyright 2015 Thiago Alves
// Based on the LDmicro software by Jonathan Westhues.
// This file is part of the OpenPLC Software Stack under the GNU GPL.
//-----------------------------------------------------------------------------

#include "ladder.h"
#include "modbus_runtime_internal.h"
#include "pthread_mutex_guard.h"

IEC_BOOL mb_discrete_input[MODBUS_MAX_DISCRETE_INPUT];
IEC_BOOL mb_coils[MODBUS_MAX_COILS];
IEC_UINT mb_input_regs[MODBUS_MAX_INPUT_REGISTERS];
IEC_UINT mb_holding_regs[MODBUS_MAX_HOLDING_REGISTERS];

void mapUnusedIO() {
    PthreadMutexGuard lock(bufferLock);
    for(int index = 0; index < MODBUS_MAX_DISCRETE_INPUT; ++index) {
        if(bool_input[index / 8][index % 8] == NULL) {
            bool_input[index / 8][index % 8] = &mb_discrete_input[index];
        }
    }
    for(int index = 0; index < MODBUS_MAX_COILS; ++index) {
        if(bool_output[index / 8][index % 8] == NULL) {
            bool_output[index / 8][index % 8] = &mb_coils[index];
        }
    }
    for(int index = 0; index < MODBUS_MAX_INPUT_REGISTERS; ++index) {
        if(int_input[index] == NULL) {
            int_input[index] = &mb_input_regs[index];
        }
    }
    for(int index = 0; index <= MODBUS_MIN_16BIT_RANGE; ++index) {
        if(index < MODBUS_MIN_16BIT_RANGE && int_output[index] == NULL) {
            int_output[index] = &mb_holding_regs[index];
        } else if(index >= MODBUS_MIN_16BIT_RANGE && int_memory[index - MODBUS_MIN_16BIT_RANGE] == NULL) {
            int_memory[index - MODBUS_MIN_16BIT_RANGE] = &mb_holding_regs[index];
        }
    }
}
