## Context

The launcher passes its output path directly to AFL++, and the reproducibility guide lists manual commands for metadata collection. The new design must create metadata before the long-running process, retain it when the process returns nonzero, and avoid changing preserved historical directories.

## Goals / Non-Goals

**Goals:**
- Give every new run an isolated directory by default.
- Record inputs, tool versions, machine context, command, and lifecycle status automatically.
- Finalize the manifest for normal and nonzero process exits.
- Refuse explicit directory reuse.

**Non-Goals:**
- Rewrite historical result directories.
- Upload manifests or contact external services.
- Interpret the scientific meaning of a run.

## Decisions

### Use a small Python lifecycle helper

`experiment_manifest.py create` validates paths, creates a timestamp/revision-prefixed unique directory, and writes an initial manifest. `finish` atomically replaces that manifest with completion time, status, and exit code.

### Keep compatibility at the parent-directory level

`FINDINGS_DIR` remains accepted but becomes the root below which a unique run directory is created. `EXPERIMENT_DIR` selects an exact new directory and is refused if it already exists.

### Finalize through a shell EXIT trap

The launcher stores the child result and finalizes the manifest from an EXIT trap, so ordinary success, ordinary failure, and interrupted shell exit retain a lifecycle record.

## Risks / Trade-offs

- Existing automation expecting AFL++ files directly below `FINDINGS_DIR` must follow the printed experiment path or read its manifest.
- Host information is descriptive and may vary across otherwise equivalent runs.
