# REVIEW_CH5 — Week 5 Pretraining and In-Context Learning

## Scope
- Reviewed: `weeks/week05_pretraining_incontext.tex`
- Rubric basis: `REVIEW.md`

## Rubric Scores (0–3)
- Derivation completeness: 2
- Notation consistency: 2
- Assumption transparency: 2
- Theorem/empirical/heuristic separation: 2
- Example sufficiency: 2
- Bridge quality to next chapters: 3
- Pass status: **Marginal fail** (average below target; improvements straightforward)

## What Is Strong
- Strong end-to-end narrative from objective to pipeline to decoding/evals.
- Good mechanistic pluralism in ICL hypotheses without over-claiming.
- Excellent systems implications around contamination, prompt drift, and memorization risk.

## Concrete Gaps
- Several quantitative claims are presented without enough derivational scaffolding:
  - `N* ~ C^1/2`, `D* ~ C^1/2` appears without compact constrained derivation reminder.
  - Memorization scaling equation is heuristic; should be explicitly marked empirical fit.
  - Sampling definitions are correct but lack one unified notation preface.
- Distinction between established identity vs debated interpretation (emergence section) can be sharpened.
- Worked numeric examples are lighter than earlier chapters.

## Priority Edits
1. Add notation/assumptions preface covering `N,D,C,T,k,p` and empirical-vs-theoretical status.
2. Insert short Lagrangian sketch for compute-optimal scaling derivation.
3. Label memorization law as empirical parametric fit with scope caveat.
4. Add one explicit numeric example contrasting top-k/top-p/min-p on same logits.
5. Add claim labels in emergence section (`Empirical Observation`, `Metric Effect`, `Consequence`).
6. Add “proved vs assumed” recap after ICL mechanisms.
7. Reintroduce symbols before long prose sections (especially `beta` and decoding parameters).
8. Add one compact “evaluation metric continuity” example to ground emergence debate.

## Expected Reader Benefit
- Better distinction between formal math, empirical scaling behavior, and interpretive hypotheses.
