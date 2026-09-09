#include "runtime_support.h"

#include <pthread.h>
#include <stdio.h>
#include <time.h>

#include "ladder.h"

IEC_BOOL __DEBUG;
IEC_LINT cycle_counter = 0;
unsigned long runtime_tick = 0;
pthread_mutex_t bufferLock;
pthread_mutex_t logLock;
uint8_t run_openplc = 1;
unsigned char log_buffer[1000000];
int log_index = 0;
int log_counter = 0;

void log(char* message) {
    pthread_mutex_lock(&logLock);
    printf("%s", message);
    for(int index = 0; message[index] != '\0'; ++index) {
        log_buffer[log_index] = static_cast<unsigned char>(message[index]);
        ++log_index;
        log_buffer[log_index] = '\0';
    }
    ++log_counter;
    if(log_counter >= 1000) {
        log_counter = 0;
        log_index = 0;
    }
    pthread_mutex_unlock(&logLock);
}

bool pinNotPresent(int* ignored_vector, int vector_size, int pin_number) {
    for(int index = 0; index < vector_size; ++index) {
        if(ignored_vector[index] == pin_number) {
            return false;
        }
    }
    return true;
}

void disableOutputs() {
    for(int index = 0; index < BUFFER_SIZE; ++index) {
        for(int bit = 0; bit < 8; ++bit) {
            if(bool_output[index][bit] != NULL) {
                *bool_output[index][bit] = 0;
            }
        }
        if(byte_output[index] != NULL) {
            *byte_output[index] = 0;
        }
        if(int_output[index] != NULL) {
            *int_output[index] = 0;
        }
    }
}

void handleSpecialFunctions() {
    time_t raw_time;
    time(&raw_time);
    if(special_functions[3] != NULL) {
        *special_functions[3] = raw_time;
    }
    struct tm* current_time = localtime(&raw_time);
    raw_time = raw_time - timezone;
    if(current_time->tm_isdst > 0) {
        raw_time = raw_time + 3600;
    }
    if(special_functions[0] != NULL) {
        *special_functions[0] = raw_time;
    }
    ++cycle_counter;
    if(special_functions[1] != NULL) {
        *special_functions[1] = cycle_counter;
    }
}

std::uint8_t* bool_input_call_back(int array_index, int bit_index) {
    return bool_input[array_index][bit_index];
}
std::uint8_t* bool_output_call_back(int array_index, int bit_index) {
    return bool_output[array_index][bit_index];
}
std::uint8_t* byte_input_call_back(int array_index) {
    return byte_input[array_index];
}
std::uint8_t* byte_output_call_back(int array_index) {
    return byte_output[array_index];
}
std::uint16_t* int_input_call_back(int array_index) {
    return int_input[array_index];
}
std::uint16_t* int_output_call_back(int array_index) {
    return int_output[array_index];
}
std::uint32_t* dint_input_call_back(int array_index) {
    return dint_input[array_index];
}
std::uint32_t* dint_output_call_back(int array_index) {
    return dint_output[array_index];
}
std::uint64_t* lint_input_call_back(int array_index) {
    return lint_input[array_index];
}
std::uint64_t* lint_output_call_back(int array_index) {
    return lint_output[array_index];
}
void logger_callback(char* message) {
    log(message);
}
