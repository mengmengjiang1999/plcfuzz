## Why

The repository's maintained interface still uses its historical prototype name and project-owned identifiers that do not clearly communicate an offline academic robustness laboratory. A neutral public vocabulary is needed before new evaluation protocols and reports make those names more widely embedded.

## What Changes

- Adopt **PLC Robustness Lab** as the maintained display name and `scripts/plc-lab` as the canonical command.
- Rename project-owned input-generation directories, build targets, artifacts, variables, and documentation to neutral laboratory terminology.
- Keep the former command and environment names as documented compatibility aliases that emit migration guidance.
- Preserve exact AFL++ commands, environment variables, exported ABI symbols, and raw measurement fields because they are externally defined interfaces.
- Extend automated terminology checks to cover maintained paths and project-owned identifiers while explicitly allowlisting required external and compatibility names.

## Capabilities

### New Capabilities

- `neutral-project-interface`: Defines the maintained display name, command, artifact vocabulary, compatibility behavior, and external-interface boundary.

### Modified Capabilities

- `academic-project-communication`: Extends neutral terminology requirements to maintained paths and project-owned identifiers.
- `deterministic-input-transformer`: Uses the neutral capability and component name while retaining deterministic behavior and a mapping-variable compatibility alias.
- `experiment-run-manifest`: Uses neutral observation, input-sample, and input-transformer names in new manifests while accepting former launch variables.
- `instrumented-build-configuration`: Uses the neutral project compiler selector and accepts the former selector as a compatibility alias.
- `linux-continuous-integration`: Invokes the canonical command and validates neutral artifact paths.
- `repository-source-layout`: Defines `input_generation/` as the maintained input-generation source directory.
- `runtime-diagnostic-builds`: Places the diagnostic input transformer below its neutral build directory.
- `runtime-timing`: Uses neutral timing variables and accepts former names as compatibility aliases.
- `unified-command-entrypoint`: Changes the canonical dispatcher to `scripts/plc-lab` while retaining the former command as a compatibility wrapper.

## Impact

- Affects the README, contributor guidance, build and experiment scripts, CI, tests, input-generation source paths, generated artifact names, and project-owned environment variables.
- Existing local automation can continue through compatibility aliases, but new documentation and output use only the neutral interface.
- Required AFL++ interfaces and preserved historical measurements remain byte- and name-compatible.
