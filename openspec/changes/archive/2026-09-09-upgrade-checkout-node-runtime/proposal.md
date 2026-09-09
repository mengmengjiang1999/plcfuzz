## Why

The Linux quality workflow uses `actions/checkout@v4`, whose Node.js 20 runtime now produces a deprecation annotation on GitHub-hosted runners. The checkout action's documented v5 line uses Node.js 24 and is compatible with current GitHub-hosted runners.

## What Changes

- Upgrade the Linux workflow checkout step from `actions/checkout@v4` to `actions/checkout@v5`.
- Extend the workflow structure check so the supported checkout major is enforced and the deprecated major cannot return unnoticed.
- Record the maintenance result in the improvement roadmap.

## Capabilities

### Modified Capabilities

- `linux-continuous-integration`: The authoritative Linux workflow uses the Node.js 24 checkout action line.
- `improvement-roadmap`: The completed workflow-runtime maintenance is recorded with archived OpenSpec evidence.

## Impact

- Only GitHub Actions workflow bootstrap behavior changes; project build and test commands remain unchanged.
- GitHub-hosted runners satisfy the checkout action's minimum runner version requirement.
