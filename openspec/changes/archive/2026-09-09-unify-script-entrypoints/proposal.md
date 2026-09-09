## Why

The repository exposes overlapping root scripts with inconsistent naming and assumptions. Some call internal build helpers directly, some expect the former fixed `findings/default` layout, and users must inspect implementation files to discover the supported sequence.

## What Changes

- Add one documented `scripts/plcfuzz` command with setup, build, run, experiment, replay, test, batch, diagnostics, and line-count subcommands.
- Move maintained run, experiment, replay, and batch behavior behind semantic scripts in `scripts/`.
- Convert historical root entry points to small compatibility wrappers that print a deprecation notice and forward arguments and environment unchanged.
- Update CI, README, reproducibility guidance, and internal messages to use the unified command.
- Add structure and dispatch tests that prevent maintained behavior from returning to root compatibility wrappers.

## Capabilities

### New Capabilities

- `unified-command-entrypoint`: One discoverable command surface for supported project workflows and explicit compatibility behavior.

### Modified Capabilities

- `experiment-run-manifest`: The unified experiment command preserves the isolated directory and manifest lifecycle.
- `linux-continuous-integration`: CI uses the maintained unified command instead of deprecated root wrappers.

## Impact

- Existing root command names continue to work but emit a concise migration notice.
- Script users get stable semantic subcommands and help text.
- The batch workflow uses isolated experiment directories instead of assuming `findings/default`.
