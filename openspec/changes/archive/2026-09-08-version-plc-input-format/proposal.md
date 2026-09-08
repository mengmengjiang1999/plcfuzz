## Why

The runtime, grammar, preserved seeds, and custom mutator share an undocumented sequence of numeric fields and currently parse it through separate paths. Without a format identifier or one shared parser, a future layout change can silently reinterpret experiment inputs and reduce reproducibility.

## What Changes

- Define a canonical `PLCFUZZ_INPUT_V1` text format with an explicit header and fixed record layout.
- Centralize strict parsing and serialization for both the runtime and custom mutator.
- Preserve read-only compatibility with existing unversioned seeds and recorded samples.
- Reject unknown versions, incomplete records, non-decimal fields, and values outside their represented IEC widths.
- Update the AFL++ grammar, documentation, tests, and improvement roadmap to reflect the versioned format.

## Capabilities

### New Capabilities

- `plc-input-format`: Defines canonical versioned serialization, strict validation, and legacy read compatibility for automated PLC input data.

### Modified Capabilities

None.

## Impact

The shared input model, runtime input loading, custom mutator helper, grammar, unit tests, README, and improvement roadmap are affected. Preserved seeds and historical experiment data remain byte-identical and readable.
