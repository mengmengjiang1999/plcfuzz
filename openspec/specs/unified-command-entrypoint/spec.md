# unified-command-entrypoint Specification

## Purpose
TBD - created by archiving change unify-script-entrypoints. Update Purpose after archive.
## Requirements
### Requirement: Unified project command

The repository SHALL provide `scripts/plc-lab` as the single maintained user-facing dispatcher for setup, build, run, experiment, replay, test, batch, diagnostics, and line-count workflows.

#### Scenario: User requests help

- **WHEN** a user runs `./scripts/plc-lab --help`
- **THEN** the command lists supported workflows, canonical neutral build steps, and configuration guidance

### Requirement: Compatibility wrappers

Former command entry points, including `scripts/plcfuzz`, SHALL contain only migration messaging and argument-preserving forwarding to the canonical dispatcher or maintained semantic scripts.

#### Scenario: Former dispatcher is invoked

- **WHEN** a user invokes `scripts/plcfuzz` with any arguments
- **THEN** it prints a migration notice and forwards the arguments and resulting exit status to `scripts/plc-lab`

### Requirement: Maintained orchestration boundary
Run, experiment, replay, and batch orchestration SHALL live in semantic scripts below `scripts/`, while root compatibility wrappers SHALL contain no workflow implementation.

#### Scenario: Script layout validation runs
- **WHEN** maintained and compatibility scripts are inspected
- **THEN** each wrapper is recognized as forwarding-only and each semantic implementation is present

### Requirement: Isolated batch results
The batch subcommand SHALL use the experiment-manifest lifecycle and a unique directory for each selected ST case.

#### Scenario: Multiple batch cases run
- **WHEN** the batch command advances between cases
- **THEN** no case reads from or writes to a shared fixed result directory
