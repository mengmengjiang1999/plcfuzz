## MODIFIED Requirements

### Requirement: Pinned toolchain inputs
The workflow SHALL initialize the recorded MatIEC submodule commit, build it with deterministic single-job ordering, and build the recorded AFL++ 4.10c tag from source.

#### Scenario: Toolchain is prepared
- **WHEN** the workflow reaches build setup
- **THEN** compiler inputs come from repository-recorded immutable revisions and MatIEC uses its deterministic build setting
