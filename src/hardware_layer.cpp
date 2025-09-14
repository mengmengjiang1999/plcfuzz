//-----------------------------------------------------------------------------
// Copyright 2015 Thiago Alves
//
// Based on the LDmicro software by Jonathan Westhues
// This file is part of the OpenPLC Software Stack.
//
// OpenPLC is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// OpenPLC is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with OpenPLC.  If not, see <http://www.gnu.org/licenses/>.
//------
//
// This file is the hardware layer for the OpenPLC. If you change the platform
// where it is running, you may only need to change this file. All the I/O
// related stuff is here. Basically it provides functions to read and write
// to the OpenPLC internal buffers in order to update I/O state.
// Thiago Alves, Dec 2015
//-----------------------------------------------------------------------------

#include <pthread.h>
// #include <spdlog/spdlog.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <iostream>

#include "crash_check.h"
#include "custom_layer.h"
#include "ladder.h"
#include "plc_input_simulator.h"

static BufferHistory bool_history;

extern PLCInputSimulator INPUT_PLC_DATA;

// static BufferHistory output_history;

//-----------------------------------------------------------------------------
// This function is called by the main OpenPLC routine when it is initializing.
// Hardware initialization procedures should be here.
//-----------------------------------------------------------------------------

void initializeHardware() {
    // initialize bool input and output buffers
    printf("Initializing hardware layer...\n");
    for (int i = 0; i < BUFFER_SIZE; i++) {
        byte_input[i] = new IEC_BYTE;
        int_input[i] = new IEC_UINT;
        dint_input[i] = new IEC_UDINT;
        lint_input[i] = new IEC_ULINT;
        int_memory[i] = new IEC_UINT;
        dint_memory[i] = new IEC_UDINT;
        lint_memory[i] = new IEC_ULINT;
        for (int j = 0; j < 8; j++) {
            bool_input[i][j] = new IEC_BOOL;
        }
    }

    memset(byte_input, 0, BUFFER_SIZE * sizeof(IEC_BYTE));
    memset(int_input, 0, BUFFER_SIZE * sizeof(IEC_UINT));
    memset(dint_input, 0, BUFFER_SIZE * sizeof(IEC_UDINT));
    memset(lint_input, 0, BUFFER_SIZE * sizeof(IEC_ULINT));

    memset(int_memory, 0, BUFFER_SIZE * sizeof(IEC_UINT));
    memset(dint_memory, 0, BUFFER_SIZE * sizeof(IEC_UDINT));
    memset(lint_memory, 0, BUFFER_SIZE * sizeof(IEC_ULINT));
    memset(bool_input, 0, BUFFER_SIZE * 8 * sizeof(IEC_BOOL));

    // initialize bool output buffer

    for (int i = 0; i < BUFFER_SIZE; i++) {
        byte_output[i] = new IEC_BYTE;
        int_output[i] = new IEC_UINT;
        dint_output[i] = new IEC_UDINT;
        lint_output[i] = new IEC_ULINT;

        for (int j = 0; j < 8; j++) {
            bool_output[i][j] = new IEC_BOOL;
        }
    }

    memset(byte_output, 0, BUFFER_SIZE * sizeof(IEC_BYTE));
    memset(int_output, 0, BUFFER_SIZE * sizeof(IEC_UINT));
    memset(dint_output, 0, BUFFER_SIZE * sizeof(IEC_UDINT));
    memset(lint_output, 0, BUFFER_SIZE * sizeof(IEC_ULINT));
    memset(bool_output, 0, BUFFER_SIZE * 8 * sizeof(IEC_BOOL));

    bool_history.updateBoolHistory(bool_input, bool_output);
}

//-----------------------------------------------------------------------------
// This function is called by the main OpenPLC routine when it is finalizing.
// Resource clearing procedures should be here.
//-----------------------------------------------------------------------------
void finalizeHardware() {}

//-----------------------------------------------------------------------------
// This function is called by the OpenPLC in a loop. Here the internal buffers
// must be updated to reflect the actual Input state. The mutex bufferLock
// must be used to protect access to the buffers on a threaded environment.
//-----------------------------------------------------------------------------

// 写输入数据，从标准输入中模拟

void showInput() {
    std::cout << "Input values:\n";
    for (int i = 0; i < BUFFER_SIZE; i++) {
        for (int j = 0; j < 8; j++) {
            printf("%d,%d, %hhu\n", i, j, *bool_input[i][j]);
        }
        std::cout << std::endl;
    }
}

// 旧版的updateBuffersIn，从标准输入中读取数据，并写入到bool_input中
void updateBuffersIn(int t) {
    // printf("Get input values:\n");
    pthread_mutex_lock(&bufferLock);  // lock mutex

    /*********READING AND WRITING TO I/O**************

    *bool_input[0][0] = read_digital_input(0);
    write_digital_output(0, *bool_output[0][0]);

    *int_input[0] = read_analog_input(0);
    write_analog_output(0, *int_output[0]);

    **************************************************/

    for (int i = 0; i < BUFFER_SIZE; i++) {
        for (int j = 0; j < 8; j++) {
            IEC_BOOL value;
            // std::cin>>value;
            if (scanf("%hhu", &value) != 1) {
            } else {
                printf("Input buffer: %d,%d, %hhu\n", i, j, value);
                *bool_input[i][j] = value;
            }
        }
    }

    // bool_history.updateBoolHistory(bool_input,bool_output);
    // bool_history.printHistory();

    // showInput();

    pthread_mutex_unlock(&bufferLock);  // unlock mutex
}

// 新版本的update
void updateBuffersIn() {
    // printf("Get input values:\n");
    pthread_mutex_lock(&bufferLock);  // lock mutex

    /*********READING AND WRITING TO I/O**************

    *bool_input[0][0] = read_digital_input(0);
    write_digital_output(0, *bool_output[0][0]);

    *int_input[0] = read_analog_input(0);
    write_analog_output(0, *int_output[0]);

    **************************************************/

    // 总之就是获得下一个cycle的模拟版的输入数据，并且将其写入到bool_input，模拟这是通过外设输入的数据
    BoolBlock boolblock = INPUT_PLC_DATA.get_current_block().input_bool_block;
    ByteBlock byteblock = INPUT_PLC_DATA.get_current_block().input_byte_block;
    for (int i = 0; i < BUFFER_SIZE; i++) {
        for (int j = 0; j < 8; j++) {
            *bool_input[i][j] = (IEC_BOOL)boolblock.input[i][j];
            *byte_input[i] = (IEC_BYTE)byteblock.input[i];
        }
    }

    // bool_history.updateBoolHistory(bool_input,bool_output);
    // bool_history.printHistory();

    // showInput();

    pthread_mutex_unlock(&bufferLock);  // unlock mutex
}

//-----------------------------------------------------------------------------
// This function is called by the OpenPLC in a loop. Here the internal buffers
// must be updated to reflect the actual Output state. The mutex bufferLock
// must be used to protect access to the buffers on a threaded environment.
//-----------------------------------------------------------------------------
void updateBuffersOut() {
    // printf("update output values:\n");
    pthread_mutex_lock(&bufferLock);  // lock mutex

    // printf("in mutex output values\n");

    /*********READING AND WRITING TO I/O**************

    *bool_input[0][0] = read_digital_input(0);
    write_digital_output(0, *bool_output[0][0]);

    *int_input[0] = read_analog_input(0);
    write_analog_output(0, *int_output[0]);

    **************************************************/

    // showInput();

    bool_history.updateBoolHistory(bool_input, bool_output);
    // bool_history.printHistory();

    // printf("out mutex output values\n");

    pthread_mutex_unlock(&bufferLock);  // unlock mutex

    // printf("end update output values\n");
}

bool checkOutputChange() {
    // spdlog::info("Checking output change");
    std::cout << "Checking output change" << std::endl;
    return bool_history.checkChange();
}