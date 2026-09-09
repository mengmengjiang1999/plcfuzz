# repository-source-layout Specification

## Purpose
TBD - created by archiving change organize-runtime-sources. Update Purpose after archive.
## Requirements
### Requirement: Explicit active runtime sources

The runtime build SHALL compile explicit lists of maintained and generated translation units, SHALL use separate compilation rules and warning controls for those groups, and SHALL NOT automatically include arbitrary `.cpp` files based on directory membership.

#### Scenario: New source file appears

- **WHEN** an unreviewed `.cpp` file is added under `src/`
- **THEN** it is not compiled until the maintained or generated Makefile source manifest is deliberately updated

#### Scenario: Generated PLC source is compiled

- **WHEN** a MatIEC or binding translation unit is built
- **THEN** inherited generated-header diagnostics use the generated warning policy and do not obscure maintained-source warnings

### Requirement: Isolated historical implementations

Disabled protocol implementations and obsolete input-transformer or grammar variants SHALL reside under a documented archival tree, outside `src/` and the maintained `input_generation/` directory.

#### Scenario: Maintainer inspects active directories

- **WHEN** the maintainer lists `src/` and `input_generation/`
- **THEN** fully disabled implementations and backup-named variants are absent

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
- **WHEN** a backup input transformer, backup grammar, or analyzer-local mapping is added to an active directory
- **THEN** the structural check fails with the unexpected path
