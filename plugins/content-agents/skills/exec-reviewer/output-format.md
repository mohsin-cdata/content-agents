# Output format

Use this structure exactly, in this order. Keep it scannable.

```
## Exec review: <short title of the draft>

**Verdict:** Ready | Needs work | Rethink - <one-line reason>
**Content type:** <type> | **Lens:** <marketing | sales | social> | **Assumptions:** <audience/goal if inferred, else "none">

### Top issues
1. **[blocker|should-fix] <issue in one line>** (`RULE-ID`, <lens area: messaging | accuracy | clarity | voice | structure>)
   Fix: <what to do, concrete>
   Why: <one sentence on why an exec cares>
(max 5; omit the section if none)

### Line notes
| # | Quote | Note | Rule | Severity |
|---|---|---|---|---|
| 1 | "<exact quote from draft>" | <suggested change> | VOI-004 | nit |
(max 15; group repeats)

### What's working
- <specific thing to keep, with a short quote if useful> (2 to 4 items)

### Questions an exec would ask
1. <question the creator should be able to answer before submitting> (2 to 4 items)

---
Run ID: <uuid or "not logged"> | Rules: v0.1.0<, plus N live updates>
To flag a miss or disagree: /content-agents:feedback <run id> <what was wrong>
```

## Rules for the output

1. Quotes are exact, character for character, from the draft.
2. Every top issue and line note cites a rule ID or `JUDGMENT`.
3. No rewriting the whole draft. Short before/after suggestions only.
4. If the draft is in Word, PowerPoint, or Outlook and the user asks, the same findings can be applied as comments; keep the same IDs.
