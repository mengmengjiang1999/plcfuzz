## Why

The repository still contains older literature notes and raw prose whose subject is unrelated to PLCFuzz's offline compiler and runtime-quality experiments. Even with context banners, isolated keyword scans can classify the project by those unrelated documents instead of its implemented behavior.

## What Changes

- Remove unrelated literature prompts, review notes, and thesis fragments from the current tree while retaining them in Git history.
- Replace remaining ambiguous project-authored phrases in active text, test fixtures, comments, and OpenSpec records with software-quality terminology.
- Expand the wording check to scan all tracked project-authored text instead of a short allowlist.
- Exclude only immutable external data formats, preserved binary/compiler artifacts, and standard third-party field names from the wording check.
- Document that raw AFL++ statistics use upstream field names and are data, not project claims.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `academic-project-communication`: Tightens repository-wide wording rules and removes unrelated archived prose rather than relying only on context notices.

## Impact

Project documentation, historical notes, wording validation, selected fixtures/comments, and prior OpenSpec wording are affected. Runtime behavior and retained experimental measurements are unchanged.
