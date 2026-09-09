## ADDED Requirements

### Requirement: Balanced benchmark matrix

The repository SHALL maintain one legacy-profile ST benchmark for every combination of timer, counter, state-machine, interlock, and sequential-control categories with simple, general, and complex levels.

#### Scenario: Benchmark catalog is validated

- **WHEN** the machine-readable benchmark catalog is checked
- **THEN** all fifteen unique category/complexity combinations are present exactly once

### Requirement: Explicit benchmark metadata

Each benchmark SHALL record a stable ID, category, complexity, source path and checksum, located input variables, located output variables, modeled state count, expected behavior, origin classification, license, and provenance evidence.

#### Scenario: Benchmark metadata is incomplete

- **WHEN** a case omits an interface, state count, behavior statement, source boundary, or matching checksum
- **THEN** benchmark validation fails with the case identifier

### Requirement: Minimal replay and expected trace

Each benchmark SHALL provide a minimal V1 replay input and a machine-readable expected trace whose steps name only variables declared by that case.

#### Scenario: Replay material is checked

- **WHEN** the benchmark validator reads a case's replay and trace files
- **THEN** it confirms V1 format and bounds, matching step counts, declared variable names, deterministic parsing, and catalog checksums

### Requirement: Deterministic compiler validation

The benchmark validator SHALL optionally compile every benchmark twice with the pinned MatIEC legacy profile and require identical generated file sets and content digests.

#### Scenario: Generated output differs

- **WHEN** two isolated compilations of the same benchmark produce different generated content
- **THEN** compiler verification fails and identifies the benchmark and differing path

### Requirement: Source classification boundary

The benchmark schema SHALL distinguish project-authored, third-party, and transformed material, and every initial suite case SHALL be project-authored under GPL-3.0-only.

#### Scenario: Initial case claims an external origin

- **WHEN** an initial benchmark is classified as third-party or transformed
- **THEN** validation rejects it because the version-one suite boundary is project-authored
