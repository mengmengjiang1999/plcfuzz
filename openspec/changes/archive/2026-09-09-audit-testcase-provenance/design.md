## Context

All 31 LD filenames match files in the official LDmicro repository. Thirteen are byte-equivalent after line-ending normalization at revision `5b058e05103d85a93c9b91807307b1bd44ee0925`; the others contain local edits or format conversion. The LDmicro manual grants GPL version 3 or later. Two archived ST files are recognizable conversions of the upstream `ctc_osr.ld` and `hello.ld` examples. Other ST files were introduced by the PLCFuzz repository author or were generated within the project.

## Goals / Non-Goals

**Goals:**

- Record stable upstream repository, revision, per-file path, license, and redistribution conditions.
- Resolve all catalog placeholder values without overstating byte identity.
- Preserve all test program contents.
- Make the audit repeatable with local validation.

**Non-Goals:**

- Alter test behavior or reactivate archived syntax.
- Claim authorship of LDmicro-derived material.
- Fetch upstream sources during routine validation.

## Decisions

### Separate catalog classification from evidence records

`manifest.tsv` remains the per-file inventory. `provenance.tsv` records one evidence row per origin class, while `LD-test/SOURCE.tsv` maps each local LD filename to its fixed upstream path and blob identifier. This avoids repeating long URLs in every catalog row while keeping joins machine-readable.

### Record local modification status

The mapping distinguishes normalized-equivalent files from modified local copies. All retain the same upstream origin and GPL terms, but the documentation will not imply that a changed local file is an untouched upstream sample.

### Keep full GPL version 3 text at repository root

The existing top-level `LICENSE` is the complete GPL version 3 text. The LDmicro evidence row records its later-version grant and links the fixed upstream license/manual evidence. Distribution guidance requires keeping both the license text and attribution/evidence records.

## Risks / Trade-offs

- Repository history cannot prove facts outside the recorded commits. The audit therefore cites the exact repository introduction commit for project-authored material and keeps external claims limited to verifiable LDmicro matches.
- Some LD files were locally modified. Their source mapping and local digest remain auditable, but results should not be attributed to an unchanged upstream snapshot.
