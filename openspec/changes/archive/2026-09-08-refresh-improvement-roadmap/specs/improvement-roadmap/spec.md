## ADDED Requirements

### Requirement: Roadmap status accuracy
The maintained improvement roadmap SHALL separate verified completed themes from pending themes and SHALL not describe completed behavior as absent.

#### Scenario: Completed theme is reviewed
- **WHEN** a project improvement has an archived OpenSpec change and passing verification
- **THEN** the roadmap marks it completed and identifies the corresponding change

#### Scenario: Pending theme is reviewed
- **WHEN** an improvement has not yet completed the OpenSpec implementation and archive workflow
- **THEN** the roadmap keeps it in the pending section with a concise statement of the remaining outcome

### Requirement: Roadmap theme count
The roadmap SHALL provide an explicit count of pending themes and keep each theme independently actionable as one future OpenSpec change.

#### Scenario: Contributor plans subsequent work
- **WHEN** a contributor reads the roadmap
- **THEN** the number, priority, and boundary of remaining themes are clear without reconstructing status from commit history

### Requirement: Academic terminology
The roadmap SHALL describe the project using neutral academic software-quality terminology consistent with the repository communication specification.

#### Scenario: Roadmap wording is checked
- **WHEN** the repository wording check scans the roadmap
- **THEN** the roadmap passes without relying on a path exemption
