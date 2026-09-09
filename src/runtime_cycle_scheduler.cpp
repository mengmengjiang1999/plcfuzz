#include "runtime_cycle_scheduler.h"

#include <cerrno>
#include <stdexcept>

#include "runtime_timing.h"

int waitUntilRuntimeDeadline(const struct timespec& deadline) {
#ifdef __linux__
    int result = 0;
    do {
        result = clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME, &deadline, NULL);
    } while(result == EINTR);
    return result;
#else
    while(true) {
        struct timespec now;
        clock_gettime(CLOCK_MONOTONIC, &now);
        if(now.tv_sec > deadline.tv_sec || (now.tv_sec == deadline.tv_sec && now.tv_nsec >= deadline.tv_nsec)) {
            return 0;
        }
        struct timespec remaining;
        remaining.tv_sec = deadline.tv_sec - now.tv_sec;
        remaining.tv_nsec = deadline.tv_nsec - now.tv_nsec;
        if(remaining.tv_nsec < 0) {
            --remaining.tv_sec;
            remaining.tv_nsec += static_cast<long>(runtime_timing::kNanosecondsPerSecond);
        }
        if(nanosleep(&remaining, NULL) != 0 && errno != EINTR) {
            return errno;
        }
    }
#endif
}

RuntimeCycleScheduler::RuntimeCycleScheduler(std::uint64_t cycle_delay_ns) : cycle_delay_ns_(cycle_delay_ns) {
    deadline_.tv_sec = 0;
    deadline_.tv_nsec = 0;
}

void RuntimeCycleScheduler::start() {
    if(clock_gettime(CLOCK_MONOTONIC, &deadline_) != 0) {
        throw std::runtime_error("clock_gettime failed");
    }
}

RuntimeCycleTiming RuntimeCycleScheduler::finish_cycle(const struct timespec& cycle_start) {
    struct timespec cycle_end;
    if(clock_gettime(CLOCK_MONOTONIC, &cycle_end) != 0) {
        throw std::runtime_error("clock_gettime failed");
    }
    RuntimeCycleTiming result = {runtime_timing::elapsed_nanoseconds(cycle_end, cycle_start), 0};
    if(cycle_delay_ns_ != 0) {
        runtime_timing::add_nanoseconds(&deadline_, cycle_delay_ns_);
        if(waitUntilRuntimeDeadline(deadline_) != 0) {
            throw std::runtime_error("clock_nanosleep failed");
        }
        struct timespec wake_time;
        if(clock_gettime(CLOCK_MONOTONIC, &wake_time) != 0) {
            throw std::runtime_error("clock_gettime failed");
        }
        result.sleep_latency_ns = runtime_timing::elapsed_nanoseconds(wake_time, deadline_);
    }
    return result;
}
