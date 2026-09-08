# matiec-build-workflow Specification

## Purpose
TBD - created by archiving change stabilize-matiec-build-order. Update Purpose after archive.
## Requirements
### Requirement: Deterministic default build order
The MatIEC setup entry point SHALL use one build job by default so clean generated Makefiles do not execute conflicting directory targets concurrently.

#### Scenario: Default setup runs
- **WHEN** no MatIEC-specific job override is provided
- **THEN** MatIEC is built and tested with one job

### Requirement: Dedicated override
The setup entry point SHALL accept `MATIEC_BUILD_JOBS` as the only override for MatIEC make parallelism.

#### Scenario: General project parallelism is configured
- **WHEN** `BUILD_JOBS` is set but `MATIEC_BUILD_JOBS` is absent
- **THEN** MatIEC still uses the deterministic one-job default

### Requirement: Clean build preparation
The MatIEC setup entry point SHALL create the generated stage-four dependency directory after configuration and before compilation.

#### Scenario: Fresh checkout has no generated dependency directories
- **WHEN** the setup entry point configures MatIEC from a clean source tree
- **THEN** `stage4/.deps` exists before `make` starts
