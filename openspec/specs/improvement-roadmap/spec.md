# improvement-roadmap Specification

## Purpose
TBD - created by archiving change refresh-improvement-roadmap. Update Purpose after archive.
## Requirements
### Requirement: Roadmap status accuracy
The maintained improvement roadmap SHALL separate verified completed themes from pending themes and SHALL not describe completed behavior as absent.

#### Scenario: Completed theme is reviewed
- **WHEN** a project improvement has an archived OpenSpec change and passing verification
- **THEN** the roadmap marks it completed and identifies the corresponding change

#### Scenario: Pending theme is reviewed
- **WHEN** an improvement has not yet completed the OpenSpec implementation and archive workflow
- **THEN** the roadmap keeps it in the pending section with a concise statement of the remaining outcome

### Requirement: Roadmap theme count

The roadmap SHALL provide explicit counts of completed and pending themes, keep each pending theme independently actionable as one future OpenSpec change, and link each completed theme to its archived OpenSpec change.

#### Scenario: Contributor plans subsequent work

- **WHEN** a contributor reads the roadmap
- **THEN** the number, priority, and boundary of remaining themes are clear without reconstructing status from commit history

#### Scenario: Linux toolchain caching is completed

- **WHEN** exact toolchain build caches are implemented, verified, archived, committed, and pushed
- **THEN** the roadmap reports sixteen completed themes and zero pending themes

### Requirement: Academic terminology
The roadmap SHALL describe the project using neutral academic software-quality terminology consistent with the repository communication specification.

#### Scenario: Roadmap wording is checked
- **WHEN** the repository wording check scans the roadmap
- **THEN** the roadmap passes without relying on a path exemption

### Requirement: Coverage completion status

The roadmap SHALL mark project code coverage complete after its scope, reports, integration checks, baseline, and CI artifact have been validated, and SHALL show runtime modularization as the only pending theme.

#### Scenario: Coverage change is archived

- **WHEN** a contributor reads the maintained roadmap
- **THEN** it reports twenty-two completed themes and one pending theme
