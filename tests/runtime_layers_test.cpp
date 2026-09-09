#include <cassert>
#include <sstream>
#include <string>

#include "ladder.h"
#include "plc_input_format.h"
#include "runtime_cycle_scheduler.h"
#include "runtime_input_application.h"
#include "runtime_result_recorder.h"

IEC_ULINT* special_functions[BUFFER_SIZE] = {};

int main() {
    PLCInputBlock block;
    block.input_bool_block.cycles = 1;
    block.input_byte_block.cycles = 1;
    block.input_int_block.cycles = 1;
    block.input_dint_block.cycles = 1;
    block.input_lint_block.cycles = 1;
    block.input_int_mem_block.cycles = 1;
    block.input_dint_mem_block.cycles = 1;
    block.input_int_block.input[0] = 42;

    std::stringstream serialized(serialize_plc_data(std::vector<PLCInputBlock>(1, block)));
    RuntimeInputApplication application;
    PLCInputFormat format = PLCInputFormat::Legacy;
    std::size_t count = 0;
    assert(application.load(serialized, &format, &count));
    assert(format == PLCInputFormat::V1);
    assert(count == 1);
    assert(application.next_block().input_int_block.input[0] == 42);

    std::stringstream invalid("not-a-supported-input");
    RuntimeInputApplication invalid_application;
    assert(!invalid_application.load(invalid, &format, &count));

    RuntimeCycleScheduler scheduler(0);
    scheduler.start();
    struct timespec cycle_start;
    assert(clock_gettime(CLOCK_MONOTONIC, &cycle_start) == 0);
    const RuntimeCycleTiming timing = scheduler.finish_cycle(cycle_start);
    assert(timing.sleep_latency_ns == 0);

    IEC_ULINT cycle_value = 0;
    IEC_ULINT latency_value = 0;
    special_functions[4] = &cycle_value;
    special_functions[5] = &latency_value;
    RuntimeResultRecorder recorder;
    recorder.record(1000, 2000);
    recorder.record(3000, 0);
    assert(recorder.cycle_statistics().count() == 2);
    assert(recorder.cycle_statistics().average() == 2000);
    assert(recorder.latency_statistics().total() == 2000);
    assert(cycle_value == 3);
    assert(latency_value == 0);
    std::ostringstream output;
    recorder.print(output);
    assert(output.str().find("cycle_total = 4000") != std::string::npos);
    assert(output.str().find("0,1000,2000") != std::string::npos);
    return 0;
}
