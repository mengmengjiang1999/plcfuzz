## Context

Each typed history is a ten-slot ring containing copied input and output values. The current detector scans physical slots 0 through 9 regardless of how many samples have been written, and treats any adjacent output difference as a race. `BufferHistory::checkChange()` also recomputes every detector for logging, and `main` signals AFL through undefined behavior.

## Goals / Non-Goals

**Goals:**

- Compare only valid samples in chronological ring order.
- Keep the existing broad output-change heuristic while naming its result a candidate.
- Signal a selected fuzz candidate with defined process behavior.
- Make history behavior independently testable.

**Non-Goals:**

- Prove a data race or add schedule exploration.
- Change the ten-sample window size.
- Redesign OpenPLC buffer ownership.

## Decisions

- Store `sample_count` alongside the next-write index, capped at the window size.
- Iterate from the oldest valid ring slot and compare consecutive output snapshots.
- Keep inputs recorded for future oracle refinement, but this change continues to detect output transitions only.
- Cache each typed result once in `BufferHistory::checkChange()` before logging and combining it.
- Use `std::abort()` as the explicit AFL crash signal after printing and flushing the candidate message.

## Risks / Trade-offs

- [Natural stateful output transitions still produce candidates] → Document the heuristic limitation and use “candidate” terminology.
- [Changing initial-window behavior changes findings] → Record the commit as a new oracle baseline.
- [Full 1024-slot comparisons cost more] → Exit on the first difference; optimize representation separately if profiling justifies it.
