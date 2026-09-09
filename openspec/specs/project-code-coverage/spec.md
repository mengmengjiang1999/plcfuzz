# project-code-coverage Specification

## Purpose
TBD - created by archiving change add-project-code-coverage. Update Purpose after archive.
## Requirements
### Requirement: Versioned project coverage boundary

The repository SHALL maintain a machine-readable coverage scope that whitelists maintained C++ and Python sources, including modular runtime layers, and excludes MatIEC, generated PLC sources, generated binding code, archived material, and external measurement tooling.

#### Scenario: Collector encounters build dependencies outside the project scope

- **WHEN** full-runtime coverage data includes MatIEC or generated source paths
- **THEN** those paths are absent from project coverage totals and recorded in the exclusion inventory

#### Scenario: Runtime module is added

- **WHEN** an entry-point responsibility moves into a maintained runtime module
- **THEN** the versioned C++ whitelist and baseline scope digest include that module before the change is archived

### Requirement: C++ unit and runtime integration coverage

The coverage workflow SHALL collect C++ execution data from maintained unit tests and a normal-runtime integration check that exercises the runtime entry point, input application, and structured variable-map generation.

#### Scenario: Full runtime is measured

- **WHEN** coverage collection runs on the authoritative Linux environment
- **THEN** a representative PLC program is generated, its map is created, the maintained runtime is built in an isolated directory, and valid plus invalid input paths are checked

### Requirement: Python tool coverage

The coverage workflow SHALL run maintained Python tests under Coverage.py and limit the Python report to source files declared in the project scope.

#### Scenario: Python report is generated

- **WHEN** all Python checks complete
- **THEN** JSON, XML, and HTML reports contain maintained Python tools without test files in the measured totals

### Requirement: Separate machine-readable results

The workflow SHALL emit filtered C++ LCOV/HTML output, Python JSON/XML/HTML output, and a deterministic summary containing separate line totals, percentages, scope identity, exclusions, integration outcomes, and baseline comparisons.

#### Scenario: A report is validated

- **WHEN** the summary and its declared artifacts are checked
- **THEN** missing artifacts, inconsistent totals, out-of-scope files, and mismatched scope or baseline identities fail validation

### Requirement: Progressive baseline policy

The repository SHALL commit an observed baseline with an explicit enforcement mode and SHALL initially report differences without rejecting a revision solely because its coverage percentage is lower.

#### Scenario: Initial coverage is below the recorded baseline

- **WHEN** the baseline uses `report-only` enforcement
- **THEN** the summary records the negative difference and validation still succeeds if the report is otherwise valid
