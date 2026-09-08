## Why

Linux workflow run `34249070960` showed the fixed compiler wrapper repeatedly invoking itself until its parameter table filled. The project used `AFL_CXX` for the wrapper path, but AFL++ interprets the same variable as the downstream real C++ compiler. The job-wide `AFL_BUILD_JOBS` setting also used an upstream-reserved prefix and produced repeated warnings. Project-owned build controls need an isolated namespace.

## What Changes

- Rename the project wrapper selector to `PLCFUZZ_INSTRUMENTED_CXX`.
- Rename the fixed toolchain job count to `PLCFUZZ_TOOLCHAIN_BUILD_JOBS`.
- Update CI, documentation, and structural checks.
- Require maintained project variables to avoid AFL++'s reserved `AFL_` prefix.

## Capabilities

### New Capabilities

- `instrumented-build-configuration`: Defines project-owned compiler selection without colliding with upstream variables.

### Modified Capabilities

- `linux-continuous-integration`: Requires project-prefixed settings for the fixed toolchain and instrumented runtime stages.

## Impact

The instrumented build script, Linux workflow, reproducibility documentation, validation, and OpenSpec records are affected.
