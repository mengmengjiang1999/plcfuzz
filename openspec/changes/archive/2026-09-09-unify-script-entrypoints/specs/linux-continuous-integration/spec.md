## ADDED Requirements

### Requirement: Unified command use in CI
Linux CI SHALL invoke maintained build and test workflows through `scripts/plcfuzz` rather than deprecated root compatibility wrappers.

#### Scenario: CI workflow structure is checked
- **WHEN** the Linux workflow is validated
- **THEN** its project build steps use canonical unified subcommands and contain no deprecated root invocation
