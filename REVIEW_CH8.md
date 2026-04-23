# REVIEW_CH8 — Week 8 Alignment and Preference Optimization

## Scope
- Reviewed: `weeks/week08_alignment_preference_optimization.tex`
- Rubric basis: `REVIEW.md`

## Rubric Scores (0–3)
- Derivation completeness: 3
- Notation consistency: 2
- Assumption transparency: 2
- Theorem/empirical/heuristic separation: 2
- Example sufficiency: 2
- Bridge quality to next chapters: 3
- Pass status: **Pass (needs structural tightening)**

## What Is Strong
- Best derivational chapter so far for RLHF→DPO path.
- Strong normative framing and realistic failure-mode treatment.
- Good operational emphasis on data quality and evaluation ownership.

## Concrete Gaps
- DPO derivation is strong but assumptions are implicit:
  - Reference policy support conditions and normalization terms could be stated explicitly.
  - Role of `beta` across RLHF and DPO is described but not normalized in one symbol box.
- Empirical claims (alignment tax ranges, disagreement rates, jailbreak transferability) should be marked as observation ranges.
- Could use one compact numerical preference-pair example for Bradley-Terry loss computation.

## Priority Edits
1. Add notation/assumptions preface for `pi_theta`, `pi_ref`, `r_phi`, `beta`, preference triples.
2. Add one line specifying support/normalization assumptions in DPO derivation.
3. Include worked numeric Bradley-Terry example for one `(x, y+, y-)` triple.
4. Label “alignment tax” and disagreement rates as empirical observations with scope caveat.
5. Add “proved vs assumed” recap after RLHF/DPO sections.
6. Add explicit claim labels around normative statements (policy choices vs technical claims).
7. Add short table mapping method variants (DPO/IPO/KTO/ORPO/SimPO) to assumptions.
8. Reintroduce symbols in long sections before discussing failure modes.

## Expected Reader Benefit
- Preserves strong derivation quality while reducing hidden assumptions and cognitive switching.
