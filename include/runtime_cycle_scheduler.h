#pragma once

#include <cstdint>
#include <time.h>

struct RuntimeCycleTiming {
    std::uint64_t cycle_time_ns;
    std::uint64_t sleep_latency_ns;
};

class RuntimeCycleScheduler {
   public:
    explicit RuntimeCycleScheduler(std::uint64_t cycle_delay_ns);
    void start();
    RuntimeCycleTiming finish_cycle(const struct timespec& cycle_start);

   private:
    std::uint64_t cycle_delay_ns_;
    struct timespec deadline_;
};

int waitUntilRuntimeDeadline(const struct timespec& deadline);
