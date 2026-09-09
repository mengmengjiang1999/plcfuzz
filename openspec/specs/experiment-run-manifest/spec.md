# experiment-run-manifest Specification

## Purpose
TBD - created by archiving change record-experiment-manifests. Update Purpose after archive.
## Requirements
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

### Requirement: Manifest lifecycle completion
The maintained unified experiment command SHALL finalize the manifest with completion time, exit code, and a success, nonzero, or interrupted status.

#### Scenario: AFL++ returns a nonzero code
- **WHEN** the launcher exits
- **THEN** the existing manifest retains its initial metadata and records the nonzero result

### Requirement: Historical output compatibility

The launcher SHALL NOT modify existing historical result directories and SHALL accept former project-owned launch variables only as compatibility aliases that emit migration guidance.

#### Scenario: The former output-root variable is set

- **WHEN** a new run starts with the former output-root variable set to `/data/results`
- **THEN** its unique experiment directory is created below `/data/results` and a migration notice identifies `OBSERVATIONS_DIR`

### Requirement: Optional evaluation context

The experiment launcher SHALL accept evaluation protocol path, benchmark ID, strategy ID, replicate index, and replicate seed as one complete optional group and SHALL reject partial or inconsistent groups.

#### Scenario: Complete evaluation context is supplied

- **WHEN** all evaluation variables select a valid protocol replicate
- **THEN** the manifest records protocol identity and checksum, benchmark, strategy, replicate index, seed, and linked result path

#### Scenario: Evaluation context is partial

- **WHEN** one or more but not all required evaluation variables are set
- **THEN** the experiment is rejected before an output directory or long-running process is started

### Requirement: Effective input-generation strategy

Every experiment manifest SHALL record the effective strategy ID, whether grammar is enabled, whether an adapter is enabled, adapter-only mode, and applicable resource paths and checksums.

#### Scenario: Evaluation strategy label differs

- **WHEN** evaluation context names a strategy other than the effective launcher strategy
- **THEN** the experiment is rejected before its output directory is created
