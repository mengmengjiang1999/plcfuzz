# experiment-run-manifest Specification

## Purpose
TBD - created by archiving change record-experiment-manifests. Update Purpose after archive.
## Requirements
### Requirement: Unique experiment directory
The maintained unified experiment command SHALL create a new experiment directory for every run and SHALL refuse an explicitly selected path that already exists.

#### Scenario: No explicit experiment path is supplied
- **WHEN** a run starts
- **THEN** a timestamp/revision-prefixed unique directory is created below the configured findings root

### Requirement: Initial reproducibility manifest
Before starting AFL++, the launcher SHALL write a versioned JSON manifest containing repository and MatIEC revisions, AFL++ version, target SHA-256, machine information, duration, timeout, paths, selected environment, and the complete command.

#### Scenario: The long-running process has not completed
- **WHEN** the experiment directory is created
- **THEN** its manifest exists with status `running`

### Requirement: Manifest lifecycle completion
The maintained unified experiment command SHALL finalize the manifest with completion time, exit code, and a success, nonzero, or interrupted status.

#### Scenario: AFL++ returns a nonzero code
- **WHEN** the launcher exits
- **THEN** the existing manifest retains its initial metadata and records the nonzero result

### Requirement: Historical output compatibility
The launcher SHALL treat `FINDINGS_DIR` as a parent root and SHALL NOT modify existing historical result directories.

#### Scenario: The compatibility variable is set
- **WHEN** a new run starts with `FINDINGS_DIR=/data/results`
- **THEN** its unique experiment directory is created below `/data/results`
