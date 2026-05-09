<!-- markdownlint-disable MD022 MD032 -->
# REVIEW_WEEK05 — Detailed Chapter Audit

## Scorecard (0-3)
- Math continuity: 1
- Derivation sufficiency: 2
- Notation discipline: 1
- Assumption/claim typing: 2
- Writing clarity/unambiguity: 2
- VOICE `Setting the Scene` compliance: 2

## Detailed Issues
1. **P0** `C=6ND` worked numeric example is inconsistent; recompute all values.
2. **P1** Scaling exponents are rounded too aggressively; report computed values and approximation bounds.
3. **P1** Symbol overloading (`T`, `k`, `p`) remains high despite warning; disambiguate notation.
4. **P1** Long-context historical claim likely inaccurate; correct model/version statement.
5. **P1** Memorization probability model can exceed 1; reformulate as logit/odds or bounded regime.
6. **P1** Few-shot performance deltas lack explicit benchmark scope.
7. **P1** “Current best practice” phrasing is too recipe-specific.
8. **P2** Temperature symbol inconsistency between notation/prose/equations.
9. **P2** Stylistically loaded wording in prologue; neutralize.
10. **P2** Derivation ledger lacks explicit symbol mapping to prior chapters.
11. **P2** Metaphorical statements in technical sections reduce precision.

## VOICE.md Audit (`Setting the Scene`)
- Pass: four beats present.
- Pass: lineage and failure modes present.
- Pass: transition to math present.
- Fail: opening is abstract and lacks concrete scene anchor.

## Ambiguity Audit
1. “single model broadly capable” -> define “capable.”
2. “trust not misplaced” -> unclear evaluation axis.
3. “no clear theoretical foundation” -> over-broad.
4. “engineering convenience dominates” -> specify metric.
5. “prompt selects behavior” -> deterministic wording.
6. “RAG sidesteps memorization” -> overclaim.

## Cross-Week Dependency Checks
### Incoming
- Week 1 objective equivalence and decoding semantics.
- Week 2 scaling-law formulas and compute arithmetic.
- Week 4 masking/packing assumptions.

### Outgoing
- Week 6 dense-vs-sparse compute interpretation.
- Week 8 alignment on pretrained base distribution.
- Week 10 provenance/contamination governance claims.
- Week 11 API decoding parameter semantics.

### Symbols/Equations to regression-check after edits
- `eq:week5-pretrain-obj`, scaling-law equations, decoding equations (temperature/top-p/top-k).

## Undergraduate Learning-Curve Risk Addendum

### Learning Objective -> Math Exposition Gaps
- **LO: compute-optimal planning from scaling laws**; **risk point:** Lagrangian derivation is condensed; **fix:** add substitution-first derivation path.
- **LO: AR/MLM/prefix objective contrast**; **risk point:** conceptual differences not normalized mathematically; **fix:** add side-by-side loss table.
- **LO: ICL mechanism understanding**; **risk point:** hypotheses presented without toy mechanistic demos; **fix:** add induction-head and toy linear-regression examples.
- **LO: prompt sensitivity quantification**; **risk point:** large deltas cited without arithmetic example; **fix:** add permutation-based score spread mini-study.
- **LO: decoding control intuition**; **risk point:** many controls introduced at once with overloaded symbols; **fix:** add notation panel and decision flowchart.
- **LO: memorization risk modeling**; **risk point:** parametric law appears without fit workflow; **fix:** add 3-point calibration workflow with uncertainty bounds.

### Body-of-Work Reminder Insertions
- Before pretraining objective, re-anchor to Week 1 autoregressive factorization.
- Before Chinchilla section, remind Week 2 assumptions and fit-regime limits.
- Before ICL hypotheses, remind Week 4 induction-head/circuit context.
- Before emergence metrics, restate metric-discontinuity caveat body of work.

### Prerequisite Recap Boxes To Add
- Lagrangian optimization refresher.
- Probability transformations for decoding controls.
- Evaluation metric continuity vs discontinuity recap.
