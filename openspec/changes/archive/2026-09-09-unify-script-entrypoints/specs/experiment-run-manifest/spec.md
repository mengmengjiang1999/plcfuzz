## MODIFIED Requirements

### Requirement: Unique experiment directory
The maintained unified experiment command SHALL create a new experiment directory for every run and SHALL refuse an explicitly selected path that already exists.

#### Scenario: No explicit experiment path is supplied
- **WHEN** a run starts
- **THEN** a timestamp/revision-prefixed unique directory is created below the configured findings root

### Requirement: Manifest lifecycle completion
The maintained unified experiment command SHALL finalize the manifest with completion time, exit code, and a success, nonzero, or interrupted status.

#### Scenario: AFL++ returns a nonzero code
- **WHEN** the launcher exits
- **THEN** the existing manifest retains its initial metadata and records the nonzero result
