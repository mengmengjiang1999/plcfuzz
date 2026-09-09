## Why

`runfuzz.sh` currently writes directly to one findings directory and relies on the operator to record tool revisions, target identity, machine context, and commands by hand. Reusing a path can mix runs, while incomplete notes make cross-version academic comparison unreliable.

## What Changes

- Create a unique directory for every automated input-generation run.
- Write a versioned JSON manifest before the run and finalize its status and exit code afterward.
- Record repository and MatIEC revisions, AFL++ version, target SHA-256, machine information, duration, timeout, paths, selected environment, and command.
- Preserve `FINDINGS_DIR` as the parent directory compatibility setting and add `EXPERIMENT_DIR` for an explicit new directory.
- Add deterministic tests, documentation, and roadmap status.

## Capabilities

### New Capabilities

- `experiment-run-manifest`: Defines isolated run directories and complete lifecycle metadata.

## Impact

The experiment launcher, a new manifest helper, tests, documentation, roadmap, and OpenSpec records are affected.
