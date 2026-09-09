# neutral-project-interface Specification

## Purpose
TBD - created by archiving change neutralize-project-owned-identifiers. Update Purpose after archive.
## Requirements
### Requirement: Neutral maintained identity

The project SHALL use **PLC Robustness Lab** as its maintained display name and SHALL describe project-owned components using offline software-quality laboratory terminology.

#### Scenario: Reader opens maintained documentation

- **WHEN** a reader opens the README or contributor documentation
- **THEN** the neutral display name and academic offline scope appear before operational instructions

### Requirement: Neutral project-owned artifacts

Maintained project-owned commands, source directories, build steps, generated artifacts, and configuration variables SHALL use input-generation, observation, transformer, diagnostic, or instrumented-runtime terminology.

#### Scenario: User follows the quick start

- **WHEN** a user follows maintained documentation
- **THEN** only canonical neutral commands, variables, and generated artifact paths are presented

### Requirement: External interface preservation

The project SHALL preserve exact externally defined tool commands, environment variables, ABI symbols, source identifiers, and raw measurement fields where changing them would break interoperability or reproducibility.

#### Scenario: Input transformer is loaded by AFL++

- **WHEN** AFL++ loads the project input transformer
- **THEN** all required upstream ABI symbol names and environment variables remain exact

### Requirement: Explicit compatibility boundary

Deprecated project-owned command and configuration names SHALL be accepted only through documented compatibility paths that emit migration guidance, and SHALL not be used by maintained documentation or CI.

#### Scenario: Existing automation invokes the former command

- **WHEN** existing automation invokes the former dispatcher
- **THEN** the invocation is forwarded without changing arguments or exit status and a migration notice identifies the canonical command
