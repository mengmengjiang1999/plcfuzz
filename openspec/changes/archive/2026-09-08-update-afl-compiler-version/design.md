## Context

The CI workflow intentionally builds AFL++ from a fixed tag. The former `v4.10c` wrapper does not complete the current Ubuntu 22.04 compile command, while the official `v5.03c` release retains the required `source-only` build target. Historical statistics must remain byte-for-byte records of the tool version used for those earlier experiments.

## Goals / Non-Goals

**Goals:**
- Use a current, explicit AFL++ release for maintained builds.
- Keep CI and the reproducibility container on the same release.
- Preserve historical measurement files and their original version metadata.

**Non-Goals:**
- Rewrite historical results.
- Change custom input component behavior.
- Track a moving branch.

## Decisions

### Pin `v5.03c`

The workflow and Dockerfile use the exact official release tag `v5.03c`. This retains reproducibility while updating the compiler wrapper.

### Separate current and historical versions in documentation

Dependency tables and current CI descriptions name `v5.03c`. The historical environment paragraph continues to state that the preserved experiment statistics record `4.10c`.

## Risks / Trade-offs

- Generated instrumentation can differ between releases. New runs must record `v5.03c`, while comparisons with preserved runs must account for their recorded `4.10c` toolchain.
