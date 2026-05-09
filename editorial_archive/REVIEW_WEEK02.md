<!-- markdownlint-disable MD022 MD032 -->
# REVIEW_WEEK02 — Detailed Chapter Audit

## Scorecard (0-3)
- Math continuity: 2
- Derivation sufficiency: 2
- Notation discipline: 1
- Assumption/claim typing: 2
- Writing clarity/unambiguity: 2
- VOICE `Setting the Scene` compliance: 3

## Detailed Issues
1. **P0** `eq:week2-sgd` has malformed context index; make token index explicit.
2. **P1** `eq:week2-empirical-loss` sampling form mismatches Week 1 token-normalized objective; align notation.
3. **P1** SGD unbiasedness/variance claim is under-qualified; attach assumptions.
4. **P1** Adam bias-correction described as unbiased under nonstationarity; downgrade to approximate.
5. **P1** Memory budget equation scope is unclear for sharded training; label as unsharded baseline.
6. **P1** LR schedule caption symbols conflict with notation block; standardize.
7. **P2** Activation checkpointing savings/overhead stated as fixed constants; convert to ranges with conditions.
8. **P2** Scaling-law rhetoric overstates certainty (“engineering not craft”); tighten to fit-regime claim.
9. **P1** Claim typing sparse around core transitions; add explicit `Assumption/Empirical/Consequence` tags.
10. **P2** Reproducibility section sequencing is contradictory; state boundaries first.

## VOICE.md Audit (`Setting the Scene`)
- Pass: four beats present.
- Pass: concrete operational framing.
- Pass: historical lineage with names and dates.
- Pass: clean narrative-to-math bridge.
- Pass: tone guardrails respected.

## Ambiguity Audit
1. “Depth becomes free” -> rhetorical; replace with complexity statement.
2. “Optimizer question largely settled” -> scope to large-scale Transformer pretraining.
3. Monitoring cadence statements lack context -> frame as minimum example cadence.
4. Capacity vs memorization causality phrasing is loose -> separate diagnostics.
5. “Reject such arguments” policy line lacks criteria -> add objective threshold.

## Cross-Week Dependency Checks
### Incoming
- Week 1 CE/NLL objective semantics.
- Week 3 tokenization affects token count `D`.

### Outgoing
- Week 5 scaling and compute budget references depend on Week 2 equations.
- Week 6/7 memory and optimization economics depend on `eq:week2-mem-budget`.
- Week 4 stability discussion should remain consistent with optimizer claims.

### Symbols/Equations to regression-check after edits
- `eq:week2-empirical-loss`, `eq:week2-sgd`, `eq:week2-mem-budget`, `eq:week2-chinchilla`, `eq:week2-chinchilla-opt`.

## Undergraduate Learning-Curve Risk Addendum

### Learning Objective -> Math Exposition Gaps
- **LO: SGD/momentum/Adam derivation**; **risk point:** EMA bias-correction appears abruptly; **fix:** add scalar `t=1..4` EMA table before vector form.
- **LO: bias-correction intuition**; **risk point:** local stationarity approximation is implicit; **fix:** add geometric-series reminder and approximation validity line.
- **LO: LR schedule reasoning**; **risk point:** formulas presented without comparative run; **fix:** add one 10k-step numeric comparison.
- **LO: clipping thresholds**; **risk point:** norm scaling rule lacks geometric intuition; **fix:** add 2D gradient clipping toy.
- **LO: Chinchilla constrained optimization**; **risk point:** Lagrangian steps are compressed; **fix:** add substitution method first, then Lagrange steps.
- **LO: double descent interpretation**; **risk point:** theory vs empirical status not separated; **fix:** add explicit claim-type split plus synthetic curve recap.

### Body-of-Work Reminder Insertions
- Before momentum equations, restate Polyak/Nesterov motivation.
- Before Adam equations, reintroduce Adam EMA rationale for nonstationary gradients.
- Before scaling law derivation, remind Kaplan vs Chinchilla fit-regime differences.
- Before double descent, restate empirical basis and unresolved theory boundary.

### Prerequisite Recap Boxes To Add
- Constrained optimization refresher (Lagrange multipliers).
- EMA/geometric-series refresher.
- Optimization stability basics (step-size, curvature, noise scaling).
