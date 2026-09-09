#include "runtime_result_recorder.h"

#include <ostream>

#include "ladder.h"

void RuntimeResultRecorder::record(std::uint64_t cycle_time_ns, std::uint64_t sleep_latency_ns) {
    cycle_statistics_.add(cycle_time_ns);
    latency_statistics_.add(sleep_latency_ns);
    cycle_times_.push_back(cycle_time_ns);
    sleep_latencies_.push_back(sleep_latency_ns);
    if(special_functions[4] != NULL) {
        *special_functions[4] = static_cast<IEC_ULINT>(cycle_time_ns / 1000);
    }
    if(special_functions[5] != NULL) {
        *special_functions[5] = static_cast<IEC_ULINT>(sleep_latency_ns / 1000);
    }
}

void RuntimeResultRecorder::print(std::ostream& output) const {
    output << "###Summary: The maximum/minimum/average cycle time in microsecond is "
           << cycle_statistics_.maximum() / 1000 << "/" << cycle_statistics_.minimum() / 1000 << "/"
           << cycle_statistics_.average() / 1000 << '\n';
    output << "###Summary: The maximum/minimum/average latency in microsecond is "
           << latency_statistics_.maximum() / 1000 << "/" << latency_statistics_.minimum() / 1000 << "/"
           << latency_statistics_.average() / 1000 << '\n';
    output << "cycle_average = " << cycle_statistics_.average() << '\n';
    output << "latency_average = " << latency_statistics_.average() << '\n';
    output << "cycle_total = " << cycle_statistics_.total() << '\n';
    output << "latency_total = " << latency_statistics_.total() << '\n';
    for(std::size_t index = 0; index < cycle_times_.size(); ++index) {
        output << index << "," << cycle_times_[index] << "," << sleep_latencies_[index] << '\n';
    }
    output << "cycle_time_average: " << cycle_statistics_.average() << '\n';
    output << "latency_time_average: " << latency_statistics_.average() << '\n';
}

const runtime_timing::RunningStatistics& RuntimeResultRecorder::cycle_statistics() const {
    return cycle_statistics_;
}

const runtime_timing::RunningStatistics& RuntimeResultRecorder::latency_statistics() const {
    return latency_statistics_;
}
