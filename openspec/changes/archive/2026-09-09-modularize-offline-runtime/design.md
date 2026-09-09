## Context

`src/main.cpp` has 516 lines and directly owns input parsing, global runtime state, cycle pacing, statistics, output-state evaluation, callbacks, and lifecycle orchestration. `src/modbus.cpp` has 761 lines covering buffer fallback mapping and every compatibility message family. `src/hardware_layer.cpp` already acts as the offline implementation of inherited hardware hooks, but its input and observation responsibilities are implicit. The Makefile compiles generated and maintained sources with the same flags.

## Goals / Non-Goals

**Goals:**

- Make runtime responsibilities visible as named modules with one-way dependencies.
- Keep the executable entry point and inherited adapter functions small.
- Split compatibility message families without changing the byte-level contract.
- Preserve all current target variants and checks.
- Separate generated-source diagnostics from maintained-source warnings.

**Non-Goals:**

- Change scheduling defaults, input data format, output-state evaluation, or message semantics.
- Add an online service or activate archived network components.
- Replace inherited OpenPLC names that form an external compatibility boundary.
- Redesign generated MatIEC code.

## Decisions

### Use a thin executable entry point

`main.cpp` calls `offline_runtime::run`. `offline_runtime.cpp` owns ordered initialization, cycle execution, and shutdown but delegates input parsing/application, pacing, observation, and statistics to dedicated modules. This keeps command-line behavior stable while making each policy independently testable.

### Expose narrow runtime layers

- `runtime_input_application` owns the playback sequence, validates a file through the shared input parser, and atomically applies the next composite block.
- `runtime_cycle_scheduler` owns monotonic deadlines and optional pacing latency.
- `runtime_state_observer` owns buffer-history initialization, per-cycle snapshots, and final output-change evaluation.
- `runtime_result_recorder` owns duration/latency statistics, per-cycle records, special-function publication, and summary rendering.

The inherited hardware functions in `hardware_layer.cpp` remain adapters around buffer storage plus the input and observer layers. Generated PLC functions and global pointer tables remain compatibility dependencies, not domain objects.

### Split compatibility messages by data family

`modbus.cpp` retains dispatch and shared response helpers. `modbus_discrete.cpp` handles coil/discrete Boolean values, `modbus_registers.cpp` handles 16/32/64-bit values, and `runtime_buffer_map.cpp` owns fallback storage and pointer mapping. A private header carries stable constants and internal function declarations. The public `processModbusMessage` and `mapUnusedIO` signatures do not change.

### Compile maintained and generated sources separately

The Makefile declares `PROJECT_CPP_SRCS`, `GENERATED_C_SRCS`, and `GENERATED_CPP_SRCS`. Project objects use `PROJECT_WARNING_FLAGS` with inherited/generated include roots marked as system paths. Generated objects use `GENERATED_WARNING_FLAGS` and do not emit inherited header diagnostics. `EXTRA_CXXFLAGS` still reaches both groups for diagnostic, coverage, and instrumentation builds.

### Verify dependency direction structurally and behaviorally

Unit tests cover input loading/application, scheduler deadline behavior, result aggregation, observer lifecycle, and representative compatibility messages. A structure check limits line counts, requires explicit manifests/rules, and rejects direct BufferHistory ownership outside the observer. Existing full-runtime and coverage integration checks validate the assembled executable.

## Risks / Trade-offs

- [Mechanical moves alter behavior] → Preserve function bodies, add byte-level dispatch tests, and run all target variants.
- [More source files increase build configuration work] → Keep one authoritative explicit Makefile manifest and validate every active source is listed.
- [Global generated tables remain necessary] → Contain them behind adapter and mapping modules rather than broadening this change into generated-code redesign.
- [Coverage percentages shift after file boundaries change] → Update the scope digest and record a fresh complete Ubuntu baseline before archive.

## Migration Plan

No user command changes. Existing builds recompile with the new source manifest. Reverting the commit restores the prior translation units and shared flag rule without data migration.

## Open Questions

None. Larger semantic improvements to inherited message handling require separate changes with their own compatibility evidence.
