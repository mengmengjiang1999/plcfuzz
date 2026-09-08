## Context

Remote run `34234920327` reached the repository-input step and stopped because `scripts/check_ci_workflow.sh` invoked `rg`, which is not part of the Ubuntu 22.04 runner contract.

## Goals / Non-Goals

**Goals:** Install and structurally require the missing validation dependency.

**Non-Goals:** Change project behavior or broaden the workflow scope.

## Decisions

Add the Ubuntu `ripgrep` package to the existing dependency command because multiple maintained checks already use `rg`. Validate its presence in the workflow structure check to prevent accidental removal.

## Risks / Trade-offs

- **Package availability changes** → Ubuntu 22.04 provides the package from its standard repositories; the workflow will expose any future availability change.

## Migration Plan

Update both files, run local checks, archive, push, and observe the replacement remote run.

## Open Questions

None.
