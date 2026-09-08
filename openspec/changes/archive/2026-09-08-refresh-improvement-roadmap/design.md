## Context

Repository exploration compared `docs/IMPROVEMENTS.md` with archived OpenSpec changes and the current specifications. Three roadmap entries are already implemented and verified, while eleven distinct themes remain. Leaving all entries in a single future-work list makes progress and ordering unclear.

## Goals / Non-Goals

**Goals:**

- Record the three completed themes with links to their archived changes.
- Present exactly eleven pending themes, each suitable for one subsequent change.
- Preserve priority ordering and neutral academic software-quality language.

**Non-Goals:**

- Implement any of the eleven pending themes in this documentation-only change.
- Change runtime behavior, build outputs, or experiment data.
- Promise an implementation sequence that overrides evidence found during later exploration.

## Decisions

1. Add a concise status summary at the top of the roadmap so counts are visible immediately.
2. Move verified work into a completed section instead of deleting it, preserving the rationale and a traceable link to OpenSpec history.
3. Number pending themes from 1 through 11 and retain P0/P1/P2 grouping. The numbering gives every subsequent change a stable planning boundary.
4. Treat project-wide instrumentation and abnormal-termination sample organization as one theme because they share verification configuration and experiment metadata requirements.

## Risks / Trade-offs

- **The roadmap can become stale again** → Require each future change to update its own roadmap entry before archive.
- **Later exploration may split a theme** → Keep the count as the current plan and update it through another reviewed change if evidence requires a different boundary.

## Migration Plan

Replace the existing future-only list with completed and pending sections, run repository wording validation, archive this change, and use the revised list as the queue for subsequent work.

## Open Questions

None.
