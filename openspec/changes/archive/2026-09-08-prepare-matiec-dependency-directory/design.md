## Context

MatIEC's generated recursive Makefiles compile `stage4/stage4.cc` from within `stage4/generate_c` and write dependency metadata one directory above. Automake creates dependency directories for the current subdirectory, but this cross-directory target does not ensure that `stage4/.deps` exists on a fresh Linux checkout.

## Goals / Non-Goals

**Goals:**
- Make a fresh Linux MatIEC build independent of leftover generated directories.
- Keep the correction in the project-owned setup entry point.
- Detect accidental removal with a lightweight repository check.

**Non-Goals:**
- Modify the pinned MatIEC submodule in this change.
- Change compiler behavior or test inputs.

## Decisions

### Prepare the directory after configuration

The setup script creates `stage4/.deps` immediately after `./configure`. This places the compatibility step next to the generated build preparation and before any target can write dependency metadata.

### Validate the exact setup contract

The existing Linux workflow structure checker verifies the setup line. This keeps the regression check fast while the remote workflow exercises the actual fresh checkout.

## Risks / Trade-offs

- The directory is an implementation detail of the generated Makefiles. The explicit step is small and can be removed when the pinned MatIEC build system creates it itself.
