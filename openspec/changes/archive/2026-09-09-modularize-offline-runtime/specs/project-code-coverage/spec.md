## MODIFIED Requirements

### Requirement: Versioned project coverage boundary

The repository SHALL maintain a machine-readable coverage scope that whitelists maintained C++ and Python sources, including modular runtime layers, and excludes MatIEC, generated PLC sources, generated binding code, archived material, and external measurement tooling.

#### Scenario: Collector encounters build dependencies outside the project scope

- **WHEN** full-runtime coverage data includes MatIEC or generated source paths
- **THEN** those paths are absent from project coverage totals and recorded in the exclusion inventory

#### Scenario: Runtime module is added

- **WHEN** an entry-point responsibility moves into a maintained runtime module
- **THEN** the versioned C++ whitelist and baseline scope digest include that module before the change is archived
