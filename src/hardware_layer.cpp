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

#include <stdexcept>

#include "custom_layer.h"
#include "ladder.h"
#include "plc_input_apply.h"
#include "pthread_mutex_guard.h"
#include "runtime_buffer_storage.h"
#include "runtime_input_application.h"
#include "runtime_state_observer.h"

static RuntimeBufferStorage runtime_buffer_storage;

//-----------------------------------------------------------------------------
// This function is called by the main OpenPLC routine when it is initializing.
// Hardware initialization procedures should be here.
//-----------------------------------------------------------------------------

void initializeHardware() {
    printf("Initializing hardware layer...\n");
    runtime_buffer_storage.attach_missing(bool_input, bool_output, byte_input, byte_output, int_input, int_output,
                                          dint_input, dint_output, lint_input, lint_output, int_memory, dint_memory,
                                          lint_memory);

    runtimeStateObserver().initialize();
    printf("Initializing hardware layer done.\n");
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

void updateBuffersIn() {
    PthreadMutexGuard lock(bufferLock);
    const PLCInputBlock block = runtimeInputApplication().next_block();
    if(!applyPLCInputBlock(block, bool_input, byte_input, int_input, dint_input, lint_input, int_memory, dint_memory)) {
        throw std::runtime_error("runtime input mapping is incomplete");
    }
}

//-----------------------------------------------------------------------------
// This function is called by the OpenPLC in a loop. Here the internal buffers
// must be updated to reflect the actual Output state. The mutex bufferLock
// must be used to protect access to the buffers on a threaded environment.
//-----------------------------------------------------------------------------
void updateBuffersOut() {
    PthreadMutexGuard lock(bufferLock);
    runtimeStateObserver().observe();
}

bool checkOutputChange() {
    printf("Checking output change\n");
    return runtimeStateObserver().output_changed();
}
