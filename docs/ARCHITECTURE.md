# Architecture (v0.1.0)

## Where each kind of context lives

| Tier | What | Where | When it loads | Who changes it |
|---|---|---|---|---|
| 1. Core constitution | Principles, voice, messaging, severity, anti-patterns, rubrics, lenses, output format | Plugin files in this repo (`plugins/content-agents/skills/exec-reviewer/`) | In full, at the start of every review (small; no retrieval needed) | Admin, through a pull request and a version bump |
| 2. Live rule updates | Rules approved since the last plugin release | Neon `agent_rules` table | One `SELECT` at the start of every review | Admin, after weekly triage (an approved rule goes live without a re-release) |
| 3. On-demand context | Fact registry, past runs, feedback | Neon `facts`, `review_runs`, `feedback` | Only when the user asks or a later agent needs it | Agents (insert), admin (triage) |

Access to Neon goes only through the Connect AI workspace `CAI-agent-workspace` (connection `PostgreSQL-Neon`), so the plugin holds no database credentials.

## Release loop

```
review -> exec reviews as usual -> gap logged via /feedback (Neon feedback)
      -> weekly triage -> approved rule inserted into agent_rules (live immediately)
      -> at release: rules folded into plugin files, status = merged, version bump, evals run
```

Rules folded into files are marked `merged`, which keeps tier 2 small and fast.

## Sources

| Source | Status |
|---|---|
| GitHub | Repo for plugin files (managed with the local `gh` CLI for now; Connect AI write access later) |
| Neon (PostgreSQL-Neon) | Rules, runs, feedback, facts |
| SharePoint | Not enabled by IT; not needed for v0.1 |

## Distribution

1. Local: `claude --plugin-dir ./plugins/content-agents`
2. Team: `/plugin marketplace add <owner>/<repo>`, then `/plugin install content-agents@cdata-content-agents`
3. Org-wide: a Claude org Owner syncs this repo; it appears in claude.ai, Cowork, and the Office add-ins.

The plugin's `.mcp.json` reads the Connect AI credential from the `CDATA_CAI_BASIC_AUTH` environment variable (base64 of `email:PAT`). Outside Claude Code, users connect Connect AI through their own connector; without it, the reviewer still works and simply skips tiers 2 and 3.
