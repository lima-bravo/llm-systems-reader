<!-- markdownlint-disable MD032 MD029 -->
# REVIEW_CH2 — Complete Chapter-by-Chapter Audit (Weeks 1-12)

This file completes the full-reader review pass requested in `REVIEWprompt.md`, covering every chapter with rubric scores, key findings, and prioritized fix actions.

## 1) Rubric Scoreboard (all chapters reviewed)

Rubric criteria: Derivation completeness, notation consistency, assumption transparency, claim-type separation, example sufficiency, bridge quality (0-3 each; max 18).

| Chapter | Deriv | Notation | Assumptions | Claim Type | Examples | Bridge | Total | Status |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| Week 1 | 3 | 2 | 3 | 3 | 2 | 3 | 16 | Pass |
| Week 2 | 2 | 2 | 3 | 3 | 2 | 3 | 15 | Pass |
| Week 3 | 2 | 1 | 2 | 2 | 2 | 3 | 12 | Fail |
| Week 4 | 3 | 3 | 3 | 3 | 2 | 2 | 16 | Pass |
| Week 5 | 2 | 1 | 3 | 2 | 3 | 2 | 13 | Fail |
| Week 6 | 2 | 1 | 3 | 2 | 2 | 2 | 12 | Fail |
| Week 7 | 2 | 2 | 3 | 2 | 2 | 2 | 13 | Fail |
| Week 8 | 3 | 2 | 3 | 2 | 1 | 2 | 13 | Fail |
| Week 9 | 3 | 2 | 3 | 3 | 2 | 3 | 16 | Pass |
| Week 10 | 2 | 2 | 3 | 3 | 2 | 3 | 15 | Pass |
| Week 11 | 2 | 1 | 3 | 3 | 2 | 3 | 14 | Pass (at threshold) |
| Week 12 | 1 | 2 | 2 | 1 | 2 | 3 | 11 | Fail |

Audit gate used: chapter pass threshold `>=14` and no criterion below `2`.

## 2) Cross-Chapter Diagnosis

- P0 cluster: notation drift and inconsistent symbol policy are the dominant global blockers (Weeks 3, 5, 6, 11).
- P0 cluster: derivation ledger vs chapter-body mismatch appears repeatedly (Weeks 5, 6, 7, 9, 10, 11).
- P1 cluster: claim typing weakens in transition sections where empirical findings and heuristics are mixed without explicit label discipline.
- P1 cluster: worked examples are sparse in Weeks 8 and 12 relative to conceptual density.
- P1 cluster: bridge sections are generally present but often insufficiently operational (few explicit “dependency -> target equation/assumption” links).

## 3) Chapter Findings and Priority Actions

### Week 1 (`weeks/week01_statistical_foundations.tex`) — 16/18

Key findings:
- P1: ECE worked example contains a logically impossible intermediate (`acc=1.10`) before correction.
- P1: Calibration framing is top-1-token centric; sequence-level caveat is under-specified.
- P2: Perplexity interpretation is broader than warranted without distributional qualification.

Priority actions:
- Replace ECE counterexample with numerically valid bins only.
- Add explicit token-level vs sequence-level calibration caveat.
- Add one compact numeric decoding-vs-calibration comparison.

### Week 2 (`weeks/week02_optimization_generalization.tex`) — 15/18

Key findings:
- P1: Notation mismatch between empirical-loss equation and SGD equation weakens derivation continuity.
- P1: Adam “unbiased” language is too strong under local-stationarity assumptions.
- P1: “Strictly worse” Chinchilla language overstates regime validity.

Priority actions:
- Normalize sample/token indexing across optimization equations.
- Rephrase Adam claim as approximate unbiasedness under explicit assumptions.
- Downgrade universal scaling claims to conditional validity statements.

### Week 3 (`weeks/week03_tokenization_embeddings.tex`) — 12/18

Key findings:
- P0: Contradiction between “tokenization is lossy” and lossless codec assumption (A3.2) without distinction.
- P1: WordPiece equation and derivation ledger disagree (ratio vs log-ratio framing).
- P1: Factual/editorial accuracy issue in tokenizer example description.

Priority actions:
- Split reversible codec behavior from irreversible normalization losses.
- Harmonize WordPiece notation across equation, prose, and ledger.
- Correct factual example text and add one audited multilingual token-count example.

### Week 4 (`weeks/week04_transformer_architecture.tex`) — 16/18

Key findings:
- P1: Early “attention dominates compute” framing is not reconciled with FFN-dominant worked FLOPs regime at moderate `T`.
- P1: Pre-norm stability wording is too broad as a guarantee.
- P2: Interpretability section lacks a compact falsification protocol.

Priority actions:
- Add explicit regime map (FFN-dominant vs attention-dominant by sequence length).
- Soften stability wording to optimizer/schedule/model-scale conditioned claims.
- Add one minimal interpretability audit procedure.

### Week 5 (`weeks/week05_pretraining_incontext.tex`) — 13/18

Key findings:
- P0: Compute example (`C=10^{25}`, “70B/1.4T”) conflicts with `C=6ND` arithmetic.
- P1: Notation overload remains high (`T`, `k` used for multiple distinct concepts).
- P1: Scaling/emergence cross-reference is non-specific and hard to audit.

Priority actions:
- Recompute and correct the scaling worked example with a sanity-check line.
- Deconflict notation (`T_seq`, `tau`, `k_topk`, `k_shot`, `k_dup`).
- Replace vague bridge/cross-reference text with explicit equation-level references.

### Week 6 (`weeks/week06_efficiency_scaling_moe.tex`) — 12/18

Key findings:
- P1: Expert-count notation drifts (`N_e` vs `N`) across prose/equations.
- P1: Derivation ledger uses symbol set inconsistent with chapter body.
- P2: Load-balancing derivation needs explicit caveat on non-smooth top-k assignment.

Priority actions:
- Standardize expert-count notation globally within the chapter.
- Align derivation ledger symbols and labels exactly to chapter equations.
- Add validity-envelope note for routing/scaling extrapolation limits.

### Week 7 (`weeks/week07_adaptation_lora_quantization.tex`) — 13/18

Key findings:
- P1: Derivation ledger section pointers do not match subsection labels.
- P1: Compute discussion should separate forward cost from adapter-backward/update cost.
- P1: Some “default recipe” wording remains broader than evidence scope.

Priority actions:
- Repair all ledger pointers to exact local labels.
- Add compact compute component table/equations (forward/backward/optimizer).
- Add decision matrix for LoRA/QLoRA/DoRA/AdaLoRA by constraints.

### Week 8 (`weeks/week08_alignment_preference_optimization.tex`) — 13/18

Key findings:
- P1: DPO section lacks a compact numeric worked check comparable to Bradley-Terry example rigor.
- P1: KL-penalty wording includes imprecise “strict upper bound” phrasing.
- P2: Variant comparison blends assumptions and empirical performance without regime separation.

Priority actions:
- Add toy numeric DPO loss evaluation example.
- Rewrite KL statement in precise optimization terms.
- Separate variant evidence by benchmark regime and claim type.

### Week 9 (`weeks/week09_llm_systems_rag_tools_evaluation.tex`) — 16/18

Key findings:
- P1: Derivation ledger notation drifts from chapter notation (`\mathcal{D}, \mathcal{C}, \mathcal{G}` mismatch).
- P1: Ledger RAG conditional omits prompt-construction term present in main formalization.
- P2: Oracle reliability assumptions are discussed but not formalized quantitatively.

Priority actions:
- Sync ledger notation and equations with chapter core definitions.
- Add one worked failure-mode -> metric-delta -> remediation mapping example.
- Add explicit oracle reliability assumptions (variance/bias bounds).

### Week 10 (`weeks/week10_governance_assurance_future.tex`) — 15/18

Key findings:
- P1: Ledger residual-risk formula uses single-control simplification, while chapter defines multi-control product.
- P1: Drift-threshold inequality notation differs between body and ledger.
- P1: Independence caveat wording can confuse “defense quality” vs “residual risk” interpretation.

Priority actions:
- Normalize ledger to exact body equations and symbols.
- Harmonize drift threshold notation across chapter.
- Add sensitivity mini-table for correlated control failures / confidence aggregation choices.

### Week 11 (`weeks/week11_access_apis_agents_mcp.tex`) — 14/18

Key findings:
- P0: Retry expectation formula in ledger conflicts with finite-retry chapter equation and can mis-estimate cost.
- P1: Effective throughput term undercounts input-token pressure in one ledger expression.
- P1: Mixed notation (`N_in/T_in`, `p_fail/p_retry`, `C_req/Cost`) impairs continuity.

Priority actions:
- Correct derivation ledger to match finite-retry and throughput equations exactly.
- Standardize all serving/cost notation in one canonical dictionary.
- Add queueing-model validity envelope and failure-detection checklist.

### Week 12 (`weeks/week12_human_centric_error_model.tex`) — 11/18

Key findings:
- P1: No explicit proved-vs-assumed section despite many causal/mechanistic claims.
- P1: Binary predicate formalization is not bridged to practical graded assessments.
- P1: Strong assumption boundaries need explicit counterexample scope.

Priority actions:
- Add a formal claim-typing/proved-vs-assumed subsection.
- Extend binary model to ordinal rubric with observable indicators.
- Add a second non-code worked example (high-stakes domain) with intervention mapping.

## 4) Ranked Global Backlog (post-audit)

### P0 (must-fix before publication)

1. Week 5 scaling arithmetic correction (`C=6ND` consistency).
2. Week 11 retry expectation and throughput ledger/body consistency.
3. Week 3 reversible-vs-irreversible tokenization contradiction resolution.

### P1 (should-fix in harmonization wave)

4. Derivation ledger/body symbol and equation alignment across Weeks 6, 7, 9, 10.
5. Global notation deconfliction policy enforcement (`T`, `k`, `N`, `D`, `alpha`, `beta`, `r`).
6. Strong-claim calibration: convert universal statements to scoped validity envelopes.
7. Add explicit operational bridge mappings at chapter ends.

### P2 (polish after correctness and continuity)

8. Expand worked examples where concept density is high (Weeks 8 and 12 first).
9. Add compact decision matrices in chapter variants sections.
10. Tighten acronym first-use expansion consistency in all chapter-local contexts.

## 5) Completion Statement

All chapters in the reader (`Week 1` through `Week 12`) have now been reviewed under a single rubric and included in this audit.
