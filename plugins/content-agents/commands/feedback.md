---
description: Log feedback on an exec review (a miss, a false alarm, a new rule) to the shared feedback queue
argument-hint: "[run id] [what the review got wrong or missed]"
---

Log feedback for the Exec Reviewer.

Input: $ARGUMENTS

1. Work out these fields from the input and the conversation. Ask only for what's missing and can't be inferred:
   - `run_id`: the review's run ID (optional)
   - `category`: one of `new_rule`, `rubric_change`, `anti_pattern`, `worked_example`, `severity_fix`, `false_alarm`
   - `rule_id`: the rule it concerns, if any (e.g. VOI-004), else empty
   - `content_type`: blog, sales-email, marketing-email, social, web-copy, deck, paid-ad
   - `feedback_text`: the correction in the person's own words, one to three sentences
   - `submitted_by`: the user's name or email if known, else "unknown"
2. Show the row and ask "Log this? (yes/no)".
3. On yes, insert it with the Connect AI workspace tools, using parameters:

```sql
INSERT INTO [PostgreSQL-Neon].[public].[feedback]
  ([feedback_id], [run_id], [category], [rule_id], [content_type], [feedback_text], [submitted_by], [status])
VALUES (@feedback_id, @run_id, @category, @rule_id, @content_type, @feedback_text, @submitted_by, 'new')
```

`feedback_id` is a new UUID. Confirm with the ID. If the workspace tools aren't available, print the row as a block the user can paste into the feedback channel instead.

Never edit the plugin's rule files from this command. Rule changes go through the admin's weekly triage.
