## Why

Linux workflow run `34241785679` completed MatIEC and the repository checks, then stopped while linking the ordinary runtime. The generated standard library declares three TCP helper symbols even when the selected PLC example does not call them. Their former implementation is intentionally archived, so the offline academic runtime needs explicit compatibility definitions.

## What Changes

- Add offline compatibility definitions for the three generated TCP helper declarations.
- Return a consistent unavailable result without opening sockets or exchanging data.
- Include the compatibility source in the explicit runtime source manifest.
- Add a unit test for the offline result contract.
- Document the offline communication boundary.

## Capabilities

### New Capabilities

- `offline-communication-compatibility`: Defines link compatibility and unavailable results for generated communication helpers.

## Impact

The runtime source manifest, a new compatibility translation unit, unit tests, documentation, and OpenSpec records are affected.
