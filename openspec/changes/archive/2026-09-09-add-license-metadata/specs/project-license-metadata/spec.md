## ADDED Requirements

### Requirement: Machine-readable original-file licensing
The repository SHALL provide REUSE-compatible aggregate annotations with copyright attribution and an SPDX license identifier for clearly identified project-authored files.

#### Scenario: A project-authored file is audited
- **WHEN** its repository license metadata is inspected
- **THEN** it is covered by the `GPL-3.0-only` aggregate annotation and the complete matching license text is available at the repository root

### Requirement: Ownership boundary preservation
The original-file annotation SHALL exclude inherited sources, the MatIEC submodule, generated files, historical results, and collected material whose provenance is awaiting separate review.

#### Scenario: An inherited file is audited
- **WHEN** its licensing is checked
- **THEN** its upstream notice remains intact and it is not assigned the project-authored aggregate attribution

### Requirement: License metadata validation
The project test entry point SHALL validate metadata syntax, tracked-path coverage, representative ownership boundaries, and preserved upstream notices.

#### Scenario: A maintained original path loses coverage
- **WHEN** the license metadata checker runs
- **THEN** it exits nonzero and identifies the uncovered path
