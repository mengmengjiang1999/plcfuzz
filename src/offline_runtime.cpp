//-----------------------------------------------------------------------------
// Copyright 2018 Thiago Alves
// This file is part of the OpenPLC Software Stack.
//
// OpenPLC is free software: you can redistribute it and/or modify it under the
// terms of the GNU General Public License as published by the Free Software
// Foundation, either version 3 of the License, or (at your option) any later
// version.
//-----------------------------------------------------------------------------

#include "offline_runtime.h"

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <time.h>

#include <cstdint>
#include <fstream>
#include <iostream>
#include <stdexcept>

#include "ladder.h"
#include "plc_input_format.h"
#include "pthread_mutex_guard.h"
#include "runtime_cycle_scheduler.h"
#include "runtime_input_application.h"
#include "runtime_result_recorder.h"
#include "runtime_support.h"
#include "runtime_timing.h"
#ifdef _ethercat_src
#include "ethercat_src.h"
#endif

namespace {

bool execute_cycle() {
    glueVars();
    updateBuffersIn();

    bool continue_running = true;
    {
        PthreadMutexGuard lock(bufferLock);
#ifdef _ethercat_src
        if(ethercat_callcyclic(BUFFER_SIZE,
                               bool_input_call_back,
                               bool_output_call_back,
                               byte_input_call_back,
                               byte_output_call_back,
                               int_input_call_back,
                               int_output_call_back,
                               dint_input_call_back,
                               dint_output_call_back,
                               lint_input_call_back,
                               lint_output_call_back)) {
            printf("EtherCAT cyclic failed\n");
            continue_running = false;
        }
#endif
        if(continue_running) {
            updateCustomIn();
            handleSpecialFunctions();
            config_run__(runtime_tick++);
            updateCustomOut();
        }
    }
    if(!continue_running) {
        return false;
    }
    updateBuffersOut();
    updateTime();
    return true;
}

void configure_runtime_platform() {
#ifdef __linux__
    struct sched_param parameters;
    parameters.sched_priority = 50;
    printf("Setting main thread priority to RT\n");
    const int result = pthread_setschedparam(pthread_self(), SCHED_FIFO, &parameters);
    if(result != 0) {
        printf("pthread_setschedparam failed: %d\n", result);
        printf("WARNING: Failed to set main thread to real-time priority\n");
    }
    printf("Locking main thread memory\n");
    if(mlockall(MCL_FUTURE | MCL_CURRENT)) {
        printf("WARNING: Failed to lock memory\n");
    }
#endif
}

bool load_input_file(const char* path, PLCInputFormat* format, std::size_t* block_count) {
    std::ifstream input(path);
    if(!input) {
        fprintf(stderr, "Failed to open input file: %s\n", path);
        return false;
    }
    if(!runtimeInputApplication().load(input, format, block_count)) {
        fprintf(stderr, "Input does not follow a supported PLC data format: %s\n", path);
        return false;
    }
    return true;
}

}  // namespace

namespace offline_runtime {

int run(int argc, char** argv) {
    setvbuf(stdin, NULL, _IONBF, 0);
    setvbuf(stdout, NULL, _IONBF, 0);

    char log_message[1000];
    snprintf(log_message, sizeof(log_message), "OpenPLC Runtime starting...\n");
    log(log_message);
    if(argc < 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    runtime_timing::Config timing_config = {0, 0};
    try {
        timing_config = runtime_timing::load_config();
    } catch(const std::exception& error) {
        std::cerr << "Invalid runtime timing configuration: " << error.what() << std::endl;
        return 1;
    }
    std::cout << "Configured cycles: " << timing_config.cycle_count
              << ", wall-clock cycle delay: " << timing_config.cycle_delay_ns << " ns" << std::endl;

    PLCInputFormat input_format = PLCInputFormat::Legacy;
    std::size_t block_count = 0;
    if(!load_input_file(argv[1], &input_format, &block_count)) {
        return 1;
    }
    printf("Input format: %s; total blocks: %zu\n",
           input_format == PLCInputFormat::V1 ? "V1" : "legacy-compatible",
           block_count);

    tzset();
    time(&start_time);
    config_init__();
    glueVars();
    if(pthread_mutex_init(&bufferLock, NULL) != 0) {
        fprintf(stderr, "Mutex init failed\n");
        return 1;
    }

#ifdef _ethercat_src
    type_logger_callback logger = logger_callback;
    ethercat_configure("../utils/ethercat_src/build/ethercat.cfg", logger);
#endif
    initializeHardware();
    updateBuffersIn();
    updateCustomIn();
    updateBuffersOut();
    updateCustomOut();
    glueVars();
    mapUnusedIO();
    configure_runtime_platform();

    printf("Getting current time\n");
    RuntimeCycleScheduler scheduler(timing_config.cycle_delay_ns);
    RuntimeResultRecorder recorder;
    scheduler.start();
    for(std::uint64_t cycle = 0; cycle < timing_config.cycle_count; ++cycle) {
        struct timespec cycle_start;
        if(clock_gettime(CLOCK_MONOTONIC, &cycle_start) != 0) {
            throw std::runtime_error("clock_gettime failed");
        }
        if(!execute_cycle()) {
            break;
        }
        const RuntimeCycleTiming timing = scheduler.finish_cycle(cycle_start);
        recorder.record(timing.cycle_time_ns, timing.sleep_latency_ns);
    }
    recorder.print(std::cout);

#ifdef _ethercat_src
    ethercat_terminate_src();
#endif
    if(checkOutputChange()) {
        std::cerr << "Output-change candidate detected; ending this run for AFL sample collection." << std::endl;
        std::abort();
    }
    printf("No output-change candidate detected, shutting down OpenPLC Runtime...\n");
    printf("Disabling outputs\n");
    disableOutputs();
    updateCustomOut();
    updateBuffersOut();
    finalizeHardware();
    printf("Shutting down OpenPLC Runtime...\n");
    return 0;
}

}  // namespace offline_runtime
