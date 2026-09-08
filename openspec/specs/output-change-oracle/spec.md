# output-change-oracle Specification

## Purpose
TBD - created by archiving change stabilize-output-change-oracle. Update Purpose after archive.
## Requirements
### Requirement: Valid-sample comparison
The output-change oracle SHALL compare only history samples that have actually been recorded and SHALL require at least two samples before reporting a candidate.

#### Scenario: Empty or single-sample history
- **WHEN** the oracle contains fewer than two recorded output snapshots
- **THEN** it reports no output-change candidate

### Requirement: Chronological ring comparison
The oracle SHALL compare consecutive recorded outputs in chronological order across ring-buffer wraparound.

#### Scenario: Change after window wrap
- **WHEN** more samples than the history capacity are recorded and a retained output transition exists
- **THEN** the oracle reports an output-change candidate

### Requirement: Stable-history result
The oracle SHALL report no candidate when every retained output snapshot is identical.

#### Scenario: Repeated stable output
- **WHEN** two or more identical output snapshots are recorded
- **THEN** the oracle reports no output-change candidate

### Requirement: Explicit fuzz failure signal
The fuzz runtime MUST use a defined process-abort operation to turn an output-change candidate into an AFL-observable crash.

#### Scenario: Candidate is selected for reporting
- **WHEN** the end-of-run oracle reports an output-change candidate
- **THEN** the runtime emits a candidate message and terminates through `abort()`
