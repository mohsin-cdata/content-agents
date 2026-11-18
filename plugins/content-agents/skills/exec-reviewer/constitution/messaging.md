# Messaging rules

Source: Connect AI Gateway messaging guide (public-safe extract). Internal competitive, customer, and call data are intentionally not included in this repo.

## Top-line message

**MSG-001** The gateway that makes AI more accurate, for less. Three benefits: **more accurate**, **under control**, **for less**. Lead any asset with one benefit; the other two support it.

How they fit: accuracy makes the cost savings safe (a cheaper model can answer correctly when context is attached), and control makes both safe to run at scale.

## Names (use exactly)

- **MSG-002 Product:** CData Connect AI on first mention, then Connect AI. Marketed as Connect AI Gateway. Don't write "CData AI Gateway" or "the AI Gateway".
- **MSG-003 Capability names:** Gateways (LLM Gateway and MCP Gateway), Context Engine, Controls & Security, Virtual Data Layer. Flag "Model Gateway" and suggest LLM Gateway.
- **MSG-004 Connector count:** never a specific number ("300+", "400+"). Use "hundreds of sources", "hundreds of data sources", or "hundreds of connectors".
- **MSG-005 Don't invent compound or umbrella product names.**

## Proof points (quote exactly, never mix)

| Stat | Exact claim |
|---|---|
| Accuracy | 98.5% correct across 378 enterprise queries, against 65-75% for other MCP providers |
| Tokens | 97.6% fewer tokens on the same multi-source question (183,541 tokens and 22 tool calls down to 4,427 and one) |
| Model cost | 178x cost spread for the same correct answer across 22 models; 21 of 22 returned identical results |

- **MSG-006** Use these numbers exactly. Don't round, blend, or swap them (e.g. "97% fewer tokens", "175x", or calling accuracy "178 times" are all wrong).
- **MSG-007** Don't use benchmark numbers unqualified; say what was measured.
- **MSG-008** Don't imply 98.5% on day one for a customer's own environment.
- **MSG-009** Match the number to the room: architects care about multi-step reliability, finance cares about cost, security cares about unauthorized writes and identity.

## Say / avoid

- **MSG-010 Say:** "down to the record", "every request", "one control plane", "live data, no stale copies", "right model for the task", "context that compounds".
- **MSG-011 Avoid:** "unlimited" or "guarantee" language on accuracy; naming competitors in public copy (contrast against the approach, not a vendor).
- **MSG-012 Routing:** today it's admin-configured rules plus priority failover. Approved phrasing: "policy now, intelligent later". Flag anything implying intelligent routing is live.
- **MSG-013 Record-level security:** don't say "we enforce at the record level". Say the source system applies that user's own entitlements and Connect AI masks at the cell.
- **MSG-014 Open in the buyer's language.** Lead with governance, control, sprawl, token cost, or data leakage before the category label "AI gateway".
- **MSG-015 Live by default.** Don't imply Connect AI creates another copy of the data; caching is opt-in per dataset.
- **MSG-016 Roadmap.** Don't present roadmap or early-access capabilities as generally available. If unsure, flag as "verify GA status".

## Tone for gateway copy

- **MSG-017** Calm, precise, systems-minded. Confident, not hyped. Let numbers and product UI do the persuading. Concrete nouns: policy, record, token, trace, identity.
- **MSG-018** Feeling to evoke: relief ("I can say yes to AI without it becoming my incident").
