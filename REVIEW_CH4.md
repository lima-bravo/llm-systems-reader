# REVIEW_CH4 — Week 4 Transformer Architecture

## Scope
- Reviewed: `weeks/week04_transformer_architecture.tex`
- Rubric basis: `REVIEW.md`

## Rubric Scores (0–3)
- Derivation completeness: 2
- Notation consistency: 3
- Assumption transparency: 2
- Theorem/empirical/heuristic separation: 2
- Example sufficiency: 2
- Bridge quality to next chapters: 3
- Pass status: **Pass (low margin)**

## What Is Strong
- Excellent shape tracking and architectural decomposition.
- High practical value sections: causal masking gotchas, KV cache math, FlashAttention I/O framing.
- Good integration of positional encoding alternatives with operational implications.

## Concrete Gaps
- A few key equations need added intermediate steps for reconstructability:
  - Variance argument for `1/sqrt(d_k)` scaling can show explicit independence assumptions.
  - RoPE relative-position identity would benefit from a short matrix-property derivation line.
  - KV cache memory equation should explicitly incorporate GQA substitution (heads `H` vs KV groups `G`) in formula form, not only prose.
- Claim type labels are mostly implicit.
- Limited worked numeric examples beyond KV cache budget.

## Priority Edits
1. Add explicit assumptions box for attention score variance argument.
2. Expand RoPE relative-position derivation with one additional intermediate equality.
3. Provide explicit GQA-adjusted cache formula and dense-vs-GQA comparison.
4. Add one worked FLOP budget example for a full block at fixed `T,d,H`.
5. Label interpretability limits and head specialization as empirical, not guaranteed.
6. Add “proved vs assumed” recap for attention + positional encoding sections.
7. Add a compact notation table for `d, d_k, d_v, H, L, T`.
8. Link each figure caption to a specific governing equation.

## Expected Reader Benefit
- Easier stepwise verification of core transformer math with lower symbol-tracking burden.
