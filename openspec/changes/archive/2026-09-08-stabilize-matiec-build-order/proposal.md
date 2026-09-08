## Why

Linux workflow run `34235439886` showed that MatIEC's generated Makefiles can start two directory targets that both build `stage4.o`; with two jobs, one target attempted to write a dependency file before its directory existed. A clean MatIEC build therefore needs a deterministic default independent from the parallelism used by other project builds.

## What Changes

- Make MatIEC builds use one job by default.
- Add a dedicated `MATIEC_BUILD_JOBS` override instead of sharing the project's general `BUILD_JOBS` value.
- Keep other CI build stages at their existing parallelism.
- Document and structurally verify the MatIEC setting.

## Capabilities

### New Capabilities

- `matiec-build-workflow`: Defines deterministic MatIEC build ordering and its explicit parallelism override.

### Modified Capabilities

- `linux-continuous-integration`: Requires the authoritative workflow to use the deterministic MatIEC build setting.

## Impact

The MatIEC setup script, Linux workflow, documentation, validation, and OpenSpec records are affected.
