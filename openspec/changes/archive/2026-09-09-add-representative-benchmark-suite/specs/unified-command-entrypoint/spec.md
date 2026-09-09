## MODIFIED Requirements

### Requirement: Unified project command

The repository SHALL provide `scripts/plc-lab` as the single maintained user-facing dispatcher for setup, build, run, experiment, replay, test, batch, diagnostics, evaluation-protocol validation, benchmark validation, and line-count workflows.

#### Scenario: User requests evaluation help

- **WHEN** a user runs `./scripts/plc-lab evaluation --help`
- **THEN** the command documents protocol validation, result validation, and result-template operations without starting an experiment

#### Scenario: User validates benchmarks

- **WHEN** a user runs `./scripts/plc-lab benchmarks validate`
- **THEN** the command validates the maintained benchmark catalog and replay artifacts without starting an experiment
