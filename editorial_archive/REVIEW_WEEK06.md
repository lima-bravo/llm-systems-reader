<!-- markdownlint-disable MD022 MD032 -->
# REVIEW_WEEK06 — Detailed Chapter Audit

## Scorecard (0-3)
- Math continuity: 1
- Derivation sufficiency: 2
- Notation discipline: 1
- Assumption/claim typing: 2
- Writing clarity/unambiguity: 2
- VOICE `Setting the Scene` compliance: 2

## Detailed Issues
1. **P0** Mixtral active-parameter claim appears materially incorrect; correct with explicit counting convention.
2. **P1** World-size/parallelism notation is incomplete when EP/SP are layered; provide full formula.
3. **P1** Expert-count notation drifts (`N_e` vs `N`) across equations.
4. **P1** Load-balancing loss derivation overstates fixed-point rigor; classify as heuristic with assumptions.
5. **P1** Arithmetic-intensity formula appears dimensionally wrong; rewrite with explicit FLOPs/bytes terms.
6. **P1** Inference section mixes training-memory coefficients; separate regimes.
7. **P1** Figure caption count mismatch (“six dimensions” vs five listed).
8. **P2** Cost claims in prologue are over-specific without scope.
9. **P2** All-to-all asymptotics omit two-phase constant factor in headline explanation.
10. **P2** Ledger symbol set diverges from chapter symbols; normalize.
11. **P2** “Small drop rates benign” lacks threshold guidance.

## VOICE.md Audit (`Setting the Scene`)
- Pass: four-beat structure and concrete framing.
- Pass: lineage present with named predecessors.
- Pass: transition to math and failure mode framing present.
- Fail: some quantitative claims need tighter uncertainty qualifiers.

## Ambiguity Audit
1. “order of magnitude more complex” -> complexity metric undefined.
2. “memory-equivalent” ZeRO/TP claim -> assumptions unclear.
3. “interconnect-bound on typical clusters” -> scope missing.
4. “8-16 experts sweet spot” -> appears universal.
5. “small drop rates benign” -> task dependence omitted.
6. “batching single largest lever” -> over-generalized superlative.

## Cross-Week Dependency Checks
### Incoming
- Week 2 memory and scaling formulas.
- Week 4 FlashAttention and bandwidth framing.
- Week 5 scaling narrative terminology.

### Outgoing
- Week 7 quantization/adaptation economics.
- Week 8 alignment stability under routing shifts.
- Week 9 serving architecture claims.
- Week 10 conditional-compute governance framing.

### Symbols/Equations to regression-check after edits
- Router, capacity, load-balancing, arithmetic-intensity, and memory equations; expert-count symbols.

## Undergraduate Learning-Curve Risk Addendum

### Learning Objective -> Math Exposition Gaps
- **LO: identify compute/memory/bandwidth bottlenecks**; **risk point:** conceptual table lacks threshold arithmetic; **fix:** add one full bottleneck calculation case.
- **LO: choose composite parallelism strategy**; **risk point:** axis-by-axis text lacks integrated decision procedure; **fix:** add constraint-driven decision example.
- **LO: understand ZeRO staging math**; **risk point:** stage transitions are quick; **fix:** add Stage 0->3 memory formula ladder.
- **LO: MoE forward pass with top-k routing**; **risk point:** renormalized gate math is abstract; **fix:** add token-level `N_e=4, k=2` walkthrough.
- **LO: load-balancing auxiliary loss**; **risk point:** gradient-direction intuition is too advanced without toy; **fix:** add 2-expert toy derivative steps.
- **LO: “FLOPs saved, memory not saved” insight**; **risk point:** asymmetry is asserted with big numbers first; **fix:** add small numeric table before large-scale case.

### Body-of-Work Reminder Insertions
- Before TP/PP/DP section, restate Megatron/GPipe lineage.
- Before ZeRO accounting, remind Week 2 optimizer-state decomposition.
- Before MoE equations, re-anchor to conditional-compute origins.
- Before sparse scaling laws, remind dense Chinchilla structure and changed variables.

### Prerequisite Recap Boxes To Add
- Communication primitives (`all-reduce`, `all-gather`, `all-to-all`) with cost intuition.
- Softmax gating and truncation renormalization basics.
- Throughput accounting fundamentals (FLOPs/token, bytes/token, arithmetic intensity).
