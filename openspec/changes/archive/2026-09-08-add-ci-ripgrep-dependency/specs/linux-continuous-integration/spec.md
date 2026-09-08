## MODIFIED Requirements

### Requirement: Complete verification sequence
The workflow SHALL install every command used by maintained validation scripts, then run MatIEC tests, project validation scripts, ST conversion, normal runtime build, structured mapping generation, custom-mutator build, and instrumented-target build.

#### Scenario: Required validation command is unavailable
- **WHEN** a maintained validation script depends on a command not present in the base runner
- **THEN** the workflow installs that command before invoking the script

#### Scenario: Any maintained stage fails
- **WHEN** a command in the ordered verification sequence returns a failure
- **THEN** the workflow fails and later success is not reported for that revision
