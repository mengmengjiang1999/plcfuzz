## 1. Simulator behavior

- [x] 1.1 Make empty simulator playback fail explicitly and keep cycle transitions deterministic.
- [x] 1.2 Add unit tests for empty state, block duration, and one-step composite typed playback.

## 2. Hardware integration

- [x] 2.1 Read one complete PLC input block per hardware update.
- [x] 2.2 Route UINT and UDINT fields to their matching OpenPLC buffers.

## 3. Verification

- [x] 3.1 Extend the unit-test runner and run all dependency-light tests with warnings as errors.
- [x] 3.2 Validate the OpenSpec change and document the runtime-baseline impact.
