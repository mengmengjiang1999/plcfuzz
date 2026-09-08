## Why

Linux workflow run `34244719307` built AFL++ `v5.03c`, but the resulting compiler wrapper exhausted its internal parameter table on a short compile command. Inspection of the fixed release Makefiles shows that the top-level `all` target can run the main-program and LLVM sub-build prerequisites concurrently, while both generate `afl-cc`. The maintained build must serialize this shared output.

## What Changes

- Add a dedicated one-job setting for the AFL++ outer build.
- Use one outer build job in CI and the reproducibility container.
- Keep general project build parallelism unchanged.
- Add structural checks and documentation for the deterministic setting.

## Capabilities

### Modified Capabilities

- `linux-continuous-integration`: Requires deterministic single-job AFL++ outer builds.

## Impact

The Linux workflow, reproducibility container, documentation, validation, and OpenSpec records are affected.
