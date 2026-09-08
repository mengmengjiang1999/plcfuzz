## Context

Exploration counted 40 tracked ST files and 31 tracked LD files. A fresh scan with the pinned MatIEC confirmed 23 legacy-profile ST cases pass; the focused suite adds four experimental-profile passes; and 13 archived cases remain incompatible. LD files use another source format and are not inputs to MatIEC. Existing documentation records only groups, and provenance review is intentionally a later roadmap theme.

## Goals / Non-Goals

**Goals:**

- Catalog all 71 source testcases with explicit expected behavior and metadata status.
- Detect drift between the manifest and Git-tracked testcase files.
- Verify declared ST expectations on demand.
- Preserve every testcase byte-for-byte.

**Non-Goals:**

- Resolve unverified source or redistribution details in this theme.
- Modify archived syntax or promote archived cases into active suites.
- Compile LD source through MatIEC.

## Decisions

1. Use tab-separated UTF-8 text with a fixed header. Python's standard `csv` module parses it without a third-party package, paths remain readable, and the current filenames contain no tabs.
2. Include both `path` and `original_path`. For active cases they match; archival rows preserve the pre-archive location documented by the earlier move.
3. Use `to-review` for facts not established by repository evidence. This makes incomplete provenance visible without making unsupported claims.
4. Compare the manifest to `git ls-files` rather than filesystem traversal, so ignored build outputs cannot enter the catalog accidentally.
5. Keep structural checks fast by default. `--verify-compiler` uses temporary output directories and checks all ST rows against their declared result.
6. Call the structural check from `validate_testcases.sh`; retain that script's focused eight-case compiler run for concise normal feedback.

## Risks / Trade-offs

- **The initial catalog contains many review-needed fields** → Theme 8 is explicitly responsible for resolving them; the catalog makes the backlog measurable.
- **Expected-rejection cases depend on compiler diagnostics** → Check only acceptance versus rejection, not unstable diagnostic wording.
- **A TSV row could be edited incorrectly** → Validate column count, enumerated values, path extension, uniqueness, and tracked-tree equality.

## Migration Plan

Add the manifest and checker, integrate the fast check, run full compiler verification once, document the schema, and leave all testcase source content unchanged.

## Open Questions

None.
