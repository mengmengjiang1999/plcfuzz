## Why

The authoritative full build targets x86-64 Linux, but the repository has no remote workflow that continuously verifies the pinned compiler, project tests, runtime, custom mutator, and instrumented target together. Regressions can therefore remain hidden on non-Linux development hosts.

## What Changes

- Add a GitHub Actions workflow pinned to Ubuntu 22.04.
- Initialize and verify the MatIEC submodule, build MatIEC, and run its tests.
- Run project unit, wording, layout, testcase-catalog, compatibility, and preserved-material checks.
- Build the normal runtime, structured mapping, custom mutator, and AFL++-instrumented target in dependency order.
- Build the pinned AFL++ 4.10c source-only toolchain rather than relying on a moving package version.
- Document CI scope and update roadmap status.

## Capabilities

### New Capabilities

- `linux-continuous-integration`: Defines repeatable remote verification of the complete maintained Linux build and test workflow.

### Modified Capabilities

None.

## Impact

GitHub Actions configuration, documentation, and the improvement roadmap are affected. Runtime behavior and experiment data are unchanged.
