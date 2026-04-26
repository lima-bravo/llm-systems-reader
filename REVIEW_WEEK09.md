<!-- markdownlint-disable MD022 MD032 -->
# REVIEW_WEEK09 — Detailed Chapter Audit

## Scorecard (0-3)
- Math continuity: 2
- Derivation sufficiency: 2
- Notation discipline: 2
- Assumption/claim typing: 2
- Writing clarity/unambiguity: 2
- VOICE `Setting the Scene` compliance: 2

## Detailed Issues
1. **P1** RAG conditional risks double conditioning; define one canonical rendered-input representation.
2. **P1** Set-valued retrieval in conditioning ignores order sensitivity; use ordered tuple/packing permutation.
3. **P1** Trust invariant is not operationally testable as stated; convert to enforceable policy checks.
4. **P1** Answer relevance metric has sampling variance issues; specify sampler config and CIs.
5. **P2** BM25 IDF sign behavior not discussed; mention clamping/variant implementations.
6. **P2** Metric denominator edge cases (`0`) not defined; add conventions.
7. **P2** Lost-in-the-middle inequality lacks local significance-testing protocol.
8. **P2** RRF default parameter presented as near-universal; add tuning guidance.
9. **P2** Reranker gain ranges lack dataset/regime qualifiers.
10. **P2** Tool determinism and side effects conflated; separate pure validation from effectful execution.
11. **P2** “Most failures are system failures” over-broad without scoped context.

## VOICE.md Audit (`Setting the Scene`)
- Pass: four beats explicit and ordered.
- Pass: predecessor lineage and failure modes are concrete.
- Pass: no prohibited stylistic patterns.
- Fail: opening lacks concrete human-scale scene.
- Fail: forward beat into math should be more explicit.

## Ambiguity Audit
1. “modern LLM application is a pipeline” -> optional vs mandatory components unclear.
2. “hybrid almost always better” -> regime unspecified.
3. “chunk sweet-spot smaller than you think” -> subjective baseline.
4. “reranking cost small” -> depends on model and SLO.
5. “most failures system failures” -> scope omitted.
6. “prompts as system artefacts” -> minimum artifact schema unspecified.

## Cross-Week Dependency Checks
### Incoming
- Week 3 embedding geometry and normalization assumptions.
- Week 4 positional effects vs lost-in-the-middle behavior.
- Week 7/8 model behavior and alignment assumptions.

### Outgoing
- Week 10 assurance evidence relies on Week 9 metrics/harness outputs.
- Week 11 tooling/contract semantics extends Week 9 schema/tool framing.

### Symbols/Equations to regression-check after edits
- `eq:rag-conditional`, `eq:bm25`, `eq:dense-cos`, `eq:colbert-maxsim`, `eq:rrf`,
- `eq:precision-at-k`, `eq:litm`, `eq:trust-invariant`,
- `eq:context-recall`, `eq:context-precision`, `eq:faithfulness`, `eq:answer-relevance`.

## Undergraduate Learning-Curve Risk Addendum

### Learning Objective -> Math Exposition Gaps
- **LO: compare sparse/dense/hybrid retrievers**; **risk point:** formulas appear back-to-back without common interpretation frame; **fix:** add score-function mapping table.
- **LO: compute BM25 confidently**; **risk point:** IDF/saturation terms assume IR background; **fix:** add one full query-chunk numeric BM25 computation.
- **LO: reason about dense cosine scoring**; **risk point:** norm effects are abstract; **fix:** add ranking-change toy with equal dot product but different norms.
- **LO: separate retrieval vs reranking gains**; **risk point:** metric movement across stages is under-explained; **fix:** add stage-wise metric decomposition example.
- **LO: understand lost-in-the-middle behavior**; **risk point:** inequality statement lacks concrete simulation; **fix:** add prompt-position swap example.
- **LO: compute RAG-specific metrics**; **risk point:** set metrics stack quickly; **fix:** add mini-case computing recall, precision, faithfulness, relevance.
- **LO: trust boundary reasoning**; **risk point:** formal invariant appears without threat-model decomposition; **fix:** add attacker-capability recap before invariant.

### Body-of-Work Reminder Insertions
- Before BM25, reintroduce classical IR roots (TF-IDF/BM25).
- Before dense retrieval equations, remind DPR-style contrastive retriever lineage.
- Before ANN section, re-anchor to FAISS/approximate search motivation.
- Before lost-in-the-middle, remind positional sensitivity findings.
- Before RAG metrics, restate retrieval-vs-generation evaluation separation.

### Prerequisite Recap Boxes To Add
- IR basics (TF, IDF, saturation, lexical vs semantic retrieval).
- Vector similarity fundamentals (dot product vs cosine normalization effects).
- Set-based metric basics and oracle limitations.
