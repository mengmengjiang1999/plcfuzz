#include "runtime_input_application.h"

#include <cstdint>
#include <iterator>
#include <string>
#include <vector>

bool RuntimeInputApplication::load(std::istream& input, PLCInputFormat* format, std::size_t* block_count) {
    const std::string data((std::istreambuf_iterator<char>(input)), std::istreambuf_iterator<char>());
    std::vector<PLCInputBlock> blocks;
    if(!parse_plc_data(reinterpret_cast<const std::uint8_t*>(data.data()), data.size(), blocks, format)) {
        return false;
    }
    for(std::size_t index = 0; index < blocks.size(); ++index) {
        playback_.add_block(blocks[index]);
    }
    if(block_count != NULL) {
        *block_count = blocks.size();
    }
    return true;
}

PLCInputBlock RuntimeInputApplication::next_block() {
    return playback_.get_current_block();
}

RuntimeInputApplication& runtimeInputApplication() {
    static RuntimeInputApplication application;
    return application;
}
