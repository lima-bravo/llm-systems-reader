<!-- markdownlint-disable MD022 MD032 -->
# REVIEW_WEEK11 — Detailed Chapter Audit

## Scorecard (0-3)
- Math continuity: 2
- Derivation sufficiency: 2
- Notation discipline: 2
- Assumption/claim typing: 2
- Writing clarity/unambiguity: 2
- VOICE `Setting the Scene` compliance: 3

## Detailed Issues
1. **P1** Cost equation omits `/10^6` scaling while prices are per-million tokens.
2. **P1** Ledger retry expectation uses infinite geometric form, but body defines truncated retries.
3. **P1** Effective service-rate ledger term undercounts input tokens vs body equation.
4. **P1** “Invariant” terminology used for stopping predicates; rename to termination conditions.
5. **P1** Wire-protocol guarantee phrasing too absolute across providers/versions.
6. **P1** Retry independence assumption unrealistic under correlated outages; add sensitivity caveat.
7. **P2** Trust-union type system is underspecified; define unit/canonicalization.
8. **P2** Queueing section heading mismatches dual RPM/TPM derivation scope.
9. **P2** Prompt-cache latency statement over-generalized; add workload constraints.
10. **P2** Tool protocol presented as universal; label as canonical variant.
11. **P2** MCP “informed consent” framing risks implying sufficiency.
12. **P2** Dense parenthetical prose reduces scan clarity.

## VOICE.md Audit (`Setting the Scene`)
- Pass: four beats complete and ordered.
- Pass: concrete developer workflow opening.
- Pass: lineage and transitions are clear.
- Pass: style guardrails respected.
- Fail: a few ecosystem convergence claims need confidence qualifiers.

## Ambiguity Audit
1. “wire standard” conflates de-facto adoption and formal standardization.
2. “any layer replaceable without disturbance” overstates modularity.
3. “prompt caching not micro-optimization” workload-dependent.
4. “coding agent not autocomplete” rhetorical, non-operational.
5. “contracts; everything else detail” underweights security-critical implementation details.

## Cross-Week Dependency Checks
### Incoming
- Week 6 latency decomposition assumptions.
- Week 9 trust invariant extension.
- Week 10 governance control/audit mappings.
- Week 8 alignment and reliability effects.

### Outgoing
- Week 12 failure taxonomy mapping (tool loops, schema mismatches, injection).
- Week 10 assurance evidence from Week 11 telemetry/control equations.

### Symbols/Equations to regression-check after edits
- `eq:wk11-latency`, `eq:wk11-cost`, `eq:wk11-mm1`, `eq:wk11-mueff`, `eq:wk11-retry-count`, `eq:wk11-cost-retry`, `eq:wk11-trust-union`, termination equations.

## Undergraduate Learning-Curve Risk Addendum

### Learning Objective -> Math Exposition Gaps
- **LO: latency decomposition usage**; **risk point:** `TTFT/TPOT` appears without measured trace example; **fix:** add concrete trace with token counts and computed latency.
- **LO: cost arithmetic with cached/uncached tokens**; **risk point:** mixed price units confuse dimensional consistency; **fix:** add unit-check line and full billing example.
- **LO: retry expectation and cost impact**; **risk point:** truncated geometric derivation is abrupt; **fix:** derive `P(K=k)` -> `E[K]` including retry cap.
- **LO: quota and queue reasoning**; **risk point:** M/M/1 assumptions not reintroduced; **fix:** add queueing-assumption recap and utilization interpretation.
- **LO: agent loop termination logic**; **risk point:** invariant language is proof-heavy; **fix:** add loop progression example showing each budget gate firing.
- **LO: MCP trust boundary extension**; **risk point:** set-union formalism is abstract; **fix:** add one-source -> multi-source trust-union derivation walkthrough.

### Body-of-Work Reminder Insertions
- Before queue equations, re-anchor to classical queueing approximations and limits.
- Before constrained outputs, remind sampling/constraint lineage from decoding literature.
- Before agent loop section, restate agent-pattern progression (ReAct/Reflexion lineage).
- Before MCP security formalism, remind prompt-injection boundary work and Week 9 invariant.

### Prerequisite Recap Boxes To Add
- Queueing basics (`lambda`, `mu`, `rho`) for API contexts.
- Geometric/truncated-geometric expectation refresher.
- JSON schema vs factual correctness distinction.
