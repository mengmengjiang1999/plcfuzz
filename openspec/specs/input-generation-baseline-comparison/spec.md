# input-generation-baseline-comparison Specification

## Purpose
TBD - created by archiving change compare-input-generation-baselines. Update Purpose after archive.
## Requirements
### Requirement: Versioned strategy registry

The repository SHALL define random-bytes, protocol-valid, structure-aware, and state-feedback strategies with explicit grammar, adapter, availability, and environment semantics.

#### Scenario: Maintained strategies are inspected

- **WHEN** the strategy registry is validated
- **THEN** the first three strategies have distinct effective configurations and state-feedback is marked adapter-required

### Requirement: Strategy isolation

The experiment launcher SHALL enable only the grammar and adapter resources declared by the selected strategy and SHALL retain structure-aware behavior as the default for a non-evaluation run.

#### Scenario: Random baseline starts

- **WHEN** `random-bytes` is selected
- **THEN** neither the grammar argument nor a project adapter environment variable is supplied to the input tool

#### Scenario: Protocol-valid baseline starts

- **WHEN** `protocol-valid` is selected
- **THEN** the grammar is supplied and the project adapter is disabled

#### Scenario: Structure-aware baseline starts

- **WHEN** `structure-aware` is selected
- **THEN** the grammar and project adapter are supplied while the current combined-operation behavior is preserved

### Requirement: Balanced comparison plan

The comparison planner SHALL produce a deterministic machine-readable Cartesian product of selected benchmarks, available strategies, and every fixed protocol seed under one positive duration and timeout budget.

#### Scenario: Core plan is generated

- **WHEN** no filters or optional adapter are supplied
- **THEN** the plan contains fifteen benchmarks, three maintained strategies, five seeds, and 225 uniquely identified trials

#### Scenario: Plan loses one paired seed

- **WHEN** a trial is removed from a benchmark/strategy group
- **THEN** plan validation fails before execution

### Requirement: Optional adapter honesty

State-feedback SHALL be excluded by default and SHALL be included only when the user explicitly supplies an executable-compatible adapter file whose path and checksum are recorded.

#### Scenario: Optional strategy is requested without adapter

- **WHEN** plan generation requests state-feedback without an adapter path
- **THEN** generation fails rather than substituting another strategy

### Requirement: Controlled single-trial execution

The comparison command SHALL validate a plan and all referenced checksums, select exactly one trial, and launch it through the evaluation manifest workflow with the declared strategy, benchmark, budget, and seed.

#### Scenario: Plan checksum is stale

- **WHEN** a referenced protocol, registry, benchmark source, or optional adapter differs from the plan
- **THEN** trial execution is rejected before an experiment directory is created
