## Why

The runtime currently labels a 50-nanosecond fuzz-loop delay ambiguously, overwrites rather than accumulates latency totals, and derives latency extrema from differences between samples. This produces misleading timing summaries and obscures the distinction between IEC logical time and optional wall-clock pacing.

## What Changes

- Make the fuzz execution cycle count and wall-clock delay explicit runtime settings with fast, deterministic defaults.
- Keep wall-clock pacing independent from MatIEC's IEC logical clock.
- Record cycle duration and wake-up latency using a reusable statistics component with correct total, minimum, maximum, and average values.
- Skip sleeping and report zero scheduling latency when wall-clock pacing is disabled.
- Add unit tests for configuration parsing and timing statistics.

## Capabilities

### New Capabilities

- `runtime-timing`: Defines fuzz-loop configuration, wall-clock pacing, and timing summary semantics.

### Modified Capabilities

None.

## Impact

The runtime entry point, timing helpers, unit-test runner, and reproducibility documentation are affected. The PLC input format and MatIEC-generated logical-time behavior remain unchanged.
