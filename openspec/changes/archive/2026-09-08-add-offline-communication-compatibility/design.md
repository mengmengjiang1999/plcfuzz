## Context

The MatIEC standard library includes communication function blocks whose generated C++ references `connect_to_tcp_server`, `send_tcp_message`, and `receive_tcp_message`. Static linking requires definitions even when a selected PLC program never executes those blocks. The earlier socket implementation now belongs to the archived source collection and should not return to the active offline runtime.

## Goals / Non-Goals

**Goals:**
- Make the ordinary runtime link with the current MatIEC output.
- Preserve an offline-only execution boundary.
- Give every compatibility helper a deterministic, testable result.

**Non-Goals:**
- Establish external connections.
- Send or receive data.
- Restore archived runtime code.

## Decisions

### Provide inert definitions in an active translation unit

The new source implements the exact C++ signatures declared by MatIEC and returns `-1` for every call. Arguments are intentionally unused. This satisfies the linker and communicates that the operation is unavailable.

### Test the result contract directly

A small unit test calls all three helpers with local buffers and verifies `-1`. It requires no services, ports, or external state.

## Risks / Trade-offs

- PLC inputs that actively use these communication blocks will receive an unavailable result. That is deliberate for this offline academic runtime and is documented.
