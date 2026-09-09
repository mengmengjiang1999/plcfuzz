## Why

The reproducibility container installs the pinned toolchain and checks MatIEC, but it does not execute the complete maintained project flow. The repository also lacks a machine-readable record tying a successful run to the base image, installed package versions, commands, platform, and final image content digest.

## What Changes

- Add one container-internal acceptance script that executes repository checks, MatIEC validation, normal and instrumented builds, diagnostic builds, variable-map generation, and representative runtime playback.
- Make the reproducibility image run that acceptance script during its build and retain a machine-readable internal report.
- Add a host-side command that builds the pinned `linux/amd64` image, extracts its report, and records base and final image content digests.
- Minimize the container context to maintained source inputs so build outputs, repository metadata, and the generated acceptance record do not change the image unexpectedly.
- Document the verified image, commands, results, and remaining package-snapshot limitation.

## Capabilities

### New Capabilities

- `linux-container-acceptance`: A repeatable command verifies the complete maintained Linux build flow and writes an auditable result.

### Modified Capabilities

- `improvement-roadmap`: The final planned maintenance theme is marked complete with its archived OpenSpec evidence.

## Impact

- Building `Dockerfile.repro` becomes a full acceptance operation and takes longer than dependency-only image creation.
- Successful images contain `/opt/plcfuzz-acceptance/report.json`.
- Host acceptance output is written below ignored `output/linux-container-acceptance/` unless overridden.
