# REVIEW_CH3 — Week 3 Tokenization and Embeddings

## Scope
- Reviewed: `weeks/week03_tokenization_embeddings.tex`
- Rubric basis: `REVIEW.md`

## Rubric Scores (0–3)
- Derivation completeness: 2
- Notation consistency: 3
- Assumption transparency: 2
- Theorem/empirical/heuristic separation: 2
- Example sufficiency: 3
- Bridge quality to next chapters: 3
- Pass status: **Pass**

## What Is Strong
- Strong end-to-end pipeline framing from Unicode to embedding space.
- Excellent worked BPE example with frequency updates.
- Practical engineering consequences are concrete and deployment-relevant.

## Concrete Gaps
- Some formulas are presented as definitions without derivation cues:
  - WordPiece score interpretation as likelihood gain is asserted, not shown.
  - Unigram LM objective and pruning logic are explained but missing a compact EM-step sketch.
- A few empirical claims (anisotropy ranges, multilingual token inflation) need tighter “observation” labeling.
- Assumption surface (normalization form, tokenizer determinism, reversibility constraints) is distributed rather than boxed.

## Priority Edits
1. Add chapter-open notation/assumption block for token, subword, byte, and ID conventions.
2. Insert mini-derivation connecting WordPiece score to likelihood-improvement intuition.
3. Add a compact EM update sketch for Unigram LM training objective.
4. Tag anisotropy and multilingual cost statements as empirical observations.
5. Add one numeric comparison table: same sentence tokenized by 2–3 tokenizers.
6. Add “proved vs assumed” recap at end of tokenizer comparison section.
7. Clarify symbol reuse between token index `i` and vocabulary item notation in embedding equations.
8. Add one explicit caution that cosine geometry findings depend on preprocessing (centering/whitening).

## Expected Reader Benefit
- Maintains current readability while increasing mathematical traceability of tokenizer objectives.
