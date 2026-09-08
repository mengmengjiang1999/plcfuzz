# linux-continuous-integration Specification

## Purpose
TBD - created by archiving change add-linux-ci. Update Purpose after archive.
## Requirements
### Requirement: Authoritative Linux workflow
The repository SHALL run its maintained verification workflow on Ubuntu 22.04 for pushes to `main` and pull requests targeting `main`.

#### Scenario: Relevant revision is submitted
- **WHEN** a push or pull request targets the maintained branch
- **THEN** GitHub Actions starts the Linux quality workflow with read-only repository permissions

### Requirement: Pinned toolchain inputs
The workflow SHALL initialize the recorded MatIEC submodule commit and build the recorded AFL++ 4.10c tag from source.

#### Scenario: Toolchain is prepared
- **WHEN** the workflow reaches build setup
- **THEN** compiler inputs come from repository-recorded immutable revisions rather than an unspecified package release

### Requirement: Complete verification sequence
The workflow SHALL run MatIEC tests, project validation scripts, ST conversion, normal runtime build, structured mapping generation, custom-mutator build, and instrumented-target build.

#### Scenario: Any maintained stage fails
- **WHEN** a command in the ordered verification sequence returns a failure
- **THEN** the workflow fails and later success is not reported for that revision

### Requirement: Build artifact assertions
The workflow SHALL verify that the normal runtime, mapping CSV, custom-mutator library, and instrumented target exist after their build stages.

#### Scenario: Build command exits without its expected output
- **WHEN** an expected artifact is absent
- **THEN** the workflow fails explicitly
