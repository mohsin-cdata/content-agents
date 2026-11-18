-- Content agents memory store (Neon Postgres, reached through the Connect AI workspace).
-- Run once in the Neon SQL Editor. Connect AI can insert/update/select but not create tables.
-- Text columns are used instead of uuid/jsonb so Connect AI inserts stay simple.

CREATE TABLE IF NOT EXISTS agent_rules (
    rule_id        text PRIMARY KEY,               -- e.g. VOI-031; same ID as a bundled rule overrides it
    agent          text NOT NULL DEFAULT 'exec-reviewer',
    scope          text NOT NULL,                  -- all | blog | sales-email | ... | lens:marketing
    rule_text      text NOT NULL,
    severity       text,                           -- blocker | should-fix | nit
    status         text NOT NULL DEFAULT 'active', -- active | retired | merged (folded into plugin files)
    source_feedback_id text,
    approved_by    text,
    created_at     timestamptz NOT NULL DEFAULT now(),
    merged_in_version text                         -- plugin version that absorbed it; then status = merged
);

CREATE TABLE IF NOT EXISTS review_runs (
    run_id             text PRIMARY KEY,
    agent              text NOT NULL,
    agent_version      text NOT NULL,
    content_type       text,
    lens               text,
    title              text,
    verdict            text,                       -- ready | needs_work | rethink
    verdict_reason     text,
    top_issue_rule_ids text,                       -- comma-separated rule IDs
    surface            text,                       -- claude-code | claude-ai | cowork | word | powerpoint | outlook
    created_at         timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS feedback (
    feedback_id    text PRIMARY KEY,
    run_id         text,
    category       text NOT NULL,                  -- new_rule | rubric_change | anti_pattern | worked_example | severity_fix | false_alarm
    rule_id        text,
    content_type   text,
    feedback_text  text NOT NULL,
    submitted_by   text,
    status         text NOT NULL DEFAULT 'new',    -- new | duplicate | merged | in_review | accepted | rejected | conflict
    triage_note    text,
    created_at     timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS facts (
    fact_id      text PRIMARY KEY,
    subject      text NOT NULL,                    -- e.g. connect-ai
    attribute    text NOT NULL,                    -- e.g. accuracy_benchmark
    value        text NOT NULL,
    source_url   text,
    verified_at  timestamptz,
    status       text NOT NULL DEFAULT 'active'
);

CREATE INDEX IF NOT EXISTS idx_agent_rules_active ON agent_rules (agent, status);
CREATE INDEX IF NOT EXISTS idx_feedback_status ON feedback (status);
