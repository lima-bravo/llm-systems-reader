# REVIEW_CH1 — Week 1 Statistical Foundations

## Scope
- Reviewed: `weeks/week01_statistical_foundations.tex`
- Rubric basis: `REVIEW.md` (Section C + checklist in Section G)

## Rubric Scores (0–3)
- Derivation completeness: 2
- Notation consistency: 2
- Assumption transparency: 2
- Theorem/empirical/heuristic separation: 1
- Example sufficiency: 3
- Bridge quality to next chapters: 3
- Pass status: **Fail** (claim-type separation below threshold)

## What Is Strong
- Mathematical arc is coherent: chain rule → MLE → NLL/cross-entropy → KL/perplexity.
- Good numerical examples (softmax shift invariance, overconfidence vignette).
- Strong bridges to later chapters and systems implications.

## Concrete Gaps
- Claim status is mixed in prose; theorem-level identities and empirical observations are not consistently labeled.
- Several derivations are presented at “result-level” without local intermediate algebra:
  - MLE sum form to empirical expectation.
  - Cross-entropy decomposition into KL.
  - Temperature scaling behavior limits.
- Assumptions are present but scattered (i.i.d., empirical distribution, calibration regime), increasing memory load.
- ECE caveats are listed but not demonstrated with a small counterexample.

## Priority Edits
1. Add a chapter-open `Notation and Assumptions` block (random variable vs realization, log base, empirical vs population expectation).
2. Add a `Derivation` block under MLE→NLL with explicit measure definition over `(x_{<t},x_t)`.
3. Expand CE/KL identity into line-by-line algebra.
4. Label core statements as `Definition`, `Identity`, `Empirical Observation`, `Engineering Consequence`.
5. Add one compact numeric ECE counterexample showing same ECE, different miscalibration profile.
6. Add `Proved vs Assumed` recap at end of each major section.
7. Reintroduce overloaded symbols after long prose spans (`\hat p`, `q_\theta`, `N_tok`).
8. Explicitly tag units (nats/bits) wherever entropy/perplexity are compared.

## Expected Reader Benefit
- Reduced inferential jumps for mathematically trained readers.
- Faster re-derivation without external memory reconstruction.
- Cleaner epistemic boundaries between formal facts and empirical behavior.
