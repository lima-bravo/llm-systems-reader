# Manuscript Improvement Plan

Synthesis of `REVIEW.md` (global rubric and backlog) with per-chapter feedback in `REVIEW_CH1.md` through `REVIEW_CH11.md`. The plan separates cross-cutting work applied uniformly from chapter-specific edits, and sequences execution by rubric severity.

---

## 1. Severity Grid

Rubric per `REVIEW.md §C`: scores on 0–3 scale. Pass rule: no dimension `< 2` and average `>= 2.3`. Critical-fail trigger: Derivation completeness `<= 1` on foundational sections.

| Chapter | Derivation | Notation | Assumption | Claim-type | Example | Bridge | Status |
|---|---|---|---|---|---|---|---|
| CH1 Foundations | 2 | 2 | 2 | **1** | 2 | 3 | **FAIL** |
| CH2 Training | 2 | 2 | 2 | 2 | 2 | 2 | Marginal FAIL |
| CH3 Tokenization | 2 | 2 | 2 | 2 | 2 | 3 | PASS |
| CH4 Architecture | 2 | 2 | 2 | 2 | 2 | 3 | PASS (low margin) |
| CH5 Pretraining/Decoding | 2 | 2 | 2 | 2 | 2 | 2 | Marginal FAIL |
| CH6 MoE | 2 | 2 | 2 | 2 | 2 | 2 | Marginal FAIL |
| CH7 Adaptation | 2 | 2 | 2 | 2 | 2 | 2 | Marginal FAIL |
| CH8 Alignment | 2 | 2 | 2 | 2 | 2 | 3 | PASS (tighten) |
| CH9 RAG/Tools/Eval | **1** | 2 | 2 | 2 | 2 | 3 | **FAIL (critical)** |
| CH10 Governance | **1** | 2 | 2 | 2 | **1** | 3 | **FAIL** |
| CH11 APIs/Agents/MCP | **1** | 2 | 2 | 2 | 2 | 2 | **FAIL** |

---

## 2. Cross-Cutting Work (apply everywhere)

Driven by `REVIEW.md §D` P0/P1/P2. These changes are applied uniformly; the per-chapter sections below then list only work that is not already covered here.

### 2.1 P0 — Structural (precondition for any chapter pass)

1. **Notation and Assumptions block** at the opening of every chapter (template `§E.1`).
   - Case discipline: random variables uppercase, realizations lowercase.
   - Expectation measure stated explicitly.
   - Log base and units (nats / bits) stated, then reinforced in every entropy / perplexity / calibration passage.
   - Named assumption list `[A1], [A2], …` referenced inline.
2. **Claim-type labels** (template `§E.3`) applied to every mathematically substantive subsection:
   `\paragraph{Definition.}`, `\paragraph{Identity.}`, `\paragraph{Assumption.}`, `\paragraph{Empirical Observation.}`, `\paragraph{Engineering Consequence.}`.
3. **Global notation reconciliation** (Phase 1 + Phase 3 deliverable). One symbol table in front matter covering:
   `N, D, C, T, H, L, d, d_k, d_v, r, alpha, pi_theta, pi_ref, r_phi, beta, TTFT, TPOT, RPM, TPM`.
   Known collisions to resolve:
   - `N` = parameter count (CH2/CH5) vs dataset size (CH2/CH5 scaling)
   - `k` = top-k decoding (CH5) vs top-k experts (CH6) vs retrieval cutoff (CH9)
   - `r` = LoRA rank (CH7) vs retrieval result index (CH9)
   - `p` = probability vs top-p cutoff (CH5)
4. **Stepwise derivations** (template `§E.2`) for every core identity. Priority list:
   - MLE → summed log-likelihood → token-normalized NLL → cross-entropy (CH1)
   - `H(p, q) = H(p) + KL(p || q)` (CH1)
   - Softmax shift invariance (CH1)
   - `argmin H = argmin exp(H)` perplexity equivalence (CH1)
   - SGD-to-SDE assumption chain (CH2)
   - Chinchilla compute-optimal via Lagrangian (CH2/CH5)
   - Attention-variance motivation for `1/sqrt(d_k)` scaling (CH4)
   - RoPE rotation form, one-step derivation (CH4)
   - LoRA memory ratio `d*k / (r*(d + k))` (CH7)
   - DPO from Bradley-Terry (CH8)
   - ECE finite-bin estimator (CH1)

### 2.2 P1 — Pedagogical (after structural pass)

5. **Proved vs Assumed recap** (`§E.5`) at the end of every major section.
6. **Unit/log convention enforcement** at first use and repeated use.
7. **One worked numeric example per high-load concept** (`§E.4`) per chapter.
8. **Figure ↔ equation linkage** made explicit in caption or adjacent text for every figure.

### 2.3 P2 — Polish

9. Front-matter cross-chapter dependency graph.
10. Per-chapter Derivation Ledger appendix (≤ 1 page) listing key identities and pointers to full derivations.

### 2.4 Preamble / macro infrastructure (do once)

- `\newcommand{\Def}{\paragraph{Definition.}}` and siblings `\Ident`, `\Assum`, `\Emp`, `\Cons`.
- `\newenvironment{derivation}` wrapping an `align` block with a label.
- `\newenvironment{notationbox}` for the opening notation block.
- `\newenvironment{provedassumed}` for the end-of-section recap.
- `\KL`, `\E`, `\Var`, unit macros `\nats`, `\bits`.

Locking these early makes every chapter-level edit mechanical.

---

## 3. Per-Chapter Plans

Each entry lists only chapter-specific work; cross-cutting items in §2 are assumed applied.

### CH1 — Foundations (FAIL: claim-type separation)

- Notation block: empirical measure over (context, token) pairs; nats convention.
- Stepwise derivations:
  - Product-likelihood → summed log-likelihood → token-normalized NLL.
  - Three-line `H(p,q) = H(p) + KL(p || q)`.
  - Explicit `exp(c)` cancellation for softmax shift invariance.
  - One-line `argmin H = argmin exp(H)` for perplexity.
- Calibration: derive finite-bin ECE estimator with small-sample caveat.
- Two-bin numerical counterexample showing same ECE, different risk profile.
- Claim-type labels pass — **this chapter is the primary failing dimension**.
- Proved vs Assumed recap after information-theory and calibration sections.
- Tie `reliability_diagram.tex` and `probability_confidence_correctness.tex` to their governing equations.

### CH2 — Training (Marginal FAIL)

- Notation: learning rate, batch size, gradient-noise covariance; state variance assumptions for SGD-to-SDE.
- Derivations:
  - SGD-to-SDE with the assumptions made explicit.
  - Chinchilla compute-optimal via Lagrangian with KKT conditions.
  - Mixed-precision memory-budget equation (params + grads + optimizer states + activations).
- Worked numeric example: gradient clipping with a concrete threshold on a sample grad-norm distribution.
- Claim labels on flat-minima and double-descent as Empirical Observation.
- Proved vs Assumed recap at end of optimization-theory section.
- Tie `lr_schedule.tex` and `scaling_laws.tex` to their equations.

### CH3 — Tokenization (PASS, minor)

- Notation block: vocabulary `V`, merges, subword sequence.
- WordPiece log-likelihood-gain mini-derivation.
- Unigram EM sketch.
- Comparison table: BPE / WordPiece / Unigram / SentencePiece — objective, merge rule, procedure, OOV behaviour.
- `pretraining_objectives.tex` figure-equation tie.

### CH4 — Architecture (PASS, low margin)

- Notation table: `d, d_k, d_v, H, L, T`; invariant `d = H * d_k` stated.
- Derivations:
  - Attention-variance motivation for `1/sqrt(d_k)`.
  - One-step RoPE rotation derivation.
  - GQA KV-cache size formula `2 * L * T * H_kv * d_k * bytes`.
- FLOP-budget numeric example for one forward pass at a representative `(L, H, d, T)`.
- Proved vs Assumed recap after attention block.

### CH5 — Pretraining & Decoding (Marginal FAIL)

- Notation preface: `N, D, C, T, k, p` disambiguated against CH2 and CH4.
- Compute-optimal `N*(C)`, `D*(C)` via explicit Lagrangian.
- Label memorization and emergent-ability claims as Empirical Observation.
- Worked decoding example: same logits under greedy / top-k=5 / top-p=0.9 / min-p=0.05; show the allowed token set each time.
- Tie `decoding_strategies.tex` 6-panel figure to the distribution-reshaping equations.

### CH6 — MoE (Marginal FAIL)

- Disambiguate `N_total` vs `N_active` vs expert count `E`; note `k` = top-k experts (distinct from CH5 decoding `k`).
- Gradient reasoning for the load-balancing loss (why it yields non-zero gradients on router logits).
- Capacity-factor worked example: `E = 8`, `k = 2`, `CF = 1.25`; compute dropped-token rate and expert-underfill.
- Dense vs MoE comparison table: params, active params, FLOPs/token, memory, latency.
- Proved vs Assumed recap.

### CH7 — Adaptation (Marginal FAIL)

- Notation box: `W_0, Delta W, r, alpha`, bytes-per-param for each precision.
- Memory-budget equations for full fine-tuning vs LoRA vs QLoRA.
- Derivation of LoRA parameter-ratio `d*k / (r*(d + k))`; identify regime where LoRA memory < FT memory.
- NF4 quantile-construction sketch; motivate why NF4 beats 4-bit uniform.
- Worked numeric example at 7B and 70B parameter scales.
- Proved vs Assumed recap on adapter expressivity claims.

### CH8 — Alignment (PASS, tighten)

- Notation block: `pi_theta, pi_ref, r_phi, beta`; reference-policy role stated.
- DPO derivation: show the support / normalization step from Bradley-Terry to the DPO loss.
- Bradley-Terry worked numeric example with two responses and a specific `beta`.
- Variants table (DPO / IPO / KTO / SimPO / ORPO) with distinguishing assumptions.

### CH9 — RAG / Tools / Evaluation (FAIL, critical on derivations)

- Notation and assumptions block: query `q`, document set `D`, chunk set `C`, retrieval set `R_k(q)`, gold-span set `G`.
- Formal definitions for context recall, context precision, faithfulness, answer relevance (each as a ratio over explicitly named sets).
- Compact equations:
  - BM25 with IDF and length-normalized TF saturation.
  - Cosine similarity with the normalization caveat.
- Numeric reranking mini-example showing `Precision@k` pre- vs post-rerank.
- Label chunk-size and overlap recommendations as Engineering Heuristic.
- Lost-in-the-middle: formal setup (fixed gold-doc position index vs accuracy).
- Attack-model formalization for prompt injection in retrieved / tool output: adversary capabilities, trust boundary, invariants.
- Proved vs Observed recap after evaluation section.

### CH10 — Governance & Assurance (FAIL)

- Notation block: `hazard, severity S, likelihood L, risk = f(S, L), control efficacy eta`; residual risk after control.
- Minimal risk-scoring equation with uncertainty treatment (interval or qualitative bands).
- Worked assurance-case mini-example: one top-level claim, two subclaims, evidence nodes, confidence annotations; render in GSN.
- Quantitative control-matrix template: preventive / detective / corrective × efficacy score × residual-risk effect.
- Label normative directives (policy) vs empirical deployment findings.
- Formal drift-trigger policy: metric thresholds, escalation rule, rollback condition.
- End-to-end audit-readiness scoring rubric tied to artifacts (docs, evals, logs, approvals).
- Proved vs Assumed recap in assurance and regulation sections.

### CH11 — APIs, Agents, MCP (FAIL)

- Notation and assumptions block for latency / throughput / cost:
  `TTFT, TPOT, lambda (arrival), mu (service), RPM, TPM, p_retry, c_in, c_out, c_cache`.
- Compact M/M/1-style queuing model for request latency under RPM / TPM limits.
- Formal agent loop budget / termination invariant (monovariant on remaining steps or tokens).
- Expected-cost equation including retries and streaming interruption probability.
- Explicit threat model for tool-output prompt injection: adversary capabilities, trust boundary, invariants preserved.
- Label protocol guarantees vs provider-specific behaviour in each API / MCP subsection.
- Prompt-caching numeric example showing cost and latency impact at a given cache-hit rate.
- Proved vs Assumed recap after API-contract and MCP sections.
- Tie `access_stack.tex`, `mcp_architecture.tex`, `agent_loop.tex` to their governing equations / definitions.

---

## 4. Execution Waves

### Wave 0 — Global scaffolding (~2 reviewer-days)

- Build the manuscript-wide notation index (Phase 1 `phase1_inventory.md`).
- Add claim-type, derivation-block, notation-box, and proved-vs-assumed macros to `preamble.tex`.
- Produce cross-chapter dependency graph (P2 item 9).
- **Build-verify** preamble changes with a clean pdflatex × 3 + bibtex loop.

### Wave 1 — Critical fails (~8–10 reviewer-days)

Order: **CH1 → CH9 → CH11 → CH10.**

Rationale: CH1 is foundational and propagates notation into every later chapter; CH9 and CH11 are the most math-light relative to the stated standard; CH10's governance notation is localized.

Per chapter:
- Apply cross-cutting P0 items (§2.1).
- Apply chapter-specific edits from §3.
- Build-verify; commit.

### Wave 2 — Marginal fails (~6–8 reviewer-days)

Order: **CH2 → CH5 → CH6 → CH7.**

Rationale: CH2 derivations feed CH5 scaling; CH5 disambiguates `N, k, p` reused in CH6 and CH7; CH7 memory equations depend on CH2 conventions.

### Wave 3 — Passing chapters, polish (~3–4 reviewer-days)

Order: **CH4 → CH8 → CH3.**

Rationale: CH4 benefits most from the new notation table; CH8 tightening is localized to DPO; CH3 is closest to publication-ready.

### Wave 4 — Harmonization + QA (~2–3 reviewer-days)

- Apply cross-cutting P1 items section-by-section where not already covered.
- Resolve residual symbol collisions surfaced during Waves 1–3.
- Add per-chapter Derivation Ledger appendices (P2 item 10).
- Run `REVIEW.md §G` consistency checklist per chapter.
- Build-verify full manuscript; commit.

**Total effort**: ~21–27 reviewer-days.

---

## 5. Per-Wave Exit Criteria

A wave is done when:

- All listed chapters carry a chapter-open Notation and Assumptions block.
- All claim-type labels are applied in substantive subsections.
- All listed stepwise derivations are written out using the derivation template.
- All listed worked numeric examples exist.
- All listed figures are tied to governing equations in caption or adjacent text.
- Proved vs Assumed recap appears at the end of every major section.
- The manuscript builds cleanly (pdflatex × 3 + bibtex, zero unresolved references, zero unresolved citations).
- Git commits made in logical units, each building cleanly.

## 6. Manuscript-Pass Exit Criteria (`REVIEW.md §C`)

- Every chapter scores `>= 2` on every rubric dimension.
- Every chapter has an average `>= 2.3`.
- Zero unresolved cross-chapter notation or assumption conflicts.
- All items in `REVIEW.md §G` QA checklist pass for every chapter.
