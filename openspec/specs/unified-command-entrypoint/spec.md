# unified-command-entrypoint Specification

## Purpose
TBD - created by archiving change unify-script-entrypoints. Update Purpose after archive.
## Requirements
### Requirement: Unified project command
The repository SHALL provide an executable `scripts/plcfuzz` entry point with documented setup, build, run, experiment, replay, test, batch, diagnostics, and line-count subcommands.

#### Scenario: A contributor requests help
- **WHEN** `scripts/plcfuzz --help` is executed
- **THEN** the maintained subcommands and their canonical purpose are listed without starting a build or experiment

### Requirement: Compatibility wrappers
Historical root entry points SHALL print a deprecation notice and forward all arguments and environment to the corresponding unified subcommand.

#### Scenario: A historical command is invoked
- **WHEN** its compatibility wrapper runs
- **THEN** it identifies the replacement command and returns the forwarded command's status

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
