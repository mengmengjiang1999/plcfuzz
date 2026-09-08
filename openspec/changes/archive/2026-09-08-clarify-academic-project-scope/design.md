## Context

PLCFuzz is an academic prototype built from standard compiler, runtime, and coverage-guided testing components. Some existing descriptions foreground failure categories and use legacy wording without the surrounding laboratory context. Public repository review often evaluates isolated excerpts, so intent and operating boundaries need to be locally clear.

## Goals / Non-Goals

**Goals:**

- Make academic purpose, authorization, and isolation constraints visible before setup instructions.
- Adopt consistent software-quality terminology in maintained project text.
- Distinguish project-authored language from unavoidable third-party identifiers and publication titles.
- Label historical prose without rewriting the substance of archived research records.

**Non-Goals:**

- Renaming AFL++, its ABI functions, environment variables, or on-disk output conventions.
- Altering quoted paper titles or falsifying historical notes.
- Claiming certification, production suitability, or complete defect detection.

## Decisions

1. Add a concise “research scope” section near the README introduction. It states offline/simulated use, authorization, and exclusion of operational deployment.
2. Add `CONTRIBUTING.md` with a maintained terminology table. Prefer “robustness test”, “automated input generation”, “abnormal termination”, “candidate sample”, and “anomalous output”.
3. Update active documentation and project-authored runtime messages. Standard identifiers such as `openplc_fuzz`, `afl_custom_fuzz`, and preserved directory names remain unchanged because renaming would break tooling or reproducibility.
4. Prefix archival thesis fragments and literature notes with context notices. Exact paper titles and code/API excerpts remain intact and are identified as quoted or historical material.
5. Add a lightweight repository wording check for maintained public files, with explicit exclusions for archival quotations and required identifiers.

## Risks / Trade-offs

- **Neutral wording can become technically vague** → Keep precise failure mechanics where they are needed, but pair them with scope and use candidate language for heuristic findings.
- **Automated word checks can flag legitimate identifiers** → Limit checks to selected project-authored prose and explicit phrases rather than broad substrings.
- **Historical files retain older terminology** → Add visible archival notices and keep them outside current operating guidance.

## Migration Plan

No runtime migration is required. Contributors use the new terminology guide for future maintained documentation and messages.

## Open Questions

None.
