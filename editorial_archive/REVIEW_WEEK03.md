<!-- markdownlint-disable MD022 MD032 -->
# REVIEW_WEEK03 — Detailed Chapter Audit

## Scorecard (0-3)
- Math continuity: 2
- Derivation sufficiency: 2
- Notation discipline: 1
- Assumption/claim typing: 1
- Writing clarity/unambiguity: 2
- VOICE `Setting the Scene` compliance: 3

## Detailed Issues
1. **P0** Tokenizer worked example character count is factually wrong; correct or remove count.
2. **P1** “Tokenizer is lossless” statement conflicts with chapter assumptions; scope to byte-level configurations with pinned normalization.
3. **P1** Learning objective overclaim (“defeats normalization problems”); replace with bounded mitigation claim.
4. **P1** SentencePiece default behavior description is inaccurate; revise to Unicode-level segmentation behavior.
5. **P1** WordPiece equation/ledger inconsistency (ratio vs log-ratio); harmonize.
6. **P1** Embedding notation drift (`w_i` vs `x_i` vs `\iota_i`); enforce one symbol family.
7. **P1** `eq:week3-embed` index-role collision (`i` position vs token ID); rewrite with `\iota`.
8. **P2** “Tokenizer never modified” is absolute; constrain to fixed model version.
9. **P1** Claim typing sparse across empirical/fairness assertions; add labels.
10. **P2** Stop-sequence guidance over-generalized; make it conditional to tokenizer-boundary safety.

## VOICE.md Audit (`Setting the Scene`)
- Pass: all four beats present and ordered.
- Pass: concrete opening and historical lineage.
- Pass: visible failure modes tied to user outcomes.
- Pass: math transition line present.
- Pass: no prohibited rhetorical style.

## Ambiguity Audit
1. “Tokenizer is the model’s alphabet ... cannot see at all” -> absolute overreach.
2. “No widely deployed character-level models” -> scope/timeframe missing.
3. “Tokenizer never modified” -> should be per-family/per-checkpoint.
4. “Model knows X” phrasing is undefined; use probability recoverability wording.
5. “Embedding layer often largest block” -> condition by model/vocab regime.

## Cross-Week Dependency Checks
### Incoming
- Week 1 perplexity and CE interpretation depend on tokenization units.
- Week 2 compute `D` in tokens depends on tokenizer regime.

### Outgoing
- Week 4 embedding/projection equations depend on Week 3 notation.
- Week 9 retrieval chunking/embedding geometry depends on tokenizer and anisotropy framing.
- Week 10 provenance/governance relies on tokenizer/version pinning statements.

### Symbols/Equations to regression-check after edits
- `eq:week3-wordpiece`, `eq:week3-embed`, `eq:week3-unembed`.

## Undergraduate Learning-Curve Risk Addendum

### Learning Objective -> Math Exposition Gaps
- **LO: BPE end-to-end understanding**; **risk point:** merge dynamics described abstractly; **fix:** add 5-merge worked toy with unseen-word encoding.
- **LO: BPE vs WordPiece vs Unigram comparison**; **risk point:** objectives are not normalized in one table; **fix:** add objective/search/determinism comparison matrix.
- **LO: Unicode and normalization effects**; **risk point:** code point vs byte distinction is conceptual only; **fix:** add NFC/NFD token-ID mismatch example.
- **LO: embedding lookup as linear map**; **risk point:** one-hot to matrix lookup jump is fast; **fix:** add `4x3` toy matrix multiplication.
- **LO: tied embeddings tradeoffs**; **risk point:** savings asserted but not computed; **fix:** add parameter-count numeric before/after tying.
- **LO: analogy/geometry interpretation**; **risk point:** static vs contextual embeddings boundary is blurred; **fix:** add explicit caveat bridge.

### Body-of-Work Reminder Insertions
- Before BPE details, remind compression-to-NMT lineage.
- Before WordPiece score equation, re-anchor to BERT-era objective motivation.
- Before Unigram segmentation math, remind SentencePiece probabilistic framing.
- Before analogy vectors, reintroduce Word2Vec origin and contextual-embedding limits.
- Before anisotropy claims, add short recap of contextual geometry findings.

### Prerequisite Recap Boxes To Add
- Unicode basics (code points, UTF-8 bytes, normalization forms).
- Dynamic programming intuition for segmentation.
- Linear algebra essentials for embeddings and cosine similarity.
