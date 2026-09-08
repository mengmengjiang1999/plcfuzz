#include <cassert>
#include <cstddef>
#include <cstdint>

#include "openplc_networking.h"

int main() {
    uint8_t address[4] = {127, 0, 0, 1};
    uint8_t buffer[4] = {0, 0, 0, 0};

    assert(connect_to_tcp_server(address, 0, 0) == -1);
    assert(send_tcp_message(buffer, sizeof(buffer), -1) == -1);
    assert(receive_tcp_message(buffer, sizeof(buffer), -1) == -1);
    return 0;
}
