#pragma once

#include <cstddef>
#include <istream>

#include "plc_input_block.h"
#include "plc_input_format.h"
#include "plc_input_simulator.h"

class RuntimeInputApplication {
   public:
    bool load(std::istream& input, PLCInputFormat* format, std::size_t* block_count);
    PLCInputBlock next_block();

   private:
    PLCInputSimulator playback_;
};

RuntimeInputApplication& runtimeInputApplication();
