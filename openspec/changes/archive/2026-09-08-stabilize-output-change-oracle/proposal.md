## Why

The output-change heuristic compares all ten physical history slots even before they contain samples, producing candidates from zero initialization and obscuring ring-buffer chronology. Candidate reporting then deliberately dereferences null, which invokes undefined behavior instead of an explicit AFL-compatible failure.

## What Changes

- Track the number of valid history samples and compare only recorded outputs in chronological order.
- Preserve detection across ring-buffer wraparound.
- Evaluate each typed history once per report and emit a concise candidate summary.
- Replace the intentional null dereference with explicit process abortion in the fuzz target.
- Add focused history tests for empty, stable, changed, and wrapped histories.

## Capabilities

### New Capabilities

- `output-change-oracle`: Defines the bounded-history heuristic and explicit abnormal-termination signaling used to report generated-input candidates.

### Modified Capabilities

None.

## Impact

- Affects history storage and end-of-run candidate reporting.
- Removes false candidates caused solely by uninitialized history slots.
- Does not claim that output change is proof of a data race.
