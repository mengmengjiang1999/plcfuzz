#include <cassert>
#include <cstring>
#include <pthread.h>

#include "ladder.h"

IEC_BOOL* bool_input[BUFFER_SIZE][8] = {};
IEC_BOOL* bool_output[BUFFER_SIZE][8] = {};
IEC_BYTE* byte_input[BUFFER_SIZE] = {};
IEC_BYTE* byte_output[BUFFER_SIZE] = {};
IEC_UINT* int_input[BUFFER_SIZE] = {};
IEC_UINT* int_output[BUFFER_SIZE] = {};
IEC_UDINT* dint_input[BUFFER_SIZE] = {};
IEC_UDINT* dint_output[BUFFER_SIZE] = {};
IEC_ULINT* lint_input[BUFFER_SIZE] = {};
IEC_ULINT* lint_output[BUFFER_SIZE] = {};
IEC_UINT* int_memory[BUFFER_SIZE] = {};
IEC_UDINT* dint_memory[BUFFER_SIZE] = {};
IEC_ULINT* lint_memory[BUFFER_SIZE] = {};
IEC_ULINT* special_functions[BUFFER_SIZE] = {};
pthread_mutex_t bufferLock;

void clear_message(unsigned char* buffer, std::size_t size, unsigned char function_code) {
    std::memset(buffer, 0, size);
    buffer[7] = function_code;
}

int main() {
    assert(pthread_mutex_init(&bufferLock, NULL) == 0);
    mapUnusedIO();
    assert(bool_output[0][0] != NULL);
    assert(int_output[0] != NULL);

    unsigned char buffer[32];
    clear_message(buffer, sizeof(buffer), 99);
    assert(processModbusMessage(buffer, 8) == 9);
    assert(buffer[7] == static_cast<unsigned char>(99 | 0x80));
    assert(buffer[8] == 1);

    *bool_output[0][0] = 1;
    clear_message(buffer, sizeof(buffer), 1);
    buffer[11] = 1;
    assert(processModbusMessage(buffer, 12) == 10);
    assert(buffer[8] == 1);
    assert((buffer[9] & 1U) == 1U);

    clear_message(buffer, sizeof(buffer), 6);
    buffer[10] = 0x12;
    buffer[11] = 0x34;
    assert(processModbusMessage(buffer, 12) == 12);
    assert(*int_output[0] == 0x1234);

    clear_message(buffer, sizeof(buffer), 4);
    buffer[11] = 1;
    *int_input[0] = 0x5678;
    assert(processModbusMessage(buffer, 12) == 11);
    assert(buffer[8] == 2);
    assert(buffer[9] == 0x56);
    assert(buffer[10] == 0x78);

    pthread_mutex_destroy(&bufferLock);
    return 0;
}
