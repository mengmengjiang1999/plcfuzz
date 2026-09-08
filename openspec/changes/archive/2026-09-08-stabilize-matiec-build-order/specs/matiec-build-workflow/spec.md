## ADDED Requirements

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
