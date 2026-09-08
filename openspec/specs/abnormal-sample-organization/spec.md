# abnormal-sample-organization Specification

## Purpose
TBD - created by archiving change add-runtime-diagnostics. Update Purpose after archive.
## Requirements
### Requirement: Exact deduplication and stable reproduction
The organizer SHALL deduplicate source files by SHA-256 and retain only samples that produce the same signal on every configured reproduction run.

#### Scenario: Duplicate and ordinary-error inputs are present
- **WHEN** the organizer evaluates the source directory
- **THEN** duplicates run once and ordinary nonzero exits are excluded

### Requirement: Behavior-preserving minimization
The organizer SHALL remove bytes deterministically only when the reduced sample preserves the confirmed signal, subject to a configured evaluation limit.

#### Scenario: A smaller signal-preserving sample exists
- **WHEN** the reducer tests removable byte ranges
- **THEN** the stored sample contains no accepted unnecessary range found within the limit

### Requirement: Reproduction manifest
The organizer SHALL record the repository revision, MatIEC revision, target SHA-256, source and minimized sample digests, signal, seed, selected environment, repetition count, timeout, and command.

#### Scenario: A sample is retained
- **WHEN** organization completes
- **THEN** its case directory contains the minimized sample, diagnostic text, and JSON metadata linked from the top-level manifest

### Requirement: Source preservation
The organizer SHALL read source samples without modifying or deleting them and SHALL refuse a non-empty output directory.

#### Scenario: An output directory already contains files
- **WHEN** organization starts
- **THEN** it exits with an explanation before running the target
