# content-agents

Claude plugin for CData content agents. The first agent, **Exec Reviewer**, gives content creators an exec-quality pre-review of a draft before it goes to an executive.

## What you get

- `/content-agents:review <draft or file>`: verdict (ready, needs work, or rethink), ranked top issues, line notes tied to exact quotes, what's working, and the questions an exec would ask. Every finding cites a rule ID.
- `/content-agents:feedback <run id> <what was wrong>`: logs a miss or a false alarm to the shared feedback queue.
- The `exec-reviewer` skill also triggers on its own when you ask Claude to review a CData draft.

## Try it locally (Claude Code)

```bash
# optional: enables live rule updates and run logging through Connect AI
export CDATA_CAI_BASIC_AUTH="<base64 of email:PAT>"

claude --plugin-dir ./plugins/content-agents
# then: /content-agents:review path/to/draft.md
```

## Layout

```
.claude-plugin/marketplace.json
plugins/content-agents/
  .claude-plugin/plugin.json
  .mcp.json                       # Connect AI workspace, credential from env var
  commands/review.md, feedback.md
  skills/exec-reviewer/
    SKILL.md, output-format.md
    constitution/                 # principles, voice, messaging, severity, anti-patterns
    rubrics/                      # blog, email, social, web-copy, deck
    lenses/                       # marketing, sales, social
db/schema.sql                     # Neon tables (run once)
evals/exec-reviewer/cases.jsonl   # seed eval cases
docs/ARCHITECTURE.md
```

## Status

v0.1.0 is a starting point built from the brand voice guide and the messaging guide. Lenses are placeholders until exec reviewers supply their own instructions and seed reviews. See `docs/ARCHITECTURE.md` for how context and feedback flow.
