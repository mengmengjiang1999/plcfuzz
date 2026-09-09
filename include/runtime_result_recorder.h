#pragma once

#include <cstdint>
#include <iosfwd>
#include <vector>

#include "runtime_timing.h"

class RuntimeResultRecorder {
   public:
    void record(std::uint64_t cycle_time_ns, std::uint64_t sleep_latency_ns);
    void print(std::ostream& output) const;

    const runtime_timing::RunningStatistics& cycle_statistics() const;
    const runtime_timing::RunningStatistics& latency_statistics() const;

   private:
    runtime_timing::RunningStatistics cycle_statistics_;
    runtime_timing::RunningStatistics latency_statistics_;
    std::vector<std::uint64_t> cycle_times_;
    std::vector<std::uint64_t> sleep_latencies_;
};
