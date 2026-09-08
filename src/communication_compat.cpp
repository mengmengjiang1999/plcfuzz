#include <cstddef>
#include <cstdint>

#include "openplc_networking.h"

int connect_to_tcp_server(uint8_t *ip_address, uint16_t port, int method) {
    (void)ip_address;
    (void)port;
    (void)method;
    return -1;
}

int send_tcp_message(uint8_t *msg, size_t msg_size, int socket_id) {
    (void)msg;
    (void)msg_size;
    (void)socket_id;
    return -1;
}

int receive_tcp_message(uint8_t *msg_buffer, size_t buffer_size, int socket_id) {
    (void)msg_buffer;
    (void)buffer_size;
    (void)socket_id;
    return -1;
}
