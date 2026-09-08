## Why

The maintained workflow builds ordinary and instrumented targets but has no dedicated ASan/UBSan configuration, and preserved non-normal termination samples have no repeatable path for exact deduplication, stable reproduction, behavior-preserving minimization, or diagnostic metadata. Academic software-quality conclusions need those steps to be explicit and reproducible.

## What Changes

- Add ASan/UBSan builds for the ordinary runtime and custom input component.
- Add a local sample-organization tool that deduplicates exact inputs, confirms a stable signal result, minimizes while preserving that result, and records diagnostic output.
- Record repository and MatIEC revisions, target digest, seed, selected environment, and commands in JSON manifests.
- Add unit and structural checks plus user documentation.
- Update the improvement roadmap after verification.

## Capabilities

### New Capabilities

- `runtime-diagnostic-builds`: Defines isolated ASan/UBSan build outputs for maintained runtime components.
- `abnormal-sample-organization`: Defines deterministic local organization and metadata for non-normal termination samples.

## Impact

The Makefile, CMake build configuration, new scripts and tests, Linux workflow, documentation, roadmap, and OpenSpec records are affected.
