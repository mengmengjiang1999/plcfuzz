## Why

The latest Linux quality run spent 3 minutes 56 seconds building and testing MatIEC and 2 minutes 1 second building the fixed AFL++ compiler, together accounting for most of the 7 minute 24 second job. Both inputs are version-fixed, so compatible build outputs can be reused while all maintained validation remains active.

## What Changes

- Add Node.js 24-based GitHub Actions caches for the MatIEC and AFL++ build trees.
- Key each cache by operating system, architecture, compiler version, fixed source identity, and an explicit cache schema version.
- Let MatIEC setup reuse a complete cached build while forcing its test logs to be regenerated and all tests to run.
- Skip the fixed AFL++ source build only on an exact cache hit, while retaining executable and version checks.
- Extend CI structure checks and record the completed maintenance theme in the roadmap.

## Capabilities

### Modified Capabilities

- `matiec-build-workflow`: A verified cached build may bypass configuration and compilation, but not MatIEC tests.
- `linux-continuous-integration`: Fixed toolchain build outputs use exact, versioned cache keys without weakening validation.
- `improvement-roadmap`: The completed CI duration optimization is recorded with archived OpenSpec evidence.

## Impact

- The first run for a new cache key remains a full build and saves outputs only after a successful job.
- Subsequent compatible runs restore build trees and should spend most of their time on required tests and project validation.
- Local setup and the reproducibility container keep their existing clean-build behavior unless the explicit prebuilt mode is selected.
