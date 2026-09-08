## Why

PLCFuzz currently declares OpenPLC I/O arrays as 8 entries while the generated `glueVars.cpp` defines the same linked arrays as 1024 entries. The value 8 actually describes the compact fuzz input model, so one shared `BUFFER_SIZE` creates incompatible declarations and obscures two different concepts.

## What Changes

- Restore the OpenPLC runtime I/O capacity to the generator-compatible 1024 entries.
- Introduce a distinct 8-entry fuzz input capacity without changing seeds or grammar.
- Apply fuzz snapshots only to modeled input slots while initializing and tracking the complete runtime I/O image.
- Rename unrelated interactive-server command storage so it does not redefine `BUFFER_SIZE`.
- Add compile-time and unit-test coverage for both capacities.

## Capabilities

### New Capabilities

- `plc-buffer-model`: Defines separate, compatible capacities for the OpenPLC runtime image and the compact fuzz input model.

### Modified Capabilities

- `plc-input-playback`: Limits snapshot application to modeled fuzz input slots while keeping the complete runtime buffer valid.

## Impact

- Affects shared I/O declarations, input-block serialization, history storage, hardware initialization, mutator bounds, and tests.
- Preserves the existing 8-slot textual fuzz format.
- Increases runtime/history storage to match OpenPLC's generated 1024-entry arrays.
