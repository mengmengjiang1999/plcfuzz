#include <cassert>
#include <cstdlib>
#include <stdexcept>
#include <string>

#include "runtime_timing.h"

namespace {

class EnvironmentGuard {
   public:
    explicit EnvironmentGuard(const char* name) : name_(name), existed_(false) {
        const char* value = std::getenv(name);
        if(value != NULL) {
            existed_ = true;
            value_ = value;
        }
    }

    ~EnvironmentGuard() {
        if(existed_) {
            setenv(name_.c_str(), value_.c_str(), 1);
        } else {
            unsetenv(name_.c_str());
        }
    }

   private:
    std::string name_;
    bool existed_;
    std::string value_;
};

void expect_invalid_config() {
    bool rejected = false;
    try {
        runtime_timing::load_config();
    } catch(const std::invalid_argument&) {
        rejected = true;
    }
    assert(rejected);
}

}  // namespace

int main() {
    EnvironmentGuard count_guard("PLC_LAB_CYCLE_COUNT");
    EnvironmentGuard delay_guard("PLC_LAB_CYCLE_DELAY_NS");
    EnvironmentGuard legacy_count_guard("PLCFUZZ_CYCLE_COUNT");
    EnvironmentGuard legacy_delay_guard("PLCFUZZ_CYCLE_DELAY_NS");

    unsetenv("PLC_LAB_CYCLE_COUNT");
    unsetenv("PLC_LAB_CYCLE_DELAY_NS");
    unsetenv("PLCFUZZ_CYCLE_COUNT");
    unsetenv("PLCFUZZ_CYCLE_DELAY_NS");
    runtime_timing::Config config = runtime_timing::load_config();
    assert(config.cycle_count == 100);
    assert(config.cycle_delay_ns == 0);

    setenv("PLC_LAB_CYCLE_COUNT", "250", 1);
    setenv("PLC_LAB_CYCLE_DELAY_NS", "50000000", 1);
    config = runtime_timing::load_config();
    assert(config.cycle_count == 250);
    assert(config.cycle_delay_ns == 50000000);

    unsetenv("PLC_LAB_CYCLE_COUNT");
    unsetenv("PLC_LAB_CYCLE_DELAY_NS");
    setenv("PLCFUZZ_CYCLE_COUNT", "125", 1);
    setenv("PLCFUZZ_CYCLE_DELAY_NS", "25000000", 1);
    config = runtime_timing::load_config();
    assert(config.cycle_count == 125);
    assert(config.cycle_delay_ns == 25000000);
    unsetenv("PLCFUZZ_CYCLE_COUNT");
    unsetenv("PLCFUZZ_CYCLE_DELAY_NS");
    setenv("PLC_LAB_CYCLE_COUNT", "250", 1);
    setenv("PLC_LAB_CYCLE_DELAY_NS", "50000000", 1);

    setenv("PLC_LAB_CYCLE_COUNT", "0", 1);
    expect_invalid_config();
    setenv("PLC_LAB_CYCLE_COUNT", "12cycles", 1);
    expect_invalid_config();
    setenv("PLC_LAB_CYCLE_COUNT", "", 1);
    expect_invalid_config();
    setenv("PLC_LAB_CYCLE_COUNT", "100", 1);
    setenv("PLC_LAB_CYCLE_DELAY_NS", "-1", 1);
    expect_invalid_config();

    struct timespec deadline = {7, 900000000};
    runtime_timing::add_nanoseconds(&deadline, 250000000);
    assert(deadline.tv_sec == 8);
    assert(deadline.tv_nsec == 150000000);

    const struct timespec start = {3, 900000000};
    const struct timespec end = {5, 100000000};
    assert(runtime_timing::elapsed_nanoseconds(end, start) == 1200000000ULL);
    assert(runtime_timing::elapsed_nanoseconds(start, end) == 0);
    assert(runtime_timing::elapsed_nanoseconds(start, start) == 0);

    runtime_timing::RunningStatistics statistics;
    assert(statistics.count() == 0);
    assert(statistics.minimum() == 0);
    assert(statistics.maximum() == 0);
    assert(statistics.average() == 0);
    statistics.add(30);
    statistics.add(10);
    statistics.add(20);
    assert(statistics.count() == 3);
    assert(statistics.total() == 60);
    assert(statistics.minimum() == 10);
    assert(statistics.maximum() == 30);
    assert(statistics.average() == 20);

    return 0;
}
