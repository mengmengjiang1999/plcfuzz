## Why

The hardware input update currently requests a complete simulated PLC block once per field group, advancing the simulator multiple times in one PLC cycle. It also sources both 16-bit and 32-bit integer inputs from the DINT block, so fuzz inputs are not applied with their intended timing or types.

## What Changes

- Read exactly one complete `PLCInputBlock` snapshot during each hardware input update.
- Route each input and memory field from its matching typed block.
- Define and test the cycle-count transition behavior of the PLC input simulator.
- Add regression coverage showing that BOOL, BYTE, UINT, UDINT, ULINT, UINT memory, and UDINT memory streams each advance once per runtime cycle.

## Capabilities

### New Capabilities

- `plc-input-playback`: Defines one-step, type-correct playback of independently timed PLC input streams across runtime cycles.

### Modified Capabilities

None.

## Impact

- Affects `PLCInputSimulator`, `InputDataSimulator`, and the hardware-layer input update path.
- Adds a focused C++ unit test and extends the local unit-test runner.
- Does not change the serialized fuzz input format or the MatIEC interface.
