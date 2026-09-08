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
Project-authored active documentation and runtime messages SHALL describe automated input generation and observed software behavior using neutral, technically precise quality-assurance terms.

#### Scenario: Heuristic output change
- **WHEN** the runtime reports an output-change candidate
- **THEN** it describes a candidate or abnormal-behavior sample without claiming a confirmed defect or operational intent

#### Scenario: Abnormal process ending
- **WHEN** maintained documentation describes an AFL++ process-ending sample
- **THEN** it uses “abnormal termination” or “failure sample” in prose

### Requirement: Required external terminology context
The project SHALL preserve required third-party identifiers, exact publication titles, and historical records while identifying their external or archival context.

#### Scenario: Standard AFL identifier
- **WHEN** an AFL++ ABI symbol, environment variable, or output convention contains legacy terminology
- **THEN** the identifier remains exact and nearby prose explains its testing role where ambiguity is likely

#### Scenario: Archived research prose
- **WHEN** an archived note retains historical terminology or an exact quoted title
- **THEN** the file displays an archival-context notice and is not presented as current operating guidance

### Requirement: Contributor terminology guidance
The repository SHALL provide contributor guidance for maintaining the academic scope and preferred terminology.

#### Scenario: Contributor edits public documentation
- **WHEN** a contributor prepares maintained project text
- **THEN** the repository provides preferred terms, terms requiring context, and the boundary between active and archival material
