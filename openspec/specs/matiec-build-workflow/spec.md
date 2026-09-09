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

### Requirement: Portable test archive resolution
The MatIEC setup entry point SHALL append the compiler library to test link commands through an absolute `LIBS` value.

#### Scenario: Tests link with left-to-right static archive resolution
- **WHEN** an earlier compiler archive scan precedes a later archive that references `error_exit`
- **THEN** the trailing compiler library resolves the reference without skipping tests

### Requirement: Explicit prebuilt MatIEC mode

The MatIEC setup script SHALL reuse a prebuilt source tree only when explicitly requested and when the compiler, generated Makefile, and compiler support library are present.

#### Scenario: Complete prebuilt tree is selected

- **WHEN** explicit prebuilt mode is enabled and all required build outputs exist
- **THEN** setup skips configuration and compilation

#### Scenario: MatIEC tests are requested with a prebuilt tree

- **WHEN** test mode and prebuilt mode are enabled together
- **THEN** prior Automake result files are discarded and the complete MatIEC test command runs again

#### Scenario: Prebuilt outputs are incomplete

- **WHEN** explicit prebuilt mode is enabled but a required output is absent
- **THEN** setup follows the normal source-build path before running tests
