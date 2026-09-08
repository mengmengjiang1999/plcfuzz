## ADDED Requirements

### Requirement: Explicit active runtime sources
The runtime build SHALL compile an explicit list of maintained translation units and SHALL NOT automatically include arbitrary `.cpp` files based on directory membership.

#### Scenario: New source file appears
- **WHEN** an unreviewed `.cpp` file is added under `src/`
- **THEN** it is not compiled until the Makefile source manifest is deliberately updated

### Requirement: Isolated historical implementations
Disabled protocol implementations and obsolete mutator or grammar variants SHALL reside under a documented archival tree, outside active source and configuration directories.

#### Scenario: Maintainer inspects active directories
- **WHEN** the maintainer lists `src/` and `fuzz_config/`
- **THEN** fully disabled implementations and backup-named variants are absent

#### Scenario: Researcher needs an old variant
- **WHEN** a researcher follows the archival README
- **THEN** the retained tagged grammar, old mutator, and disabled protocol sources can be located

### Requirement: Single variable mapping output
The repository SHALL use the root `plc_variables_mapping.csv` as the sole tracked active mapping output.

#### Scenario: Analyzer runs with defaults
- **WHEN** `static_analyse/main.py` analyzes the tracked glue snapshot
- **THEN** it writes the root mapping and produces content matching the committed root CSV

### Requirement: Documented generated reference snapshot
The repository SHALL identify `src/glueVars.cpp` and `plc_variables_mapping.csv` as a matched generated reference snapshot and SHALL document the command that refreshes both.

#### Scenario: Generated PLC program changes
- **WHEN** a maintainer selects a different ST program for the active reference
- **THEN** the documented workflow regenerates glue first and then refreshes the root variable mapping

### Requirement: Structural layout verification
The repository SHALL provide an automated check for the active source manifest, archival separation, and generated mapping consistency.

#### Scenario: Obsolete backup returns to active tree
- **WHEN** a backup mutator, backup grammar, or analyzer-local mapping is added to an active directory
- **THEN** the structural check fails with the unexpected path
