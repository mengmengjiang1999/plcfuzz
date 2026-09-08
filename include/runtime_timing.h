#ifndef RUNTIME_TIMING_H
#define RUNTIME_TIMING_H

#include <cerrno>
#include <cstdint>
#include <cstdlib>
#include <limits>
#include <stdexcept>
#include <string>
#include <time.h>

namespace runtime_timing {

static const std::uint64_t kNanosecondsPerSecond = 1000000000ULL;

struct Config {
    std::uint64_t cycle_count;
    std::uint64_t cycle_delay_ns;
};

inline std::uint64_t parse_unsigned_environment(const char* name,
                                                std::uint64_t default_value,
                                                std::uint64_t minimum) {
    const char* raw_value = std::getenv(name);
    if(raw_value == NULL) {
        return default_value;
    }

    if(raw_value[0] == '-') {
        throw std::invalid_argument(std::string(name) + " must be an unsigned integer");
    }

    errno = 0;
    char* end = NULL;
    const unsigned long long parsed = std::strtoull(raw_value, &end, 10);
    if(errno == ERANGE || end == raw_value || *end != '\0' || parsed < minimum) {
        throw std::invalid_argument(std::string("invalid value for ") + name + ": " + raw_value);
    }
    return static_cast<std::uint64_t>(parsed);
}

inline Config load_config() {
    Config config;
    config.cycle_count = parse_unsigned_environment("PLCFUZZ_CYCLE_COUNT", 100, 1);
    config.cycle_delay_ns = parse_unsigned_environment("PLCFUZZ_CYCLE_DELAY_NS", 0, 0);
    return config;
}

inline void add_nanoseconds(struct timespec* value, std::uint64_t nanoseconds) {
    std::uint64_t seconds = nanoseconds / kNanosecondsPerSecond;
    const std::uint64_t remainder = nanoseconds % kNanosecondsPerSecond;
    const bool carry = static_cast<std::uint64_t>(value->tv_nsec) + remainder >= kNanosecondsPerSecond;
    if(carry) {
        if(seconds == std::numeric_limits<std::uint64_t>::max()) {
            throw std::overflow_error("absolute timing deadline overflow");
        }
        ++seconds;
    }
    if(seconds > static_cast<std::uint64_t>(std::numeric_limits<time_t>::max()) ||
       value->tv_sec > std::numeric_limits<time_t>::max() - static_cast<time_t>(seconds)) {
        throw std::overflow_error("absolute timing deadline overflow");
    }

    value->tv_sec += static_cast<time_t>(seconds);
    value->tv_nsec = static_cast<long>((static_cast<std::uint64_t>(value->tv_nsec) + remainder) %
                                      kNanosecondsPerSecond);
}

inline std::uint64_t elapsed_nanoseconds(const struct timespec& later, const struct timespec& earlier) {
    if(later.tv_sec < earlier.tv_sec ||
       (later.tv_sec == earlier.tv_sec && later.tv_nsec <= earlier.tv_nsec)) {
        return 0;
    }

    std::uint64_t seconds = static_cast<std::uint64_t>(later.tv_sec - earlier.tv_sec);
    long nanoseconds = later.tv_nsec - earlier.tv_nsec;
    if(nanoseconds < 0) {
        --seconds;
        nanoseconds += static_cast<long>(kNanosecondsPerSecond);
    }
    if(seconds > (std::numeric_limits<std::uint64_t>::max() - static_cast<std::uint64_t>(nanoseconds)) /
                     kNanosecondsPerSecond) {
        throw std::overflow_error("elapsed timing interval overflow");
    }
    return seconds * kNanosecondsPerSecond + static_cast<std::uint64_t>(nanoseconds);
}

class RunningStatistics {
   public:
    RunningStatistics() : count_(0), total_(0), minimum_(0), maximum_(0) {}

    void add(std::uint64_t sample) {
        if(sample > std::numeric_limits<std::uint64_t>::max() - total_) {
            throw std::overflow_error("timing statistics total overflow");
        }
        if(count_ == 0 || sample < minimum_) {
            minimum_ = sample;
        }
        if(count_ == 0 || sample > maximum_) {
            maximum_ = sample;
        }
        ++count_;
        total_ += sample;
    }

    std::uint64_t count() const { return count_; }
    std::uint64_t total() const { return total_; }
    std::uint64_t minimum() const { return minimum_; }
    std::uint64_t maximum() const { return maximum_; }
    std::uint64_t average() const { return count_ == 0 ? 0 : total_ / count_; }

   private:
    std::uint64_t count_;
    std::uint64_t total_;
    std::uint64_t minimum_;
    std::uint64_t maximum_;
};

}  // namespace runtime_timing

#endif  // RUNTIME_TIMING_H
