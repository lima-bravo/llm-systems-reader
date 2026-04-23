# REVIEW_CH7 — Week 7 Adaptation, LoRA, Quantization

## Scope
- Reviewed: `weeks/week07_adaptation_lora_quantization.tex`
- Rubric basis: `REVIEW.md`

## Rubric Scores (0–3)
- Derivation completeness: 2
- Notation consistency: 2
- Assumption transparency: 2
- Theorem/empirical/heuristic separation: 2
- Example sufficiency: 2
- Bridge quality to next chapters: 3
- Pass status: **Marginal fail**

## What Is Strong
- Strong practical framing and excellent deployment-centric perspective.
- LoRA core equation and merge logic are well motivated.
- Quantization section is broad and operationally useful.

## Concrete Gaps
- Mathematical continuity is weaker in cost arithmetic and quantization claims:
  - VRAM and FLOP numbers are given narratively without a canonical budget formula.
  - NF4 intuition is clear, but quantile construction is not shown mathematically.
  - Some quality claims (“near-parity”) should be explicitly marked empirical and task-dependent.
- Notation shifts between full FT, LoRA, QLoRA and precision formats without a shared symbol box.
- Claim-type separation (identity vs benchmark observation) remains implicit.

## Priority Edits
1. Add notation/units box (`W0`, `Delta`, rank `r`, scale `alpha`, bytes/param assumptions).
2. Insert explicit memory budget equations for full FT vs LoRA vs QLoRA.
3. Add one small derivation showing LoRA parameter ratio `dk / (r(d+k))`.
4. Add NF4 short construction note (equal-mass quantiles under Gaussian prior).
5. Label all “near parity” statements as benchmark-contingent empirical claims.
6. Add one worked numeric example for 7B and 70B adaptation budget.
7. Add “proved vs assumed” recap at end of LoRA and quantization sections.
8. Add explicit caveat for domain-shift conditions where low-rank assumption fails.

## Expected Reader Benefit
- Faster verification of adaptation tradeoffs and clearer boundaries between formulas and benchmark outcomes.
