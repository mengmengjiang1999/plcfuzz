## ADDED Requirements

### Requirement: Supported checkout action runtime

The authoritative Linux workflow SHALL use `actions/checkout@v5`, retain recursive submodule checkout, and keep repository permissions read-only.

#### Scenario: Workflow bootstrap runs

- **WHEN** a push or pull request starts the Linux quality workflow on the GitHub-hosted Ubuntu runner
- **THEN** repository checkout uses the action line backed by Node.js 24 without requesting write permission

#### Scenario: Workflow structure is checked

- **WHEN** the repository CI structure check reads the workflow
- **THEN** it requires `actions/checkout@v5` and rejects the deprecated v4 line
