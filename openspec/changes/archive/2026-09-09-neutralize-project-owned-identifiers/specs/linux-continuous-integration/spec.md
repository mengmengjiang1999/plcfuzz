## MODIFIED Requirements

### Requirement: Unified command use in CI

Linux CI SHALL invoke maintained build and test workflows through `scripts/plc-lab`, use canonical neutral build-step names, and verify the neutral input-transformer and instrumented-runtime artifact paths.

#### Scenario: Workflow structure is reviewed

- **WHEN** the Linux workflow is checked
- **THEN** maintained commands use `scripts/plc-lab` and no compatibility command or deprecated project-owned build step is used
