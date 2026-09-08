## Context

The first terminology pass improved maintained files but deliberately kept unrelated literature notes and older thesis prose behind context banners. The user has now required repository-wide cleanup because those documents cover a different subject from the implemented offline robustness workflow. Raw AFL++ measurement files also contain upstream-defined field names that cannot be rewritten without ceasing to be authentic data.

## Goals / Non-Goals

**Goals:**

- Remove unrelated operational-risk prose from the current repository tree.
- Use consistent reliability and quality-assurance terms across project-authored tracked text.
- Scan all relevant tracked files automatically, including OpenSpec history.
- Keep raw measurement formats identifiable as unmodified third-party output.

**Non-Goals:**

- Rewriting AFL++ raw statistics, path conventions, ABI symbols, or binary content.
- Rewriting third-party license text or vendored compiler source semantics.
- Removing the academic coverage-guided testing workflow.

## Decisions

1. Delete the unrelated literature review, research prompt, long thesis fragment, and obsolete script note from the current tree. They remain recoverable from Git history and are not needed for building or reproducing PLCFuzz.
2. Replace project-authored ambiguous words in README, contributor guidance, fixtures, source comments, OpenSpec records, and short experiment summaries.
3. Expand `check_project_wording.sh` to obtain tracked files from Git and scan text broadly. Exclude raw experiment-output directories, preserved compiler/binary artifacts, the third-party submodule, and the check script's own pattern declaration.
4. Add a README note that raw AFL++ statistics retain upstream schema field names solely for measurement integrity.
5. Replace incidental comments in tracked MatIEC snapshot material only when doing so does not modify executable binaries or parser behavior.

## Risks / Trade-offs

- **Removing notes reduces convenient local context** → Git history retains every removed file; maintained documentation covers current workflows.
- **Broad scans can report ordinary words used in another sense** → Match a curated set of unambiguous phrases and review additions explicitly.
- **Raw data retains upstream field names** → Exclude only fixed data directories and document why they are outside project-authored prose checks.

## Migration Plan

No runtime migration is required. Links to removed research notes are deleted from README. Contributors run the expanded wording check before committing.

## Open Questions

None.
