# REVIEW_CH9 — Week 9 LLM Systems: RAG, Tools, Evaluation

## Scope
- Reviewed: `weeks/week09_llm_systems_rag_tools_evaluation.tex`
- Rubric basis: `REVIEW.md`

## Rubric Scores (0–3)
- Derivation completeness: 1
- Notation consistency: 2
- Assumption transparency: 2
- Theorem/empirical/heuristic separation: 2
- Example sufficiency: 2
- Bridge quality to next chapters: 3
- Pass status: **Fail (critical: derivation completeness)**

## What Is Strong
- Excellent systems architecture perspective with realistic failure modes.
- Strong coverage of RAG/tooling/eval operations and security issues.
- Practical guidance is concrete and deployment-ready.

## Concrete Gaps
- This chapter is conceptually rich but mathematically light relative to manuscript goals:
  - Retrieval scoring functions (BM25, dense similarity, reranking) are mostly descriptive.
  - Evaluation metrics (faithfulness/context precision/recall) are introduced without formal definitions.
  - No derivation-level treatment of ranking/metric behavior; inferential burden shifts to prior memory.
- Claim status is mostly implicit; many recommendations are heuristics rather than formal results.

## Priority Edits
1. Add chapter-open assumptions/notation block for query/document/chunk/retrieval sets and eval metrics.
2. Add formal definitions for key RAG metrics (context recall, context precision, faithfulness, answer relevance).
3. Add compact BM25 and cosine-scoring equations with interpretation.
4. Add one small numeric reranking example demonstrating precision@k change.
5. Add explicit labels for heuristic guidance (e.g., chunk size recommendations).
6. Add “proved vs observed” recap after evaluation section.
7. Introduce one minimal model for lost-in-the-middle ordering experiment (formal setup + metric).
8. Add one attack-model formalization for prompt injection in retrieved/tool output (threat assumptions).

## Expected Reader Benefit
- Restores manuscript-wide mathematical continuity for a chapter that is currently strongest in systems prose.
