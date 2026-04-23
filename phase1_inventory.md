# Phase 1 Inventory — Notation, Assumptions, Derivation Map

Deliverable for `REVIEW_PLAN.md §4 Wave 0`. Feeds the per-chapter edits in Waves 1–3 and the harmonization pass in Wave 4.

---

## 1. Global Notation Map

Source: scan of `weeks/week01_*.tex` through `weeks/week11_*.tex`. Each row records all distinct meanings assigned to a symbol across the manuscript, how it is introduced, and the collision class.

Collision classes:
- **CRITICAL**: same symbol used for different, frequently co-occurring mathematical objects; must be disambiguated.
- **HIGH**: same symbol used for unrelated meanings in chapters that reference each other; should be disambiguated.
- **MEDIUM**: meaning changes between chapters but chapters are far apart and local definition is clear; reintroduce on reuse.
- **LOW**: single meaning, or distinguishable by subscript / context without risk.

| Symbol | Chapter(s) | Meaning(s) | Introduction | Class |
|---|---|---|---|---|
| `N` | 2, 5, 6 | (a) parameter count (Chinchilla); (b) number of experts (MoE); (c) implicit batch count | Explicit in 5 and 6; ad hoc in 2 | **HIGH** |
| `D` | 2, 5, 6, 9 | (a) dataset size in tokens; (b) embedding dimension context; (c) document set in RAG | Explicit in 5 (scaling) and 9 (RAG); ambiguous in 2/6 | **HIGH** |
| `T` | 1, 4, 5 | (a) sequence length; (b) decoding temperature; (c) context length | Explicit in 1 and 5; 4 uses it as length | **HIGH** |
| `C` | 5, 6, 11 | (a) compute budget (FLOPs); (b) MoE capacity factor; (c) chunk set in RAG (when applicable); prompt-cache context | Explicit in 5 and 6 | **HIGH** |
| `H` | 1, 4 | (a) entropy; (b) number of attention heads | Explicit in 1; in 4 only as count via `H_q`, `H_kv` | MEDIUM |
| `L` | 1, 2, 4, 5, 10 | (a) loss / likelihood; (b) number of layers; (c) likelihood-of-hazard (Week 10) | Mixed; loss vs. layer count usually clear by position | MEDIUM |
| `d, d_k, d_v` | 3, 4, 6, 7 | embedding dim and per-head dims | Explicit in 4 | LOW |
| `r` | 7, 8, 9 | (a) LoRA rank; (b) reward (DPO `r_\phi`); (c) retrieval index | 7 explicit; 8 subscripted `r_\phi`; 9 contextual | **HIGH** |
| `alpha` | 5, 6, 7, 8 | (a) LoRA scaling `alpha/r`; (b) MoE auxiliary-loss weight; (c) min-p threshold (Week 5); (d) DPO-related scaling | Mixed | **CRITICAL** |
| `beta` | 2, 6, 8 | (a) Adam momentum `beta_1`, `beta_2`; (b) MoE router-z-loss weight; (c) DPO KL coefficient | Mixed | **CRITICAL** |
| `k` | 5, 6, 9 | (a) top-k decoding; (b) top-k experts; (c) retrieval cutoff | Explicit in each chapter, but same letter | **HIGH** |
| `p` | 5 | top-p / nucleus cutoff; probability mass | Explicit | LOW |
| `pi_theta`, `pi_ref` | 8 | trained policy vs. reference | Explicit | LOW |
| `r_phi` | 8 | reward model | Explicit | LOW |
| `rho` | 5 | repetition penalty | Implicit (used without defn) | MEDIUM |
| `sigma` | 8 | sigmoid | Implicit | MEDIUM |
| `theta` | all | model parameters | Never formally defined as `theta \in R^P` | MEDIUM |
| `V` | 1, 3 | vocabulary / vocabulary size | Introduced in 1 | LOW |
| `q` | 4, 9 | (a) query vector in attention; (b) user query in RAG | Explicit in each; different contexts | MEDIUM |
| `G` | 9, 10 | (a) gold-span set in RAG; (b) top-level goal in GSN (Week 10) | New in plan, not yet in manuscript | LOW |
| `R_k(q)` | 9 | retrieval set of top-k docs | To be added | LOW |
| `TTFT, TPOT` | 11 | first-token latency, per-output-token latency | Explicit acronym | LOW |
| `RPM, TPM` | 11 | requests / tokens per minute | Explicit acronym | LOW |
| `lambda` | 11 (planned) | arrival rate (queuing) | To be added | LOW |
| `mu` | 11 (planned) | service rate (queuing) | To be added | LOW |
| `c_in, c_out, c_cache` | 11 (planned) | per-token input/output/cache cost | To be added | LOW |
| `p_retry` | 11 (planned) | retry probability | To be added | LOW |
| `S` | 10 (planned) | hazard severity | To be added | LOW |
| `eta` | 10 (planned) | control efficacy | To be added | LOW |

### 1.1 Critical collision resolutions

- **`alpha`**
  - Reserve `\alpha` (bare) for LoRA scaling (`\alpha / r`) because Week 7 uses it densely.
  - Rename MoE auxiliary-loss weight to `\alpha_{\mathrm{bal}}`.
  - Rename min-p floor in Week 5 to `\alpha_{\min p}`.
  - Any DPO/RL scaling that was written as `\alpha` becomes `\lambda_{\mathrm{KL}}` or `\beta` as applicable.

- **`beta`**
  - Adam momenta remain `\beta_1, \beta_2` (subscripted; no conflict).
  - DPO KL-penalty coefficient is the canonical `\beta` (bare) in Week 8.
  - MoE router-z-loss weight is renamed `\beta_{\mathrm{z}}`.

- **`N`**
  - Parameter count is `N` in scaling-law contexts (Weeks 2, 5, 7).
  - Number of experts in MoE is renamed `E` (already used sporadically in Week 6).
  - Dataset size in tokens is `D`.

- **`D`**
  - Dataset size in tokens remains `D`.
  - Document set in RAG is `\mathcal{D}` (calligraphic).
  - Embedding dimension remains `d` (lowercase, distinct from `D`).

- **`T`**
  - Sequence / context length is `T` (in Weeks 4, 5, 11).
  - Decoding temperature is renamed `\tau` in Week 5.

- **`k`**
  - Decoding top-k stays `k` within Week 5.
  - MoE top-k experts is renamed `k_{\mathrm{E}}` in Week 6.
  - RAG retrieval cutoff is renamed `k_{\mathrm{R}}` in Week 9.

- **`r`**
  - LoRA rank stays `r` in Week 7.
  - Reward model is `r_\phi` (already subscripted).
  - Retrieval rank/index in Week 9 is renamed `j` or `\mathrm{rank}(d)`.

- **`C`**
  - Compute budget stays `C` (Weeks 2, 5).
  - MoE capacity factor is renamed `\mathrm{CF}` (already used in prose).
  - Chunk set in RAG is `\mathcal{C}` (calligraphic).

These renamings are implemented globally in Wave 4 harmonization. Until then, Waves 1–3 follow the renamed convention and flag any remaining bare-letter uses for harmonization.

### 1.2 Symbols currently used without explicit definition

- `\rho` (repetition penalty, Week 5) — add definition in Wave 2.2.
- `\sigma` (sigmoid, Week 8) — add definition in Wave 3.2.
- `\theta` (model parameters) — add formal statement `\theta \in \mathbb{R}^P` in Week 1 notation block (Wave 1.1).

---

## 2. Assumptions Map

Tracks the modelling assumptions invoked across chapters. Each chapter will carry a list `[A1], [A2], …` referenced inline.

| ID | Chapter | Assumption | Status |
|---|---|---|---|
| A1.1 | 1 | Token sequences treated as realizations of an ergodic stochastic process; token-context pairs i.i.d. under the empirical measure for MLE purposes | to add |
| A1.2 | 1 | Vocabulary `V` is finite and fixed; distributions over `V` are strictly positive after softmax | to add |
| A1.3 | 1 | Calibration is evaluated under the same distribution as training conditioning | to add |
| A2.1 | 2 | SGD gradient noise has bounded covariance and is approximately Gaussian over mini-batches | to add |
| A2.2 | 2 | Learning rate sufficiently small for continuous-time SDE approximation | to add |
| A2.3 | 2 | Mixed-precision casts preserve optimization dynamics up to quantization noise | to add |
| A4.1 | 4 | Attention weights are well-approximated by dense softmax (no sparsity prior) | to add |
| A4.2 | 4 | Position encoding invariance holds across training and inference context lengths up to a stated bound | to add |
| A5.1 | 5 | Compute-optimal frontier derived from power-law loss surfaces (Chinchilla) with smoothness and monotonicity | to add |
| A5.2 | 5 | Decoding is performed on frozen logits; no test-time parameter updates | to add |
| A6.1 | 6 | Router is differentiable and token-level routing choices are independent conditional on input | to add |
| A6.2 | 6 | Capacity factor sized so that expert-level parallelism dominates routing overhead | to add |
| A7.1 | 7 | Adapter update `\Delta W = BA` lies in a low-rank subspace relative to full fine-tuning | to add |
| A7.2 | 7 | Quantization error at evaluation is bounded in 2-norm by a scheme-dependent constant | to add |
| A8.1 | 8 | Bradley-Terry model for pairwise preferences with a transitive latent reward | to add |
| A8.2 | 8 | Reference policy `pi_ref` is close in KL to the target optimum (no distribution shift) | to add |
| A9.1 | 9 | Retrieval index is fresh relative to query distribution (no staleness at query time) | to add |
| A9.2 | 9 | Retrieved context is trusted up to the injection-attack model | to add |
| A10.1 | 10 | Hazard-analysis decomposition is complete up to a stated coverage budget | to add |
| A10.2 | 10 | Residual risk is sub-additive over independent controls | to add |
| A11.1 | 11 | Request arrivals approximately Poisson; service times approximately exponential (M/M/1 simplification) | to add |
| A11.2 | 11 | Agent loop is monotonically decreasing in remaining budget (termination invariant) | to add |
| A11.3 | 11 | Tool-output injection adversary is PPT-bounded and does not modify protocol-level invariants | to add |

---

## 3. Derivation Map

Key equations whose stepwise derivations are added in Waves 1–3. Each entry links the final identity to the chapter in which its stepwise form lives.

| Identity | Chapter | Wave | Currently | Target |
|---|---|---|---|---|
| `\mathrm{MLE}(\theta) = \arg\max \prod_t p_\theta(x_t | x_{<t}) \Rightarrow \arg\min \frac{1}{NT}\sum \sum -\log p_\theta` | 1 | 1.1 | asserted | stepwise |
| `H(p, q) = H(p) + \KL(p \Vert q)` | 1 | 1.1 | asserted | stepwise (3-line) |
| softmax shift invariance: `\mathrm{softmax}(z + c\mathbf{1}) = \mathrm{softmax}(z)` | 1 | 1.1 | stated | stepwise with `\exp(c)` cancellation |
| `\arg\min H = \arg\min \exp(H)` for perplexity | 1 | 1.1 | verbal | one-line formal |
| ECE finite-bin estimator `\mathrm{ECE} = \sum_b \frac{|B_b|}{n} | \mathrm{acc}(B_b) - \mathrm{conf}(B_b) |` | 1 | 1.1 | definition only | estimator derivation + small-sample caveat |
| SGD-to-SDE: `d\theta_t = -\nabla \mathcal{L}(\theta_t) dt + \sqrt{\eta \Sigma} dW_t` | 2 | 2.1 | asserted | stepwise with A2.1, A2.2 |
| Chinchilla compute-optimal: minimize `L(N, D)` s.t. `C = 6ND` via Lagrangian; `N^* \propto C^{1/2}`, `D^* \propto C^{1/2}` | 2, 5 | 2.1 / 2.2 | stated | KKT-level derivation |
| Attention variance motivation for `1/\sqrt{d_k}` | 4 | 3.1 | motivated | explicit variance calculation under A4.1 |
| RoPE rotation: `q^\top_m R_{\Theta, m-n} k_n` | 4 | 3.1 | stated | one-step derivation from 2D rotation |
| GQA KV-cache size `= 2 L T H_{kv} d_k b` bytes | 4 | 3.1 | verbal | formal with a worked numeric |
| LoRA param ratio `\frac{r(d + k)}{d k}` | 7 | 2.4 | noted | derivation + regime analysis |
| NF4 quantile construction | 7 | 2.4 | reference only | construction sketch |
| DPO loss from Bradley-Terry closed-form policy | 8 | 3.2 | stated | stepwise with normalization / support argument |
| BM25 `\sum_{t \in q} \mathrm{IDF}(t) \cdot \frac{\mathrm{tf}(t, d) (k_1 + 1)}{\mathrm{tf}(t, d) + k_1(1 - b + b |d|/\overline{|d|})}` | 9 | 1.2 | absent | full definition |
| Cosine similarity with normalization caveat | 9 | 1.2 | verbal | formal |
| RAG metrics (context recall/precision, faithfulness, answer relevance) | 9 | 1.2 | verbal | set-ratio definitions |
| Risk score `\mathrm{risk} = f(S, L)` with uncertainty bands | 10 | 1.4 | absent | minimal formalization |
| Assurance-case confidence propagation (GSN) | 10 | 1.4 | narrative | worked mini-example |
| M/M/1 mean latency `1/(\mu - \lambda)` adapted to RPM/TPM | 11 | 1.3 | absent | derivation |
| Expected cost with retries and streaming interruption | 11 | 1.3 | absent | derivation |
| Agent loop budget invariant: remaining-steps monovariant | 11 | 1.3 | absent | termination proof sketch |

---

## 4. Claim-Type Audit (initial pass)

For every chapter, the first-pass count of mathematically substantive paragraphs that need a Definition / Identity / Assumption / Empirical / Consequence label. Target for Wave 1–3: bring the "unlabelled" column to zero for all chapters.

| Chapter | Unlabelled (est.) | Priority |
|---|---|---|
| 1 | ~25 | P0 (chapter primary failing dim) |
| 2 | ~15 | P0 |
| 3 | ~8 | P1 |
| 4 | ~18 | P0 |
| 5 | ~20 | P0 |
| 6 | ~15 | P0 |
| 7 | ~15 | P0 |
| 8 | ~12 | P0 |
| 9 | ~20 | P0 (critical fail) |
| 10 | ~25 | P0 (fail) |
| 11 | ~30 | P0 (fail) |

---

## 5. Cross-Chapter Dependency Graph (textual)

Machine-readable edges used by the front-matter dependency diagram (`figures/chapter_dependencies.tex`) produced next.

```
W01 -> W02 (entropy, NLL, CE)
W01 -> W04 (probability / softmax)
W01 -> W05 (likelihood, decoding)
W01 -> W08 (KL, likelihood ratios)
W01 -> W09 (evaluation metrics grounding)
W02 -> W05 (scaling laws)
W02 -> W06 (optimization under parallelism)
W02 -> W07 (fine-tuning optimization)
W03 -> W04 (embedding input)
W03 -> W05 (tokenization affects pretraining targets)
W04 -> W05 (architecture -> objective)
W04 -> W06 (architecture -> MoE)
W04 -> W07 (architecture -> adapters)
W04 -> W11 (architecture -> inference-time shape)
W05 -> W06 (pretraining -> efficiency)
W05 -> W08 (LM base -> alignment)
W06 -> W11 (efficiency -> serving)
W07 -> W08 (adapters in RLHF/DPO stacks)
W07 -> W11 (quantization -> serving)
W08 -> W09 (aligned model -> system)
W08 -> W10 (alignment -> governance)
W09 -> W10 (system -> governance, assurance)
W09 -> W11 (system -> access surface)
W10 -> W11 (governance constraints -> APIs)
```

---

## 6. Wave 0 artifacts produced

- `phase1_inventory.md` (this file).
- Preamble macros for notation box, derivation block, claim-type labels, proved-vs-assumed recap (added to `preamble.tex`).
- `figures/chapter_dependencies.tex` (TikZ dependency graph, rendered in front matter).
- Front-matter hook in `main.tex` to render the dependency figure.

Exit criterion for Wave 0: manuscript builds cleanly with new preamble and new figure. No chapter content changes yet.
