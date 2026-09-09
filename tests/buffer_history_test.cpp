#include <assert.h>

#include "basic_buffer_history.h"

namespace {

class ByteHistoryFixture {
   public:
    ByteBufferHistory history;
    IEC_BYTE input_values[OPENPLC_BUFFER_SIZE] = {};
    IEC_BYTE output_values[OPENPLC_BUFFER_SIZE] = {};
    IEC_BYTE* input[OPENPLC_BUFFER_SIZE];
    IEC_BYTE* output[OPENPLC_BUFFER_SIZE];

    ByteHistoryFixture() {
        for (std::size_t i = 0; i < OPENPLC_BUFFER_SIZE; ++i) {
            input[i] = &input_values[i];
            output[i] = &output_values[i];
        }
    }

    void record(IEC_BYTE value) {
        output_values[0] = value;
        assert(history.update_history(input, output));
    }
};

void test_requires_two_valid_samples() {
    ByteHistoryFixture fixture;
    assert(fixture.history.sample_count() == 0);
    assert(!fixture.history.check_change());

    fixture.record(7);
    assert(fixture.history.sample_count() == 1);
    assert(!fixture.history.check_change());
}

void test_stable_and_changed_outputs() {
    ByteHistoryFixture fixture;
    fixture.record(7);
    fixture.record(7);
    assert(!fixture.history.check_change());

    fixture.record(8);
    assert(fixture.history.check_change());
}

void test_wraparound_uses_retained_chronology() {
    ByteHistoryFixture fixture;
    for (std::size_t i = 0; i < MAX_RESULTS; ++i) {
        fixture.record(0);
    }
    fixture.record(1);
    assert(fixture.history.sample_count() == MAX_RESULTS);
    assert(fixture.history.check_change());

    for (std::size_t i = 0; i < MAX_RESULTS; ++i) {
        fixture.record(1);
    }
    assert(!fixture.history.check_change());
}

void test_incomplete_mapping_does_not_advance_history() {
    ByteHistoryFixture fixture;
    fixture.record(3);
    const std::size_t samples_before = fixture.history.sample_count();
    fixture.output[5] = nullptr;

    assert(!fixture.history.update_history(fixture.input, fixture.output));
    assert(fixture.history.sample_count() == samples_before);
}

}  // namespace

int main() {
    test_requires_two_valid_samples();
    test_stable_and_changed_outputs();
    test_wraparound_uses_retained_chronology();
    test_incomplete_mapping_does_not_advance_history();
    return 0;
}
