# MatIEC compatibility cases

These cases exercise the MatIEC version pinned in `third_party/matiec`.

- `legacy/` contains portable IEC 61131-3 programs intended to generate C for the PLC Robustness Lab/OpenPLC runtime.
- `experimental/` contains valid examples for MatIEC's opt-in `iec61131-3:2025-experimental` profile. They verify compiler compatibility but are not part of the default fuzzing corpus.

Run all cases from the repository root:

```bash
./scripts/validate_testcases.sh
```

The validator generates output in a temporary directory and does not overwrite `plclogic/`.

The repository-wide testcase inventory and metadata schema are documented in [`testcases/README.md`](../README.md). The validator checks that manifest before compiling this focused suite.
