#include <assert.h>
#include <pthread.h>

#include <cerrno>
#include <cstddef>
#include <stdexcept>
#include <type_traits>

#include "plc_input_apply.h"
#include "pthread_mutex_guard.h"
#include "runtime_buffer_storage.h"

namespace {

struct RuntimePointers {
    IEC_BOOL* bool_input[OPENPLC_BUFFER_SIZE][8] = {};
    IEC_BOOL* bool_output[OPENPLC_BUFFER_SIZE][8] = {};
    IEC_BYTE* byte_input[OPENPLC_BUFFER_SIZE] = {};
    IEC_BYTE* byte_output[OPENPLC_BUFFER_SIZE] = {};
    IEC_UINT* int_input[OPENPLC_BUFFER_SIZE] = {};
    IEC_UINT* int_output[OPENPLC_BUFFER_SIZE] = {};
    IEC_UDINT* dint_input[OPENPLC_BUFFER_SIZE] = {};
    IEC_UDINT* dint_output[OPENPLC_BUFFER_SIZE] = {};
    IEC_ULINT* lint_input[OPENPLC_BUFFER_SIZE] = {};
    IEC_ULINT* lint_output[OPENPLC_BUFFER_SIZE] = {};
    IEC_UINT* int_memory[OPENPLC_BUFFER_SIZE] = {};
    IEC_UDINT* dint_memory[OPENPLC_BUFFER_SIZE] = {};
    IEC_ULINT* lint_memory[OPENPLC_BUFFER_SIZE] = {};

    void attach(RuntimeBufferStorage& storage) {
        storage.attach_missing(bool_input, bool_output, byte_input, byte_output, int_input, int_output, dint_input,
                               dint_output, lint_input, lint_output, int_memory, dint_memory, lint_memory);
    }
};

void test_fallback_storage_preserves_existing_mapping() {
    RuntimeBufferStorage storage;
    RuntimePointers pointers;
    IEC_BYTE mapped_value = 23;
    pointers.byte_input[0] = &mapped_value;

    pointers.attach(storage);
    assert(pointers.byte_input[0] == &mapped_value);
    assert(*pointers.byte_input[1] == 0);
    IEC_BYTE* const fallback_address = pointers.byte_input[1];

    pointers.attach(storage);
    assert(pointers.byte_input[1] == fallback_address);
}

void test_strong_addresses_enforce_bounds() {
    assert(PLCInputSlot::from_index(PLC_INPUT_SIZE - 1).value() == PLC_INPUT_SIZE - 1);
    assert(PLCBitOffset::from_index(7).value() == 7);

    bool slot_rejected = false;
    try {
        PLCInputSlot::from_index(PLC_INPUT_SIZE);
    } catch (const std::out_of_range&) {
        slot_rejected = true;
    }
    assert(slot_rejected);

    bool bit_rejected = false;
    try {
        PLCBitOffset::from_index(8);
    } catch (const std::out_of_range&) {
        bit_rejected = true;
    }
    assert(bit_rejected);
}

void test_input_application_preflights_all_destinations() {
    RuntimeBufferStorage storage;
    RuntimePointers pointers;
    pointers.attach(storage);

    PLCInputBlock block;
    block.input_byte_block.input[0] = 41;
    assert(applyPLCInputBlock(block, pointers.bool_input, pointers.byte_input, pointers.int_input, pointers.dint_input,
                              pointers.lint_input, pointers.int_memory, pointers.dint_memory));
    assert(*pointers.byte_input[0] == 41);

    *pointers.byte_input[0] = 7;
    pointers.dint_memory[PLC_INPUT_SIZE - 1] = nullptr;
    block.input_byte_block.input[0] = 99;
    assert(!applyPLCInputBlock(block, pointers.bool_input, pointers.byte_input, pointers.int_input, pointers.dint_input,
                               pointers.lint_input, pointers.int_memory, pointers.dint_memory));
    assert(*pointers.byte_input[0] == 7);
}

void test_mutex_guard_releases_at_scope_exit() {
    static_assert(!std::is_copy_constructible<PthreadMutexGuard>::value, "mutex guard must not be copyable");
    pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
    {
        PthreadMutexGuard guard(mutex);
        assert(pthread_mutex_trylock(&mutex) == EBUSY);
    }
    assert(pthread_mutex_trylock(&mutex) == 0);
    assert(pthread_mutex_unlock(&mutex) == 0);
    assert(pthread_mutex_destroy(&mutex) == 0);
}

}  // namespace

int main() {
    test_fallback_storage_preserves_existing_mapping();
    test_strong_addresses_enforce_bounds();
    test_input_application_preflights_all_destinations();
    test_mutex_guard_releases_at_scope_exit();
    return 0;
}
