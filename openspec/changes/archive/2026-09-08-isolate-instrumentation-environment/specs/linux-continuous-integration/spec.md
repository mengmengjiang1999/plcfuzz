## ADDED Requirements

### Requirement: Isolated instrumentation environment
The workflow SHALL use `PLCFUZZ_TOOLCHAIN_BUILD_JOBS` for fixed toolchain parallelism and `PLCFUZZ_INSTRUMENTED_CXX` for the project compiler-wrapper path.

#### Scenario: The instrumented runtime stage starts
- **WHEN** the workflow exports project build controls
- **THEN** no project-only setting occupies an upstream `AFL_` variable name
