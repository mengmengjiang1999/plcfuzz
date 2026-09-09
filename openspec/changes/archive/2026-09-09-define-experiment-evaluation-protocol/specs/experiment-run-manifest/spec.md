## ADDED Requirements

### Requirement: Optional evaluation context

The experiment launcher SHALL accept evaluation protocol path, benchmark ID, strategy ID, replicate index, and replicate seed as one complete optional group and SHALL reject partial or inconsistent groups.

#### Scenario: Complete evaluation context is supplied

- **WHEN** all evaluation variables select a valid protocol replicate
- **THEN** the manifest records protocol identity and checksum, benchmark, strategy, replicate index, seed, and linked result path

#### Scenario: Evaluation context is partial

- **WHEN** one or more but not all required evaluation variables are set
- **THEN** the experiment is rejected before an output directory or long-running process is started
