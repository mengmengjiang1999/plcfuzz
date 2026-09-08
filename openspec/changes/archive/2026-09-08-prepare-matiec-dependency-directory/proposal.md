## Why

Linux workflow run `34237254012` reached MatIEC's serial stage-four build but stopped when a generated rule attempted to write `stage4/.deps/stage4.Tpo`. A fresh checkout does not contain that generated dependency directory, so the setup entry point must prepare it after configuration and before compilation.

## What Changes

- Create MatIEC's stage-four dependency directory after `configure` and before `make`.
- Add a structural check for the preparation step.
- Document the clean-build requirement in the MatIEC workflow specification.

## Capabilities

### Modified Capabilities

- `matiec-build-workflow`: Requires the setup entry point to prepare generated dependency directories needed by a fresh build.

## Impact

The MatIEC setup script, workflow structure check, OpenSpec records, and Linux verification are affected.
