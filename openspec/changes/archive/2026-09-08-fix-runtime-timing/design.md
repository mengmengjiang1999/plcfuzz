## Context

The runtime executes a bounded number of PLC cycles for each fuzz input. Its current hard-coded 50 ns sleep is neither a meaningful PLC scan period nor a reliable way to yield, while the timing code mixes per-cycle values, differences between values, and overwritten totals. MatIEC's `common_ticktime__` is the PLC program's logical clock and must not be coupled to host scheduling.

## Goals / Non-Goals

**Goals:**

- Preserve a fast default fuzz loop with no intentional host sleep.
- Allow experiments to request a cycle count and wall-clock delay explicitly.
- Produce internally consistent nanosecond timing statistics.
- Make configuration and statistics independently unit-testable.

**Non-Goals:**

- Changing MatIEC logical-time generation or PLC scan semantics.
- Providing hard real-time guarantees from a general-purpose host OS.
- Reworking DNP3's independent 50 ms service loop.

## Decisions

1. Add a small header-only runtime timing module. It exposes environment parsing, a running-statistics type, timespec conversion, and absolute-deadline advancement. Keeping it independent of OpenPLC symbols permits a dependency-free unit test.
2. Use `PLCFUZZ_CYCLE_COUNT` (default 100) and `PLCFUZZ_CYCLE_DELAY_NS` (default 0). Invalid, negative, overflowing, or trailing-character values fail startup with a clear error instead of being silently coerced.
3. When delay is zero, do not call `clock_nanosleep`; record scheduling latency as zero. When enabled, maintain an absolute monotonic deadline and define latency as actual wake time minus that deadline, clamped to zero.
4. Record cycle duration and scheduling latency in separate running-statistics instances. Summaries use actual sample counts and never derive extrema from adjacent samples.

## Risks / Trade-offs

- **Environment variables are less discoverable than flags** → Document names, units, and defaults in the reproducibility guide and print resolved settings at startup.
- **OS scheduling jitter still affects paced runs** → Describe latency as observed wake-up lateness, not a real-time guarantee.
- **Removing the 50 ns sleep changes incidental scheduling behavior** → The old delay was below normal scheduler resolution; users who require pacing can set an explicit value.

## Migration Plan

No migration is required for the default fuzzing workflow. Experiments that intentionally relied on the hard-coded delay must set `PLCFUZZ_CYCLE_DELAY_NS`; cycle-count customization is opt-in.

## Open Questions

None.
