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
#include <stdexcept>

#include "buffer_history.h"
#include "custom_layer.h"
#include "ladder.h"
#include "plc_input_apply.h"
#include "plc_input_simulator.h"
#include "pthread_mutex_guard.h"
#include "runtime_buffer_storage.h"

static BufferHistory io_history;
static RuntimeBufferStorage runtime_buffer_storage;

extern PLCInputSimulator INPUT_PLC_DATA;

// static BufferHistory output_history;

//-----------------------------------------------------------------------------
// This function is called by the main OpenPLC routine when it is initializing.
// Hardware initialization procedures should be here.
//-----------------------------------------------------------------------------

void initializeHardware() {
    printf("Initializing hardware layer...\n");
    runtime_buffer_storage.attach_missing(bool_input, bool_output, byte_input, byte_output, int_input, int_output,
                                          dint_input, dint_output, lint_input, lint_output, int_memory, dint_memory,
                                          lint_memory);

    std::cout << "Initializing hardware layer done." << std::endl;

    // std::cout<<"bool_input"<<std::endl;
    // for (int i = 0; i < BUFFER_SIZE; i++) {
    //     for (int j = 0; j < 8; j++) {
    //         std::cout<<static_cast<uint32_t>(*bool_input[i][j])<<" ";
    //     }std::cout<<std::endl;
    // }

    if (!io_history.updateHistory(bool_input, bool_output, byte_input, byte_output, int_input, int_output, dint_input,
                                  dint_output, lint_input, lint_output, int_memory, int_memory, dint_memory,
                                  dint_memory)) {
        throw std::runtime_error("runtime buffer mapping is incomplete during initialization");
    }
    // io_history.updateBoolHistory(bool_input, bool_output);
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

void showInput() {
    std::cout << "Input values:\n";
    for (int i = 0; i < BUFFER_SIZE; i++) {
        for (int j = 0; j < 8; j++) {
            printf("%d,%d, %hhu\n", i, j, *bool_input[i][j]);
        }
        std::cout << std::endl;
    }
}

void updateBuffersIn() {
    // printf("Get input values:\n");
    PthreadMutexGuard lock(bufferLock);

    // Advance every independently timed input stream exactly once per PLC cycle,
    // then apply the resulting composite snapshot to the OpenPLC buffers.
    const PLCInputBlock block = INPUT_PLC_DATA.get_current_block();
    if (!applyPLCInputBlock(block, bool_input, byte_input, int_input, dint_input, lint_input, int_memory, dint_memory)) {
        throw std::runtime_error("runtime input mapping is incomplete");
    }
}

//-----------------------------------------------------------------------------
// This function is called by the OpenPLC in a loop. Here the internal buffers
// must be updated to reflect the actual Output state. The mutex bufferLock
// must be used to protect access to the buffers on a threaded environment.
//-----------------------------------------------------------------------------
void updateBuffersOut() {
    // printf("update output values:\n");
    // std::cout << "UpdateBuffersOut :\n";
    PthreadMutexGuard lock(bufferLock);

    // 经过程序执行，output这些数组里面已经存了本周期的运行结果。
    // 此时将output这些数组里面的内容给保存到当前的BufferHistory里面，以便于后续进行进一步的比较
    if (!io_history.updateHistory(bool_input, bool_output, byte_input, byte_output, int_input, int_output, dint_input,
                                  dint_output, lint_input, lint_output, int_memory, int_memory, dint_memory,
                                  dint_memory)) {
        throw std::runtime_error("runtime history mapping is incomplete");
    }
    // io_history.updateBoolHistory(bool_input, bool_output);

}

bool checkOutputChange() {
    std::cout << "Checking output change" << std::endl;
    return io_history.checkChange();
}
