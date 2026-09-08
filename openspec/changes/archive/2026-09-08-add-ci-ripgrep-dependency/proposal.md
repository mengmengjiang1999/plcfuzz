## Why

The first Linux workflow run stopped in its structure check because `rg` was used by maintained validation scripts but `ripgrep` was absent from the runner dependency list. The workflow cannot provide complete Linux evidence until every invoked tool is installed.

## What Changes

- Install `ripgrep` with the other Ubuntu build dependencies.
- Extend the workflow structure check to require that package explicitly.
- Re-run local validation and the remote Linux workflow.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `linux-continuous-integration`: Requires the workflow to install every command used by maintained validation scripts before running them.

## Impact

Only the Linux workflow, its structure check, and OpenSpec records are affected.
