## MODIFIED Requirements

### Requirement: Neutral maintained terminology
All project-authored tracked text SHALL describe automated input generation and observed software behavior using neutral, technically precise quality-assurance terms and SHALL exclude unrelated operational-risk framing.

#### Scenario: Heuristic output change
- **WHEN** the runtime reports an output-change candidate
- **THEN** it describes a candidate or abnormal-behavior sample without claiming a confirmed defect or operational intent

#### Scenario: Abnormal process ending
- **WHEN** maintained documentation describes an AFL++ process-ending sample
- **THEN** it uses “abnormal termination” or “failure sample” in prose

#### Scenario: Repository wording check
- **WHEN** project-authored tracked text contains a prohibited ambiguous phrase
- **THEN** the automated wording check reports its path and fails

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
