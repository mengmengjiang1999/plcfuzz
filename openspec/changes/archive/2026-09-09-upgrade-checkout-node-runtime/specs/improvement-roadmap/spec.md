## MODIFIED Requirements

### Requirement: Roadmap theme count

The roadmap SHALL provide explicit counts of completed and pending themes, keep each pending theme independently actionable as one future OpenSpec change, and link each completed theme to its archived OpenSpec change.

#### Scenario: Contributor plans subsequent work

- **WHEN** a contributor reads the roadmap
- **THEN** the number, priority, and boundary of remaining themes are clear without reconstructing status from commit history

#### Scenario: Workflow runtime maintenance is completed

- **WHEN** the checkout action runtime upgrade is implemented, verified, archived, committed, and pushed
- **THEN** the roadmap reports fifteen completed themes and zero pending themes
