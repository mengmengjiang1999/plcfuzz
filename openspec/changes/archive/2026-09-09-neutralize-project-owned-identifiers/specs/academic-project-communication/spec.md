## MODIFIED Requirements

### Requirement: Neutral maintained terminology

All project-authored tracked text, maintained paths, and project-owned identifiers SHALL describe automated input generation and observed software behavior using neutral, technically precise quality-assurance terms and SHALL exclude unrelated operational-risk framing. Exact externally required identifiers and preserved raw records MAY remain only within an explicit compatibility or provenance boundary.

#### Scenario: Repository terminology check

- **WHEN** project-authored maintained text, a maintained path, or a project-owned identifier contains a prohibited or deprecated phrase
- **THEN** the automated terminology check reports its location and fails

#### Scenario: Required external identifier

- **WHEN** an externally defined command, environment variable, ABI export, or raw measurement field is required for interoperability or reproducibility
- **THEN** the exact name remains and the surrounding maintained interface uses neutral terminology
