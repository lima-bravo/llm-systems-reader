# REVIEW_CH6 — Week 6 Efficiency, Scaling, and MoE

## Scope
- Reviewed: `weeks/week06_efficiency_scaling_moe.tex`
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
- Very strong systems-first treatment of parallelism and interconnect constraints.
- MoE forward-pass math and operational failure modes are practical and clear.
- High-value hardware lens (arithmetic intensity, HBM/SRAM/interconnect hierarchy).

## Concrete Gaps
- Some formulas and claims need tighter mathematical continuity:
  - Load-balancing loss interpretation is good, but gradient intuition is verbal.
  - Capacity/drop mechanics would benefit from one numeric toy batch example.
  - Unified MoE scaling law is introduced without assumptions or fitting caveats block.
- Symbols across dense/MoE regimes (`N_total`, `N_active`, experts `N`) can overload readers.
- Claim labels remain implicit.

## Priority Edits
1. Add notation preface distinguishing expert-count symbols from parameter-count symbols.
2. Add a 5-line gradient-direction explanation for load-balancing auxiliary loss.
3. Add numeric capacity-factor worked example (given `B,N,k,f`, compute drop threshold).
4. Label unified scaling law as empirical fit with regime caveats.
5. Add explicit assumptions for all-to-all communication model and bottleneck statements.
6. Add “proved vs observed” recap after MoE scaling and failure modes.
7. Add one small comparison table: dense vs MoE memory/FLOPs under same active compute.
8. Add cross-reference anchors for where Week 2 optimizer-state equations are reused.

## Expected Reader Benefit
- Stronger reconstructability of MoE mechanics and less symbol confusion across scaling sections.
