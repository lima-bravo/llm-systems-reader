<!-- markdownlint-disable MD022 MD032 -->
# REVIEW_WEEK10 — Detailed Chapter Audit

## Scorecard (0-3)
- Math continuity: 2
- Derivation sufficiency: 1
- Notation discipline: 2
- Assumption/claim typing: 2
- Writing clarity/unambiguity: 2
- VOICE `Setting the Scene` compliance: 2

## Detailed Issues
1. **P1** Risk arithmetic uses ordinal `S,L` with multiplicative operations; either redefine scales or reframe as policy index.
2. **P1** Worked-example ablation claim is numerically unsupported; add full ablation table.
3. **P1** Ledger single-control residual-risk form not mapped clearly to multi-control equation.
4. **P1** Drift threshold symbols/comparators mismatch between body and ledger.
5. **P1** Confidence aggregation heuristic (`min`) lacks dependency-model caveat.
6. **P1** Independence assumptions conflate failure independence and control efficacy composition.
7. **P2** “de facto floor in most jurisdictions” is over-broad; scope by region/deployment class.
8. **P2** Escalation policy equation mixes textual actions and math types.
9. **P2** `G` root-goal vs full graph semantics need symbol distinction.
10. **P2** Heavy Week 9 dependency in worked examples should include local restatement.
11. **P2** Some long sentences degrade precision/readability.
12. **P2** Normative vs empirical statements need clearer type labels.

## VOICE.md Audit (`Setting the Scene`)
- Pass: four beats present and ordered.
- Pass: concrete human incident anchor.
- Pass: inclusive tone and explicit transition to math.
- Fail: jurisdictional/general policy claims need narrower scope.
- Fail: sentence density exceeds readability target in places.

## Ambiguity Audit
1. “de facto floor ... most jurisdictions” -> undefined scope.
2. “not optional” -> for whom.
3. “no amount of alignment/eval will solve” -> over-absolute.
4. “six-month-old assurance case not assured” -> arbitrary threshold implication.
5. “model is the easy part” -> rhetorical overstatement.

## Cross-Week Dependency Checks
### Incoming
- Week 9 trust-boundary invariant.
- Week 7 adapter rollback/version lineage.
- Week 8 alignment as preventive control assumptions.
- Weeks 1-2 probability language boundaries.

### Outgoing
- Week 11 API/tool controls and audit telemetry mapping.
- Week 12 incident taxonomy and failure-ladder alignment.

### Symbols/Equations to regression-check after edits
- `R(h)`, `R_res(h)`, drift equations, escalation policy equations, assurance tuple symbols.

## Undergraduate Learning-Curve Risk Addendum

### Learning Objective -> Math Exposition Gaps
- **LO: quantify defense-in-depth residual risk**; **risk point:** product form appears before single-control intuition; **fix:** derive from one-control to two-control to product.
- **LO: map layered controls to thresholds**; **risk point:** conceptual layers jump to policy gates; **fix:** add 1-layer vs 3-layer numeric comparison including correlated failure case.
- **LO: implement drift-trigger policies**; **risk point:** indicator/set notation is abrupt; **fix:** add timeline toy with threshold crossings and escalation outcomes.
- **LO: apply audit-readiness rubric**; **risk point:** score thresholds asserted without calibration example; **fix:** add fictional deployment scoring walkthrough.
- **LO: interpret confidence aggregation**; **risk point:** conservative min-rule appears theorem-like; **fix:** add alternative aggregation comparison and policy-choice caveat.
- **LO: translate regulation to engineering controls**; **risk point:** clause-to-artifact mapping too abstract; **fix:** add clause -> control -> CI check -> evidence chain example.

### Body-of-Work Reminder Insertions
- Before hazard taxonomy, restate STPA/safety-engineering lineage briefly.
- Before assurance tuple, re-anchor to safety-case/GSN argument tradition.
- Before drift equations, remind control-chart/monitoring basics.
- Before frontier-risk section, remind capability-eval/scaling-policy lineage.

### Prerequisite Recap Boxes To Add
- Independence assumptions and correlated-failure caveats.
- Indicator-function and threshold policy basics.
- Ordinal vs ratio-scale interpretation for risk scoring.
