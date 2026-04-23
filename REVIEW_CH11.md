# REVIEW_CH11 — Week 11 Access APIs, Agents, MCP

## Scope
- Reviewed: `weeks/week11_access_apis_agents_mcp.tex`
- Rubric basis: `REVIEW.md`

## Rubric Scores (0–3)
- Derivation completeness: 1
- Notation consistency: 2
- Assumption transparency: 2
- Theorem/empirical/heuristic separation: 2
- Example sufficiency: 2
- Bridge quality to next chapters: 2
- Pass status: **Fail**

## What Is Strong
- Comprehensive practical coverage of modern access stack and MCP.
- Strong treatment of operational failure modes and observability.
- Good protocol-level specificity and implementation realism.

## Concrete Gaps
- Chapter is primarily architectural and operational; mathematical scaffolding is thin:
  - Missing formal latency/cost models for queueing, retries, and streaming.
  - Limited formal definitions for loop termination guarantees and budget constraints.
  - Several performance/security claims are practical but not parameterized.
- Symbol discipline could improve across layers (`TTFT`, `TPOT`, RPM/TPM, budgets) via a unified notation table.
- Claim labels remain implicit (protocol facts vs observed provider behavior vs recommended patterns).

## Priority Edits
1. Add notation/assumptions section for latency, throughput, retry, token-cost variables.
2. Include a compact queuing model for request latency under RPM/TPM constraints.
3. Add formal loop budget/termination invariant for tool-using agents.
4. Add one expected-cost equation with retries + streaming interruption probability.
5. Add explicit threat model notation for tool-output prompt injection.
6. Label protocol guarantees versus provider-specific behavior in each subsection.
7. Add one numeric worked example for prompt caching impact (cost and latency).
8. Add “proved vs assumed” recaps for API contract and MCP sections.

## Expected Reader Benefit
- Converts a strong operational chapter into one that also matches the book’s mathematical followability standard.
