#include "runtime_state_observer.h"

#include <stdexcept>

#include "ladder.h"

namespace {

bool update_history(BufferHistory& history) {
    return history.updateHistory(bool_input, bool_output, byte_input, byte_output, int_input, int_output, dint_input,
                                 dint_output, lint_input, lint_output, int_memory, int_memory, dint_memory,
                                 dint_memory);
}

}  // namespace

void RuntimeStateObserver::initialize() {
    if(!update_history(history_)) {
        throw std::runtime_error("runtime buffer mapping is incomplete during initialization");
    }
}

void RuntimeStateObserver::observe() {
    if(!update_history(history_)) {
        throw std::runtime_error("runtime history mapping is incomplete");
    }
}

bool RuntimeStateObserver::output_changed() {
    return history_.checkChange();
}

RuntimeStateObserver& runtimeStateObserver() {
    static RuntimeStateObserver observer;
    return observer;
}
