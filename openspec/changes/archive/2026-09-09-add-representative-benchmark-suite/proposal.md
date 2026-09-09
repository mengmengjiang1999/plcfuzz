## Why

The current testcase catalog is primarily organized around compiler compatibility and historical runtime examples, so it does not provide a balanced, explicitly described comparison set for repeated experiments. A maintained benchmark suite is needed before input-generation strategies can be compared without silently changing programs, complexity, provenance, or replay material.

## What Changes

- Add a machine-readable benchmark catalog spanning timers, counters, state machines, interlocks, and sequential control at simple, general, and complex levels.
- Add project-authored legacy-profile ST programs for every category/level combination.
- Record each case's located inputs, located outputs, modeled state count, expected behavior, source classification, license, and content checksums.
- Provide one minimal versioned replay input and one expected trace for every case.
- Add validation for catalog coverage, metadata, replay format, checksums, expected traces, compiler acceptance, and repeatable generated output.
- Document the suite boundary, selection rationale, and intended comparison use.

## Capabilities

### New Capabilities

- `representative-benchmark-suite`: Defines the balanced benchmark catalog, case metadata, replay material, provenance boundary, and deterministic validation workflow.

### Modified Capabilities

- `testcase-catalog`: Requires maintained benchmark ST files to remain represented in the repository-wide testcase catalog.
- `unified-command-entrypoint`: Adds benchmark validation to the canonical project command.

## Impact

The change adds `benchmarks/`, a benchmark validator, tests, documentation, and catalog rows. It uses the already pinned MatIEC compiler and versioned PLC input format; it adds no external runtime dependency and does not modify third-party or archived material.
