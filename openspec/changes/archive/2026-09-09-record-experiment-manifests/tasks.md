## 1. Manifest Lifecycle

- [x] 1.1 Create unique default and explicit run-directory handling
- [x] 1.2 Record revisions, tool version, target digest, machine, command, paths, timing, and environment
- [x] 1.3 Finalize status, completion time, and exit code atomically

## 2. Launcher and Tests

- [x] 2.1 Integrate create/finalize lifecycle into `runfuzz.sh`
- [x] 2.2 Preserve `FINDINGS_DIR` as the run root and document `EXPERIMENT_DIR`
- [x] 2.3 Add deterministic lifecycle and non-overwrite tests

## 3. Documentation and Completion

- [x] 3.1 Update reproducibility guidance and roadmap status
- [x] 3.2 Run unit, shell, wording, and strict OpenSpec checks
- [x] 3.3 Archive the OpenSpec change and validate resulting specifications
- [x] 3.4 Commit and push the completed experiment-manifest change
