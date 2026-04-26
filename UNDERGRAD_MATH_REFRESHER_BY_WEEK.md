<!-- markdownlint-disable MD022 MD032 -->
# Undergraduate Math Refresher By Week

This is a lookup guide, not a linear tutorial. Use the week section you need, then jump to the references for that topic.

## How To Use This Refresher
- Read only the week you are currently studying.
- If a topic was already covered in an earlier week, follow the pointer instead of re-reading everything.
- Use this for reminders, not full proofs.

---

## Week 1 — Statistical Foundations

Refresh topics:
- Probability distributions, conditional probability, chain rule, MLE/NLL.
- Entropy, cross-entropy, KL divergence, and identity relationships.
- Softmax/logit algebra, log-sum-exp, shift invariance.
- Perplexity as `exp(cross-entropy)` and why tokenization changes it.
- Calibration basics: reliability diagrams, ECE, temperature scaling.
- Proper scoring rules intuition.

Further study: `[R1] [R2] [R3] [R4]`

---

## Week 2 — Optimization, Generalization, Scaling

Refresh topics:
- Gradient descent, SGD, momentum, Adam/AdamW update mechanics.
- Learning-rate schedules (warmup, cosine) and stability intuition.
- Gradient clipping and unstable-gradient control.
- Mixed precision and loss scaling basics.
- Bias-variance and double-descent intuition.
- Scaling laws and compute-optimal tradeoffs.

Pointers:
- Calibration/probability metrics: see Week 1 refresher.

Further study: `[R5] [R6] [R7]`

---

## Week 3 — Tokenization and Embeddings

Refresh topics:
- One-hot vectors and embedding lookup as matrix multiplication.
- BPE/WordPiece/Unigram as segmentation and coding heuristics.
- Dot product, cosine similarity, norms, geometric intuition.
- Distributional semantics and analogy-vector limits.
- Embedding anisotropy and nearest-neighbor behavior.

Pointers:
- Softmax/probability output layer: see Week 1 refresher.

Further study: `[R8] [R9] [R10]`

---

## Week 4 — Transformer Architecture

Refresh topics:
- Scaled dot-product attention as matrix operations.
- Causal masking as a structured constraint.
- Multi-head attention as subspace decomposition.
- Layer norm and residual connections.
- Positional encoding math (sinusoidal/relative/rotary).
- KV-cache shape arithmetic and complexity.
- Attention numerical stability motivation.

Pointers:
- Linear algebra basics: see Week 3 refresher.
- Softmax numerics: see Week 1 refresher.

Further study: `[R9] [R11] [R12]`

---

## Week 5 — Pretraining and In-Context Learning

Refresh topics:
- Autoregressive objective as conditional likelihood factorization.
- Masked vs causal objectives in probabilistic terms.
- Sampling controls: temperature, top-k, top-p.
- Train/test distribution mismatch intuition.
- Scaling-law extrapolation basics.
- Interpreting emergence claims cautiously.

Pointers:
- CE/perplexity/temperature math: see Week 1 refresher.
- Optimization dynamics: see Week 2 refresher.

Further study: `[R5] [R6] [R13]`

---

## Week 6 — Efficiency, Scaling, MoE

Refresh topics:
- Parallelism arithmetic (data/model/pipeline/expert).
- Communication vs computation tradeoffs.
- Sparse routing intuition in MoE (top-k simplex view).
- Load balancing intuition and collapse failure mode.
- Memory accounting (optimizer states, activations).
- Throughput/latency scaling with basic rate models.

Pointers:
- Optimization stability: see Week 2 refresher.
- Matrix and attention complexity: see Week 4 refresher.

Further study: `[R6] [R7] [R14]`

---

## Week 7 — Adaptation, LoRA, Quantization

Refresh topics:
- Low-rank matrix factorization intuition behind LoRA.
- Rank vs expressivity tradeoffs.
- Quantization basics: scale, zero-point, rounding error.
- Mixed-precision numerical error intuition.
- QLoRA-style memory/compute tradeoff.
- Approximation error vs deployment efficiency.

Pointers:
- Matrix factorization fundamentals: see Week 3 refresher.
- Optimization and numerics: see Week 2 refresher.

Further study: `[R9] [R14] [R15]`

---

## Week 8 — Alignment and Preference Optimization

Refresh topics:
- Pairwise preference modeling (Bradley-Terry/logistic form).
- KL-regularized objective intuition in RLHF/DPO.
- Reward modeling as supervised approximation.
- PPO/DPO as constrained optimization viewpoints.
- Label noise and annotator disagreement effects.

Pointers:
- KL/cross-entropy foundation: see Week 1 refresher.
- Optimization mechanics: see Week 2 refresher.

Further study: `[R1] [R5] [R16]`

---

## Week 9 — RAG, Tools, Evaluation

Refresh topics:
- Retrieval metrics: precision@k, recall@k, ranking tradeoffs.
- Dense/sparse similarity math (dot/cosine/BM25 intuition).
- ANN indexing basics.
- Chunking tradeoffs as context-budget allocation.
- Evaluation metrics: task metric vs proxy metric.
- Basic significance discipline for A/B comparisons.

Pointers:
- Embedding geometry: see Week 3 refresher.
- Calibration/uncertainty basics: see Week 1 refresher.

Further study: `[R10] [R17] [R18]`

---

## Week 10 — Governance and Assurance

Refresh topics:
- Risk matrices and expected-impact style reasoning.
- Hazard decomposition (severity/likelihood structure).
- Uncertainty quantification for decision thresholds.
- Sampling and audit coverage intuition.
- False-positive/false-negative tradeoffs in control gates.
- Claims/evidence argument structure.

Pointers:
- Evaluation caveats: see Week 9 refresher.
- Calibration uncertainty framing: see Week 1 refresher.

Further study: `[R19] [R20] [R21]`

---

## Week 11 — APIs, Agents, MCP

Refresh topics:
- Latency decomposition and throughput arithmetic.
- Queueing basics (M/M/1 blow-up near saturation).
- Retry probability and geometric expectation.
- Token-based linear cost modeling.
- Reliability arithmetic for retries/backoff.
- Boundary reasoning with set unions/intersections.

Pointers:
- Systems scaling intuition: see Week 6 refresher.
- Evaluation discipline: see Week 9 refresher.

Further study: `[R7] [R22] [R23]`

---

## Week 12 — Human-Centric Error Model

Refresh topics:
- Multi-axis error decomposition and confounded causes.
- Conditional error analysis and slice-based reasoning.
- Correlation vs intervention caution.
- Hypothesis-pruning style diagnostics.
- Measurement reliability and observer disagreement basics.
- Multi-objective tradeoff surfaces (accuracy/safety/latency/cost).

Pointers:
- Calibration and uncertainty: see Week 1 refresher.
- Eval harness and slicing: see Week 9 refresher.
- Governance risk framing: see Week 10 refresher.

Further study: `[R1] [R20] [R21]`

---

## Reference List

- `[R1]` Murphy, *Probabilistic Machine Learning*.
- `[R2]` Bishop, *Pattern Recognition and Machine Learning*.
- `[R3]` Cover and Thomas, *Elements of Information Theory*.
- `[R4]` Guo et al. (2017), *On Calibration of Modern Neural Networks*.
- `[R5]` Goodfellow, Bengio, Courville, *Deep Learning*.
- `[R6]` Stanford CS229/CS231n notes (optimization and deep learning numerics).
- `[R7]` Performance modeling and queueing lecture notes (MIT/Stanford style systems courses).
- `[R8]` Jurafsky and Martin, *Speech and Language Processing*.
- `[R9]` Strang, *Introduction to Linear Algebra*.
- `[R10]` Stanford CS224N/CS224U materials.
- `[R11]` Vaswani et al. (2017), *Attention Is All You Need*.
- `[R12]` The Annotated Transformer (Harvard NLP).
- `[R13]` Hoffmann et al. (2022), *Training Compute-Optimal Large Language Models*.
- `[R14]` Trefethen and Bau, *Numerical Linear Algebra* (or equivalent notes).
- `[R15]` Hu et al. (LoRA) and Dettmers et al. (QLoRA).
- `[R16]` Core RLHF/DPO papers (Christiano, Stiennon, Ouyang, Rafailov et al.).
- `[R17]` Manning, Raghavan, Schutze, *Introduction to Information Retrieval*.
- `[R18]` FAISS/HNSW primary papers for ANN indexing.
- `[R19]` Leveson, *Engineering a Safer World*.
- `[R20]` NIST AI RMF and related implementation profiles.
- `[R21]` Standard statistical testing notes (confidence intervals, effect size, significance).
- `[R22]` Harchol-Balter, *Performance Modeling and Design of Computer Systems*.
- `[R23]` Google SRE workbook chapters on retries, overload, and reliability budgeting.
