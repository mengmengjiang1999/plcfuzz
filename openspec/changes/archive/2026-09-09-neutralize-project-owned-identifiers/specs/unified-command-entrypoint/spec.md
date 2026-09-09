## MODIFIED Requirements

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
