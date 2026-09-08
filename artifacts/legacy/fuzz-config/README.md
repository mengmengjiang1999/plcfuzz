# Earlier automated-input configuration

This directory contains variants that are not compatible with the current PLC input serializer:

- `tagged-blocks.grammar` uses explicit block tags from an earlier input format;
- `plc_mutator-pre-refactor.cpp` is the custom mutator implementation before seeded-state and mapping-validation work.

The active files are `fuzz_config/plc.grammar` and `fuzz_config/plc_mutator.cpp`. Do not use the archived variants in current experiments; they are retained only for reproducibility and implementation comparison.
