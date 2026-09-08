## Context

AFL++'s `all` target lists both its regular compiler outputs and an LLVM recursive build. With outer parallelism enabled, the regular rule and `GNUmakefile.llvm` may write `afl-cc` at the same time. The resulting file passed a simple version command but failed when processing the first project compilation.

## Goals / Non-Goals

**Goals:**
- Produce the fixed compiler wrapper deterministically.
- Apply the same build order in CI and the reproducibility container.
- Retain parallelism for independent project build steps.

**Non-Goals:**
- Modify AFL++ source.
- Change the fixed release tag.
- Change instrumentation options.

## Decisions

### Serialize only the AFL++ outer build

CI declares `AFL_BUILD_JOBS: "1"` and passes it to the source build. The container uses `-j1`. This avoids shared-output overlap without changing `BUILD_JOBS` for project compilation.

### Check both maintained build definitions

The workflow structure checker verifies the CI variable, source-build command, and Dockerfile setting so the two reproducible paths remain aligned.

## Risks / Trade-offs

- AFL++ source compilation takes longer. The added time is acceptable because the result is deterministic and the workflow remains within its timeout.
