# instrumented-build-configuration Specification

## Purpose
TBD - created by archiving change isolate-instrumentation-environment. Update Purpose after archive.
## Requirements
### Requirement: Project-owned compiler selector
The instrumented build entry point SHALL read its compiler-wrapper path from `PLCFUZZ_INSTRUMENTED_CXX` and SHALL NOT use `AFL_CXX` as a project setting.

#### Scenario: A fixed compiler wrapper is selected
- **WHEN** CI invokes the instrumented build
- **THEN** the wrapper can choose its real compiler without recursively selecting itself

### Requirement: Reserved prefix isolation
Project-only build controls SHALL NOT begin with AFL++'s reserved `AFL_` prefix.

#### Scenario: The wrapper inspects its environment
- **WHEN** project build settings are present
- **THEN** it finds no unknown `AFL_`-prefixed project variables
