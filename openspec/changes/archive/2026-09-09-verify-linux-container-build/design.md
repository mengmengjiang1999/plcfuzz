## Context

CI already exercises the main Linux commands, while `Dockerfile.repro` pins the base image and installs additional OpenPLC and AFL++ prerequisites. The two paths overlap but the container currently stops before building PLCFuzz targets. A local image ID is a content-addressed digest, although it is not a registry manifest digest.

## Goals / Non-Goals

**Goals:**

- Execute the complete maintained workflow inside a pinned `linux/amd64` image.
- Fail the image build when any required verification stage fails.
- Retain exact commands, platform facts, tool versions, package versions, and status in JSON.
- Record both the pinned base-image ID and final local image content digest.
- Keep repeated host invocations from modifying tracked source files.

**Non-Goals:**

- Publish the image to a registry.
- Snapshot every Ubuntu package archive by hash.
- Run a long automated-input experiment during image construction.

## Decisions

### Image construction is the acceptance gate

The Dockerfile calls the container-internal acceptance script in a `RUN` layer. A failed command prevents creation of the final image, so an image digest is only available after all stages pass.

### Two-level reporting

The internal report records commands and software versions that are visible inside Linux. The host script extracts that report, adds the resolved base-image ID, final image ID, requested platform, tag, and completion time, and writes a combined manifest.

### Representative playback instead of a long experiment

The acceptance flow runs both normal and instrumented targets with a preserved seed. That seed is expected to produce the runtime's output-change candidate signal, so acceptance requires both exit status 134 and the corresponding message. Any other status or missing message fails the build. This checks executable behavior without starting a time-based experiment during image construction.

### Stable build context

`.dockerignore` removes VCS metadata, local build products, experiment outputs, and the human acceptance record. The Dockerfile and maintained source inputs remain in the context.

## Risks / Trade-offs

- `linux/amd64` emulation on ARM hosts is slower than a native amd64 builder.
- The final local image ID verifies local content but is not a published multi-platform registry digest.
- Ubuntu package repositories are not frozen; the report captures resolved versions so later differences are visible.
