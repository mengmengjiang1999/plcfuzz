## MODIFIED Requirements

### Requirement: Complete verification sequence

The workflow SHALL install every command used by maintained validation scripts, then run MatIEC tests, project validation scripts, ST conversion, normal runtime build, structured mapping generation, input-transformer build, project-scoped C++ and Python coverage, and instrumented-target build.

#### Scenario: Required validation command is unavailable

- **WHEN** a maintained validation script depends on a command not present in the base runner
- **THEN** the workflow installs that command before invoking the script

#### Scenario: Any maintained stage fails

- **WHEN** a command in the ordered verification sequence returns a failure
- **THEN** the workflow fails and later success is not reported for that revision

### Requirement: Build artifact assertions

The workflow SHALL verify that the normal runtime, mapping CSV, input-transformer library, project coverage summary, and instrumented target exist after their build stages, and SHALL upload the coverage report directory as a retained CI artifact.

#### Scenario: Build command exits without its expected output

- **WHEN** an expected artifact is absent
- **THEN** the workflow fails explicitly

#### Scenario: Coverage collection completes

- **WHEN** the project coverage command succeeds
- **THEN** CI validates its summary and uploads the report bundle without repository write permission
