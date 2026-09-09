# experiment-evaluation-protocol Specification

## Purpose
TBD - created by archiving change define-experiment-evaluation-protocol. Update Purpose after archive.
## Requirements
### Requirement: Versioned machine-readable protocol

The repository SHALL provide a versioned JSON evaluation protocol and an automated validator for its schema, metric registry, comparison controls, replicate rules, and aggregation policy.

#### Scenario: Maintained protocol is checked

- **WHEN** the protocol validator reads `evaluation/protocol-v1.json`
- **THEN** it confirms all required fields, exactly seven metric identifiers, unique fixed seeds, and at least five replicates

### Requirement: Fixed metric semantics

The protocol SHALL define valid-input ratio, path-coverage change, PLC state-transition count, unique-observation count, time-to-first-observation, replay-success ratio, and replicate variability with explicit unit, scope, direction, formula, and missing-value policy.

#### Scenario: A metric is unavailable

- **WHEN** a trial has not yet collected evidence for a required trial metric
- **THEN** its result uses a null value, a non-complete status, and a non-empty reason rather than recording zero

### Requirement: Controlled repeated comparisons

The protocol SHALL identify the fields that must remain equal within a comparison group and SHALL require strategy and fixed replicate seed as declared varying dimensions.

#### Scenario: Replicate is selected

- **WHEN** an evaluation run declares a replicate index and seed
- **THEN** the index and seed match the maintained protocol seed set and the launch command passes the fixed seed to the input-generation tool

### Requirement: Machine-readable evaluation result

Each evaluation-mode experiment SHALL create a result record linked to its experiment manifest and protocol checksum, containing every trial metric with explicit availability and evidence fields.

#### Scenario: Evaluation run starts

- **WHEN** a fully specified evaluation run creates its experiment directory
- **THEN** `evaluation-result.json` exists with protocol, benchmark, strategy, replicate, manifest, and pending metric entries

### Requirement: Result validation

The repository SHALL validate evaluation results against metric type, bounds, scope, availability status, evidence, and protocol identity.

#### Scenario: Ratio is outside its domain

- **WHEN** a completed ratio metric is below zero or above one
- **THEN** result validation fails with the metric identifier

### Requirement: Optional stable observation references

When an evaluation result includes an optional `observations` array, every entry SHALL contain a stable SHA-256 digest and a replay sample path relative to the experiment directory.

#### Scenario: Observation reference is malformed

- **WHEN** a result declares an observation digest that is not SHA-256 or a path that escapes its experiment directory
- **THEN** result or report validation fails with the observation entry
