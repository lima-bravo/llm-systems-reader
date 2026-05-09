<!-- markdownlint-disable MD022 MD032 -->
# REVIEW_WEEK01 — Detailed Chapter Audit

## Scorecard (0-3)
- Math continuity: 3
- Derivation sufficiency: 2
- Notation discipline: 2
- Assumption/claim typing: 2
- Writing clarity/unambiguity: 2
- VOICE `Setting the Scene` compliance: 3

## Detailed Issues
1. **P1** `Equivalence with Cross-Entropy`: equivalence is over-scoped to exponential family; rewrite as NLL objective equivalence for probabilistic models.
2. **P1** Assumption granularity mismatch: sequence-level i.i.d. and token-level averaging are mixed; split assumptions explicitly.
3. **P1** Reliability bin formulas omit empty-bin handling; define `|B_k|=0` convention.
4. **P1** Population ECE conditioning uses exact confidence values; reframe with calibration function/binning neighborhood.
5. **P2** ECE worked example contains impossible intermediate value; replace with valid construction only.
6. **P1** Derivation ledger symbol drift (`x` vs `w`); normalize to chapter notation.
7. **P1** Bin index drift (`B`, `B_b`, `B_k`); enforce one index convention.
8. **P2** Perplexity “effective vocabulary size” phrasing is too literal; mark as heuristic.
9. **P2** “Top-k ignores head shape” is overstated; specify tail-truncation behavior.
10. **P2** Prologue historical paragraph is dense; split for readability.

## VOICE.md Audit (`Setting the Scene`)
- Pass: four-beat structure present and ordered.
- Pass: concrete opening scene exists.
- Pass: lineage includes named predecessors with dates.
- Pass: explicit transition into math exists.
- Pass: uncertainty is acknowledged; no hype language violations.

## Ambiguity Audit
1. “The guess is not certain. It is not random either.” -> ambiguous “random”; use “not arbitrary.”
2. “Everything in this book is the elaboration.” -> unclear scope; anchor to specific sections.
3. “Cross-entropy distance” -> use “divergence.”
4. “No native concept of confidence” -> qualify as “no externally calibrated task confidence.”
5. “Top-k ignores shape of the head” -> replace with precise truncation wording.

## Cross-Week Dependency Checks
### Incoming
- Week 3 tokenizer semantics define token units used in Week 1 (`N_tok`, perplexity interpretation).
- Week 4 architecture equations must instantiate Week 1 conditional objective consistently.

### Outgoing
- Week 2 depends on Week 1 objective/CE/KL chain.
- Week 5 depends on perplexity and decoding semantics.
- Week 8 depends on calibration framing and confidence semantics.
- Week 9 depends on evaluation and uncertainty concepts.

### Symbols/Equations to regression-check after edits
- `eq:mle`, `eq:nll-ce`, `eq:ce-kl`, `eq:perplexity`, `eq:ece`, `eq:temperature`.

## Undergraduate Learning-Curve Risk Addendum

### Learning Objective -> Math Exposition Gaps
- **LO: MLE -> NLL -> CE/KL chain**; **risk point:** objective changes notation too quickly; **fix:** add 2-sequence numeric derivation with explicit `N_tok` normalization.
- **LO: softmax invariance + stability**; **risk point:** proof is abstract; **fix:** add logits overflow toy (`[1000,999,995]`) before/after max-shift.
- **LO: confidence vs correctness vs calibration**; **risk point:** concepts stack before grounded case; **fix:** add 5-prediction mini-table with confidence and outcomes.
- **LO: ECE estimator comprehension**; **risk point:** population conditional to binned estimator jump; **fix:** add `K=3, N=12` full bin walk-through.
- **LO: perplexity interpretation**; **risk point:** monotonic transform is terse; **fix:** add CE-to-PPL numeric mapping examples.

### Body-of-Work Reminder Insertions
- Before entropy/CE equations, restate Shannon’s coding interpretation.
- Before KL formalism, restate KL as divergence (not metric) and asymmetry implications.
- Before calibration metrics, re-anchor to modern calibration work in deep nets.
- Before proper scoring rules, briefly define strict properness lineage.

### Prerequisite Recap Boxes To Add
- Log/exp identities used in objective transformations.
- Discrete probability toolkit (chain rule, conditional expectation, indicators).
- Calibration estimation basics (binning bias/variance, empty-bin handling).
