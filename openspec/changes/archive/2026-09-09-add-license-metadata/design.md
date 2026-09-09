## Context

The repository combines original PLCFuzz implementation work, inherited OpenPLC and MatIEC/Beremiz files, a MatIEC submodule, generated data, historical results, and collected test material. Adding the same inline header everywhere would erase those distinctions and could alter fixtures or generated artifacts.

## Goals / Non-Goals

**Goals:**

- Express copyright and SPDX licensing for clearly project-authored paths in a standard machine-readable form.
- Keep the applicable complete license text easy to locate.
- Fail validation if a maintained project-authored path silently leaves the declared coverage.
- Preserve all existing third-party attribution.

**Non-Goals:**

- Decide provenance or redistribution status for collected test material; that is theme 8.
- Re-license inherited sources, the MatIEC submodule, generated outputs, or historical results.
- Insert comments into binary files, data formats, or executable fixtures.

## Decisions

### Use `REUSE.toml` aggregate annotations

REUSE aggregate annotations apply SPDX metadata to explicit path groups without rewriting every file. The list will cover active original implementation, tests, scripts, build definitions, project documentation, workflow configuration, and OpenSpec records. Paths with inherited or unresolved ownership remain outside those groups.

### Use `GPL-3.0-only` for original work

The repository contains the complete GNU GPL version 3 text but no project-level later-version grant. The narrow matching SPDX expression is therefore `GPL-3.0-only`. Existing upstream files retain their own identifiers and later-version terms where stated.

### Validate boundaries, not only syntax

The checker will parse `REUSE.toml`, verify required entries, require all annotated paths to be tracked, confirm representative project-owned files are covered, and confirm representative inherited files remain outside the aggregate annotations with their notices intact.

## Risks / Trade-offs

- Aggregate annotations are less visible inside individual files. A repository-level standard file and CI-compatible checker provide one stable source of truth.
- Authorship classification can evolve. Explicit path entries and validation make future additions deliberate instead of silently assigning terms.
