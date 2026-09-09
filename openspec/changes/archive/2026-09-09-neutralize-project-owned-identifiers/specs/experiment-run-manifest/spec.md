## MODIFIED Requirements

### Requirement: Unique experiment directory

The maintained unified experiment command SHALL create a new experiment directory below `OBSERVATIONS_DIR` for every run and SHALL refuse an explicitly selected path that already exists. `FINDINGS_DIR` SHALL remain a compatibility alias with migration guidance.

#### Scenario: No explicit experiment path is supplied

- **WHEN** a run starts
- **THEN** a timestamp/revision-prefixed unique directory is created below the configured observations root

### Requirement: Initial reproducibility manifest

Before starting AFL++, the launcher SHALL write a versioned JSON manifest containing repository and MatIEC revisions, AFL++ version, target SHA-256, machine information, duration, timeout, input-sample, grammar, input-transformer and output paths, selected environment, and the complete command.

#### Scenario: The long-running process has not completed

- **WHEN** the experiment directory is created
- **THEN** its manifest exists with status `running` and uses neutral project-owned field names

### Requirement: Historical output compatibility

The launcher SHALL NOT modify existing historical result directories and SHALL accept former project-owned launch variables only as compatibility aliases that emit migration guidance.

#### Scenario: The former output-root variable is set

- **WHEN** a new run starts with the former output-root variable set to `/data/results`
- **THEN** its unique experiment directory is created below `/data/results` and a migration notice identifies `OBSERVATIONS_DIR`
