## Context

The latest completed Linux workflow succeeded but reported that `actions/checkout@v4` targets deprecated Node.js 20. The official checkout documentation identifies v5 as the Node.js 24 migration line and requires Actions Runner v2.327.1 or newer.

## Goals / Non-Goals

**Goals:**

- Remove the Node.js 20 action-runtime annotation.
- Preserve recursive submodule checkout and read-only repository permissions.
- Make the required checkout major machine-checkable.

**Non-Goals:**

- Change the Ubuntu runner image.
- Add a project Node.js dependency.
- Change any build, test, or experiment command.

## Decisions

### Use checkout v5

Version 5 is the smallest documented major upgrade that moves checkout to Node.js 24. Later checkout majors add behavior outside this maintenance goal, so they are not included here.

### Keep the existing trust boundary

The workflow continues to use `contents: read`, standard push and pull-request triggers, and recursive checkout of the recorded MatIEC submodule. No credentials or write permissions are added.

## Risks / Trade-offs

- Self-hosted runners older than v2.327.1 would not support the action runtime. This repository uses GitHub-hosted `ubuntu-22.04`, so that compatibility boundary does not affect the maintained workflow.
