## Why

Linux workflow run `34239590034` built MatIEC and passed its compiler-library tests, then stopped while linking the top-level tests because `error_exit` was unresolved. The symbol is present in `compiler/libcompiler.a`, but that static archive appears before the archive that first references it. The setup entry point needs a portable test-link compatibility setting for Linux's left-to-right static archive resolution.

## What Changes

- Append MatIEC's compiler library to the test link through Automake's `LIBS` variable.
- Add a structural regression check for the test-link setting.
- Specify that the setup workflow must support left-to-right static archive linkers.

## Capabilities

### Modified Capabilities

- `matiec-build-workflow`: Requires top-level MatIEC tests to receive the compiler library after their other static archives.

## Impact

The MatIEC setup script, workflow structure check, OpenSpec records, and Linux verification are affected.
