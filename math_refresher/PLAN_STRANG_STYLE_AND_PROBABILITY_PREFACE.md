# Plan — Strang-style reasoning + probability preface (May 2026)

## Design target

Gilbert Strang’s textbooks motivate **before** symbol-pushing, restate the **idea in words**, show **why the formula is forced**, then **name what problem the next section solves**. Verbosity sits slightly *below* Strang’s chapter openings; density stays above a bullet-only cheatsheet.

Every non-trivial step should carry three labels where helpful:

| Label | Role |
|-------|------|
| **Insight** | One sentence: what truth about the world or data this captures. |
| **Lineage** | Primary tradition or named contributor(s); era optional. |
| **Mental model** | How to *think* when you reuse the idea (analogy, invariant, pitfall). |

## Deliverable A — Probability preface (`math_preface_probability.tex`)

Inserted after `\tableofcontents`, before Chapter 1. It is the **shared substrate** for all later chapters; chapter-specific probability is pointer-only unless additive.

### Reasoning steps (each an explanation task)

1. **Outcome space and events.** Kolmogorov’s axioms as language: measure on $\mathcal{F}$, normalization, countable additivity on disjoint events. *Insight:* uncertainty becomes algebra you can compute with. *Lineage:* Kolmogorov (1933). *Mental model:* specify $\Omega$ explicitly or ambiguities propagate.

2. **Conditional probability.** $P(A\mid B)=P(A\cap B)/P(B)$. *Insight:* restrict and renormalize the world to information $B$. *Lineage:* textbook formulation after Kolmogorov; conceptual roots to Bayes and gaming. *Mental model:* “given context” in LM is exactly this restriction.

3. **Chain rule for probabilities.** $P(A,B)=P(A\mid B)P(B)$ iterated. *Insight:* build joints from sequential restrictions—no extra modeling axiom. *Lineage:* elementary consequence of definition; Markov (1913) exemplified sequential dependence in language. *Mental model:* each factor must be well-defined (positive probability conditioning events).

4. **Bayes’ theorem (compact).** Posterior proportionality; optional one-line bridge to calibration thinking. *Insight:* invert conditioning direction when causes are latent. *Lineage:* Bayes; Laplace popularised. *Mental model:* not re-derived in every LM loss; kept so notation matches diagnostics literature.

5. **Random variables and expectation.** $E[f(X)]=\sum_x p(x)f(x)$ (discrete anchoring). *Insight:* collapse events into summaries while preserving linearity of expectation. *Lineage:* nineteenth–twentieth century formalism. *Mental model:* empirical loss is a Monte Carlo estimate of an expectation.

6. **Variance and sums.** $\mathrm{Var}(X)$, $\mathrm{Var}(\sum_i X_i)$ under independence sketch. *Insight:* quantify spread; explains noise in minibatch gradients and init scalings later. *Lineage:* classical. *Mental model:* independent summands add variance; correlated summands need covariances.

7. **Law of large numbers (operational).** Sample averages concentrate on expectations when data grow—qualitative only. *Insight:* training objectives justify themselves as large-sample surrogates. *Lineage:* Chebyshev / measure-theoretic LLN traditions. *Mental model:* finite-sample deviation is what engineering monitors.

8. **Maximum likelihood.** $\hat\theta=\arg\max_\theta \prod_i P_\theta(\text{data}_i)$; log-likelihood additive form. *Insight:* choose parameters that make observed data least surprising under the model class. *Lineage:* Fisher and predecessors; modern ML standard. *Mental model:* products $\to$ sums via $\log$ for curvature and numerics.

9. **Entropy and coding (Shannon).** $H(p)=-\sum_x p(x)\log p(x)$ as expected code length under optimal codes for $p$. *Insight:* uncertainty has a unique scalar summary consistent with coding axioms (informal). *Lineage:* Shannon (1948). *Mental model:* measured in nats or bits—never mix without converting.

10. **Cross-entropy and KL.** $H(p,q)$, $D_{\mathrm{KL}}(p\|q)$, decomposition $H(p,q)=H(p)+D_{\mathrm{KL}}(p\|q)$. *Insight:* mismatched codes pay extra bits; KL isolates *model* contribution. *Lineage:* Shannon; Kullback--Leibler (1951). *Mental model:* minimising CE on samples $\approx$ pushing $q$ toward empirical $p$.

### Chapter 1 deltas after preface

- Setting the Scene shortened where duplicated; explicit pointer: “Preface steps 1–10.”
- Each major bullet keeps derivation detail but adds **Insight / Lineage / Mental model** mini-headers only where not redundant with preface.

## Deliverable B — Chapters 2–13

For each chapter, **Setting the Scene** gains 3–6 `\paragraph{Step …}` blocks:

- **Step title** (what problem this chapter’s math answers).
- **Insight / Lineage / Mental model** (compact).

Later sections gain Strang-like **bridging sentences** (“We needed $X$ because …”; “The awkward part is …”) without duplicating the whole reader.

### Per-chapter explanation tasks (high level)

| Ch | Core reasoning chain to articulate |
|----|-------------------------------------|
| 2 | Local linear model of $\mathcal{L}$ $\to$ noisy gradient $\to$ signal processing view of optimisers $\to$ stability controls $\to$ empirical scaling as macro-LLN |
| 3 | Composition $\to$ calculus chain rule vs probability chain rule $\to$ Jacobian bookkeeping $\to$ trainability vs universality |
| 4 | Discrete $\to$ continuous representation $\to$ geometry of similarity $\to$ contextual drift |
| 5 | Bilinear scores $\to$ normalisation $\to$ masking as constraints $\to$ quadratic cost awareness |
| 6 | Same likelihood head, new inference-time map $\to$ decoding as measure pushforward |
| 7 | Work vs bandwidth $\to$ sparsity swaps bottleneck $\to` CF as queueing abstraction |
| 8 | Low-rank correction subspace $\to` quantisation as noisy channel $\to` gates on drift |
| 9 | Pairwise likelihood $\to` margins $\to` KL anchor |
| 10 | Set-valued relevance $\to` decomposition of pipeline error |
| 11 | Hazard $\to` controls $\to` correlation caveat |
| 12 | Utilisation $\to` tails $\to` retries compounding load |
| 13 | Multi-axis diagnosis $\to` intervention matching |

## Implementation order

1. Add `math_preface_probability.tex` and `\input` after TOC in `math_refresh.tex`.
2. Trim redundancy in Chapter 1 Setting; add pointers to preface.
3. Annotate Chapters 2–13 Setting the Scene with stepped Strang-style blocks.
4. Pass `pdflatex` on `math_refresh.tex`.

## Status

**Implemented:** `math_preface_probability.tex` + `\input` in `math_refresh.tex`; Chapter~1 Setting trimmed to pointer + numbered reasoning cadence and enriched bullets with `\textit{Insight / Lineage / Mental model}` tags; Chapters~2--13 Setting the Scene rewritten into stepped `\paragraph{Step …}` blocks tying forward to Preface steps where natural.

Recompile with `pdflatex math_refresh.tex` after edits.
