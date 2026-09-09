## ADDED Requirements

### Requirement: Container construction runs the maintained Linux flow

The reproducibility image build SHALL run repository checks, MatIEC validation, unit tests, normal runtime and mapping builds, diagnostic builds, an instrumented runtime build, and representative playback for both runtime targets.

#### Scenario: Required stage fails

- **WHEN** any required command fails its declared success condition
- **THEN** image construction stops and no successful acceptance result is emitted

#### Scenario: Representative playback reaches its expected candidate condition

- **WHEN** the preserved representative input is run with either maintained runtime target
- **THEN** acceptance requires exit status 134 and the output-change candidate message

### Requirement: Accepted image retains an internal report

A successfully constructed image SHALL contain a machine-readable report listing schema version, success status, platform, commands, tool versions, and resolved package versions.

#### Scenario: Report is inspected

- **WHEN** a user extracts the internal acceptance report
- **THEN** the report identifies every required command and the software versions used to run it

### Requirement: Host acceptance records image identities

The host acceptance command SHALL record the pinned base-image ID and final local image content digest together with the internal report.

#### Scenario: Host acceptance completes

- **WHEN** the `linux/amd64` image build and internal flow succeed
- **THEN** an ignored output directory contains a combined JSON manifest with base and final image identities

### Requirement: Container inputs exclude transient state

The image context SHALL exclude VCS metadata, local build products, experiment outputs, and generated acceptance records.

#### Scenario: Local output changes

- **WHEN** only excluded transient output changes between builds
- **THEN** that output is not copied into the reproducibility image context
