# REVIEW_CH2 — Week 2 Optimization, Generalization, Scaling

## Scope
- Reviewed: `weeks/week02_optimization_generalization.tex`
- Rubric basis: `REVIEW.md`

## Rubric Scores (0–3)
- Derivation completeness: 2
- Notation consistency: 2
- Assumption transparency: 2
- Theorem/empirical/heuristic separation: 2
- Example sufficiency: 2
- Bridge quality to next chapters: 3
- Pass status: **Marginal fail** (average near threshold; stronger derivation scaffolding required)

## What Is Strong
- Excellent systems framing of optimization as noisy distributed dynamics.
- Good operational linkage (AdamW state, clipping telemetry, reproducibility protocol).
- Strong scaling-law narrative tied to compute planning.

## Concrete Gaps
- Several equations appear with abbreviated derivation:
  - Adam bias correction includes an `O(drift)` term but no explicit condition under which approximation is valid.
  - Chinchilla constrained optimization statement gives exponents without local derivation sketch.
  - Memory arithmetic is stated verbally without a canonical budget equation table.
- Mix of empirical claims and mechanistic claims is better than Week 1, but still not consistently tagged.
- No dedicated worked numeric mini-example for schedule comparison or gradient clipping effect.

## Priority Edits
1. Add explicit assumptions for SGD-to-SDE approximation (step size, stationarity, noise model).
2. Insert a short Lagrangian derivation sketch for compute-constrained Chinchilla optimum.
3. Add a standard memory budget equation block: params + grads + optimizer + activations.
4. Add one numeric toy example for clipping (`||g||_2 > c`) showing preserved direction and bounded magnitude.
5. Introduce claim labels around “flat minima” and “double descent” statements.
6. Add a “proved vs observed” recap in scaling-law section.
7. Reintroduce schedule symbols (`T_w`, `T_max`, `\eta_min`) before figure discussion.
8. Add one caution box distinguishing predictive utility of scaling laws vs capability forecasting.

## Expected Reader Benefit
- Better reconstructability of optimization arguments.
- Clearer distinction between mathematical claims and empirical scaling heuristics.
