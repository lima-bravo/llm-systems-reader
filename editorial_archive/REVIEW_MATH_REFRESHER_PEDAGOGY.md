# Math Refresher — Pedagogy Review (May 2026)

Pass goal: flag **story jumps** and **high-level bullets that do not teach**, then fold fixes into the `.tex` sources.

## Chapter 1 — Probability / likelihood / calibration

| Issue | Resolution |
|-------|------------|
| **Probability chain rule** appears as a single product formula with only the sentence ``repeated application of conditional probability'' — no bridge from \(P(A,B)=P(A\mid B)P(B)\) to the sequence product. | Expanded: two-token → \(T\)-token recursion in words + displayed factorisation. |
| **\(H(p,q)=H(p)+D_{\mathrm{KL}}(p\|q)\)** stated without interpretive glue. | Added short ``coding / excess bits'' reading and consequence for minimising CE vs \(q\) alone. |
| **Softmax shift invariance** given without intuition. | Added why subtracting \(c\) leaves ratios unchanged and why \(c=\max z\) caps exponentials. |
| **Calibration** one sentence — easy to read as vague skepticism. | Split fit vs calibration; tied to top-\(k\) probability vs empirical hit rate. |
| No **Notation** subsection (rest of book uses one). | Added compact notation block for \(x_t\), \(x_{<t}\), \(V\), logits. |

## Chapter 2 — Optimisation / scaling

| Issue | Resolution |
|-------|------------|
| Opening jumps from history to ``critical insight'' without linking **why noise matters**. | Clarified minibatch gradient as true gradient + noise and \(\mathrm{Var}\sim 1/B\) scaling. |
| **Momentum** equation only — no physical analogy. | Added low-pass / heavy-ball sentence. |
| **Adam bias correction** — symbolic only. | Added interpretation: early EMA dominated by zero init. |
| **AdamW** absent though reader emphasises it. | Added intuition bullet + glossary entry. |
| **Mixed precision** — mechanism compressed. | Expanded loss scaling → gradient rescaling chain. |
| **Scaling laws** — ``fitted regularities'' without reader anchor. | Linked to planning \(N,D\) under fixed compute. |

## Chapter 3 — Neural networks

| Issue | Resolution |
|-------|------------|
| ``Composition of affines is affine'' asserted without **one-line proof sketch**. | Added two-layer expansion showing linear + affine absorbs into single \(W,b\). |
| **Jacobian** paragraph dense for readers who fear matrices. | Added scalar-on-vector warmup before general formula. |
| **\(p-e_k\)** gradient stated without derivation path. | Added boxed derivation via log-softmax / CE derivative sketch. |
| XOR geometry proof hand-wavy (``three corners'' argument). | Replaced with coordinate-case argument on separating lines. |

## Chapter 4 — Tokenisation / embeddings

| Issue | Resolution |
|-------|------------|
| Tokeniser described as mapping ``text \(\to\) ID'' — hides **token sequences**. | Noted variable-length sequences \(x_{1:T}\). |
| \(E^\top \mathrm{onehot}(i)\) ``row selection'' under-explained. | Added explicit row-index view. |
| **Anisotropy** jargon-only. | Added cone / neighbour-reliability interpretation. |

## Chapter 5 — Attention

| Issue | Resolution |
|-------|------------|
| \(\sqrt{d_k}\) scaling unexplained. | Added variance / magnitude control intuition (dot products grow with dimension). |
| Attention equation dropped without **word walkthrough**. | Added row-normalised weighted sum of value rows. |
| Residual + norm named without purpose. | One sentence each on signal highway vs scale stabilisation. |

## Chapter 6 — Pretraining / decoding

| Issue | Resolution |
|-------|------------|
| ``Same probability chain'' pointer-only. | Restated autoregressive joint as product of next-token terms in one line. |
| Top-\(k\) / top-\(p\) listed, not **ordered steps**. | Added numbered decode steps (mass retention). |

## Chapter 7 — MoE / systems arithmetic

| Issue | Resolution |
|-------|------------|
| Arithmetic intensity abstract. | Roofline / bandwidth-cap intuition sentence. |
| MoE routing terse. | Gate softmax / sparse mask / renormalise on support. |

## Chapter 8 — LoRA / quantisation

| Issue | Resolution |
|-------|------------|
| Low-rank update dropped without **why low rank**. | Subspace / parameter-count intuition. |
| Quantisation ``finite codes'' thin. | Scale factors + outlier sensitivity sentence. |

## Chapter 9 — Alignment / preferences

| Issue | Resolution |
|-------|------------|
| Bradley--Terry formula only. | Margin \(\Delta r\) maps to preference odds via sigmoid. |
| KL regularisation role under-specified. | Anchor policy \(\pi\) to \(\pi_{\mathrm{ref}}\); discourage unsupported modes. |

## Chapter 10 — RAG / evaluation

| Issue | Resolution |
|-------|------------|
| Ranking metrics named, not **defined**. | Explicit \(\mathrm{Prec@}k\), \(\mathrm{Rec@}k\) formulas with \(|R_k\cap G|\). |

## Chapter 11 — Governance / assurance

| Issue | Resolution |
|-------|------------|
| Multiplicative controls mentioned without **formula**. | Displayed \(R_{\mathrm{res}}=R\prod_i(1-\eta_i)\) with independence caveat. |

## Chapter 12 — Queues / retries

| Issue | Resolution |
|-------|------------|
| M/M/1 dropped without **assumptions**. | Poisson arrivals / exponential service / single server caveat. |
| Retry \(\mathbb{E}[K]\) as magic fraction. | Named geometric expectation for i.i.d.\ failures. |

## Chapter 13 — Diagnostic ladder

| Issue | Resolution |
|-------|------------|
| Five axes listed cold. | One operational phrase per axis in Setting the Scene. |
| Chapter 1 pointer embedded under **Intuition Checkpoints** (wrong subsection). | Moved to **Pointers** subsection. |

---

Subsequent edits implement the resolutions above in `math_chapter01.tex` … `math_chapter13.tex`.
