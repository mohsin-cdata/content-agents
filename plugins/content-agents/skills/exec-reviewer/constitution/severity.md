# Severity

Every finding gets exactly one severity.

| Severity | Meaning | Examples |
|---|---|---|
| **blocker** | An exec would send it back. Must fix before exec review. | Wrong or blended stat (MSG-006); wrong product or capability name (MSG-002, MSG-003); specific connector count (MSG-004); claim of unreleased capability as GA (MSG-016); no clear message (PRI-003); competitor named in public copy (MSG-011) |
| **should-fix** | An exec would comment on it. Fix unless there's a reason. | Leads with benefit before mechanism (PRI-002); opens with category label instead of the problem (PRI-001, MSG-014); accusatory "you" in pain statements (VOI-006); words to avoid (VOI-004); weak or generic ending (PRI-008, VOI-017) |
| **nit** | Polish. Worth fixing, won't block. | Spaced em dashes (VOI-019); missing Oxford comma (VOI-020); casing (VOI-024); a stray qualifier (VOI-009) |

## Verdict rules

- **ready:** no blockers and at most two should-fix items.
- **needs work:** any blocker, or three or more should-fix items, but the core message and structure are sound.
- **rethink:** the message is unclear, wrong for the audience, or the structure doesn't support the argument. Line edits won't fix it.

Severity is about impact on the reader and the brand, not how many times a pattern appears. Group repeats of the same rule into one finding with a count.
