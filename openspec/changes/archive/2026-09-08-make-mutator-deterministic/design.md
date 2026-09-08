## Context

AFL++ supplies a seed to each custom-mutator instance. The implementation initializes `std::mt19937` from that seed but bypasses it for all live mutation decisions, using libc's unrelated global PRNG instead. Variable mappings are also global and are cleared whenever another instance initializes, and malformed numeric fields currently throw without row context.

## Goals / Non-Goals

**Goals:**

- Make mutation output a deterministic function of seed, input bytes, and mapping content within the same build.
- Isolate mutable generator and mapping state per AFL++ mutator instance.
- Reject missing or malformed mappings at initialization with actionable diagnostics.
- Remove undefined signed shifts from wide integer mutations.

**Non-Goals:**

- Guarantee byte-identical `std::mt19937` distribution behavior across different standard-library implementations.
- Change the PLC input serialization grammar or AFL++ custom-mutator ABI.
- Redesign mutation probabilities or introduce corpus splicing.

## Decisions

1. Give `MutatorState` bounded random helpers backed exclusively by its seeded `std::mt19937`. Modulo selection is retained to keep the existing probability model simple and to avoid library-dependent distribution algorithms.
2. Move CSV parsing into a reusable header and return mappings by value to each state. Each non-empty data row must have exactly four fields, valid bounded indexes, and a variable name; errors include the path and row number.
3. Resolve the mapping from `PLCFUZZ_VARIABLE_MAPPING`, defaulting to `plc_variables_mapping.csv`. This makes tests and alternate generated PLC programs explicit without changing AFL's ABI.
4. Construct bit masks from the destination IEC unsigned type (`IEC_UDINT(1)` and `IEC_ULINT(1)`) before shifting. Arithmetic mutations use unsigned modular operations explicitly.
5. Catch initialization exceptions at the C ABI boundary, print a diagnostic, and return null rather than allowing a C++ exception to escape into AFL++.

## Risks / Trade-offs

- **Different seeds can occasionally produce the same mutation** → Determinism is guaranteed for equal seeds; variation tests use a representative mapping and several seeds rather than asserting universal uniqueness.
- **Strict CSV parsing may reject previously ignored bad rows** → Report the exact file and row so the generated mapping can be corrected before fuzzing.
- **Modulo selection has small statistical bias** → Preserve it for stable, dependency-free behavior; mutation quality can be studied separately.

## Migration Plan

Existing runs using the root mapping need no changes. Runs launched outside the repository root should set `PLCFUZZ_VARIABLE_MAPPING` to the generated mapping path.

## Open Questions

None.
