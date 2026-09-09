# academic-project-communication Specification

## Purpose
TBD - created by archiving change clarify-academic-project-scope. Update Purpose after archive.
## Requirements
### Requirement: Prominent academic scope
The project SHALL state before operational instructions that it is an academic software-robustness prototype intended only for authorized work in isolated simulation or laboratory environments.

#### Scenario: Reader opens the README
- **WHEN** a reader reviews the project introduction
- **THEN** the academic purpose, authorization boundary, isolation expectation, and non-production status are visible without following another link

### Requirement: Neutral maintained terminology

All project-authored tracked text, maintained paths, and project-owned identifiers SHALL describe automated input generation and observed software behavior using neutral, technically precise quality-assurance terms and SHALL exclude unrelated operational-risk framing. Exact externally required identifiers and preserved raw records MAY remain only within an explicit compatibility or provenance boundary.

#### Scenario: Repository terminology check

- **WHEN** project-authored maintained text, a maintained path, or a project-owned identifier contains a prohibited or deprecated phrase
- **THEN** the automated terminology check reports its location and fails

#### Scenario: Required external identifier

- **WHEN** an externally defined command, environment variable, ABI export, or raw measurement field is required for interoperability or reproducibility
- **THEN** the exact name remains and the surrounding maintained interface uses neutral terminology

### Requirement: Required external terminology context
The project SHALL preserve exact third-party identifiers only where required for a working interface or authentic raw measurement, and SHALL remove unrelated archived prose from the current tree.

#### Scenario: Standard AFL identifier
- **WHEN** an AFL++ ABI symbol or required environment variable contains upstream terminology
- **THEN** the identifier remains exact and nearby maintained prose uses neutral quality-assurance language

#### Scenario: Raw measurement field
- **WHEN** an unmodified AFL++ statistics file contains an upstream-defined field name
- **THEN** the data remains unchanged and the README identifies the directory as raw third-party output

#### Scenario: Unrelated historical prose
- **WHEN** an archived prose document discusses a subject outside the implemented offline robustness workflow
- **THEN** it is absent from the current tree and remains recoverable through Git history

### Requirement: Contributor terminology guidance
The repository SHALL provide contributor guidance for maintaining the academic scope and preferred terminology.

#### Scenario: Contributor edits public documentation
- **WHEN** a contributor prepares maintained project text
- **THEN** the repository provides preferred terms, terms requiring context, and the boundary between active and archival material
