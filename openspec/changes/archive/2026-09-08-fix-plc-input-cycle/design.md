## Context

`PLCInputSimulator` stores each field group in a separate `InputDataSimulator`, because the serialized format gives each type its own cycle count. Its `get_current_block()` method advances every typed stream once and combines their current values into a complete snapshot. The hardware layer currently calls that stateful method once for each field it wants, so one runtime cycle consumes multiple steps from every typed stream.

## Goals / Non-Goals

**Goals:**

- Make one runtime input update correspond to exactly one simulator step.
- Preserve independently timed typed streams while advancing each of them once per runtime cycle.
- Route UINT and UDINT inputs through their distinct field groups.
- Lock the behavior with dependency-light unit tests.

**Non-Goals:**

- Change the serialized input format or grammar.
- Change cycle semantics beyond making the current transition rule explicit.
- Refactor hardware buffer ownership or the race-detection oracle.

## Decisions

- The hardware layer will call `PLCInputSimulator::get_current_block()` once and retain the returned value for all assignments. This is smaller and safer than exposing seven independent stateful getters.
- `PLCInputSimulator` will continue advancing each typed simulator once per snapshot. A unit test will use distinct per-type cycle counts to verify that no stream advances more than once per runtime cycle.
- `InputDataSimulator::get_current_block()` will reject empty playback state with a standard exception instead of indexing an empty vector. The runtime parser already prevents this path, while the explicit failure makes isolated use testable.
- The test runner will compile separate small binaries so no OpenPLC protocol libraries are required for simulator regression tests.

## Risks / Trade-offs

- [Existing findings may depend on the accidental multi-step behavior] → Treat result comparisons across this change as a new runtime baseline and record the commit.
- [Cycle-count expectations may have been implicit] → Specify and test that a block with cycle count N is returned N times before advancing, while a zero-cycle block advances after its first return.
- [Hardware-layer compilation needs external OpenPLC libraries] → Unit-test the simulator independently and retain the existing full Linux build recommendation.
