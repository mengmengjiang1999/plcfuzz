## MODIFIED Requirements

### Requirement: Pinned toolchain inputs
The workflow SHALL initialize the recorded MatIEC submodule commit, build it with deterministic single-job ordering, and build the recorded AFL++ `v5.03c` tag from source.

#### Scenario: A workflow run starts from a fresh checkout
- **WHEN** dependency setup completes
- **THEN** MatIEC matches the repository gitlink and AFL++ is checked out at `v5.03c`
