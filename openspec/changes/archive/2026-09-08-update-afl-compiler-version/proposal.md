## Why

Linux workflow run `34243063340` passed MatIEC, repository checks, the ordinary runtime, mapping generation, and the custom input component, then stopped when the pinned AFL++ `v4.10c` compiler wrapper exhausted its internal parameter table while handling a short compile command. The maintained build should use a current fixed release while preserving `v4.10c` only in historical experiment records.

## What Changes

- Update the active AFL++ source pin from `v4.10c` to `v5.03c`.
- Keep the release pinned in CI and the reproducibility container.
- Update active dependency documentation and structural checks.
- Preserve recorded historical tool versions in original experiment statistics and their explanatory note.

## Capabilities

### Modified Capabilities

- `linux-continuous-integration`: Requires the current fixed AFL++ `v5.03c` source release.

## Impact

The Linux workflow, reproducibility container, dependency documentation, roadmap summary, validation, and OpenSpec records are affected.
