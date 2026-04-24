# Why & what: Week 4 — Transformer architecture

**Maps to:** `weeks/week04_transformer_architecture.tex`

## Gap

Scaled dot-product attention, masks, and FLOP budgets are the technical spine. A reader can compute shapes yet miss the *narrative economy*: attention is the mechanism that **routes information along token positions** in parallel, trading **all-to-all** compute for the ability to **mix** content across the whole prefix.

## What this chapter is for

- **What:** The canonical recipe—embeddings, blocks with self-attention + MLP, residual paths, layer norm—and the **operational** costs: memory in the KV cache, FLOPs in $T^2$ self-attention in naive form.
- **Why:** So design choices (GQA, FlashAttention, context length) are not treated as a magic menu but as **resource allocations** of attention’s core pattern.

## Suggested “human architecture” blurb

> A Transformer block is a repeated pattern: **at each position, look at other positions, pull in information that reduces prediction error, then apply a wide nonlinear transform**. The attention layer answers **“who do I look at when predicting the next thing?”** The FFN answers **“how do I process what I saw?”** Residuals + norms keep deep stacks trainable. None of this *is* “understanding” in a philosophical sense; it is **parallelizable, trainable, differentiable mixing**.

## Why / what anchors

| Idea | **What** | **Why** |
|------|----------|---------|
| Attention weights | A nonnegative mixture over past vectors (in causal setup). | **What** it formalizes: **context-dependent reweighting** of what came before. |
| Scaled dot product | Scale logits by $1/\sqrt{d_k}$. | **Why** to stop dot products from growing and saturating softmax when dimensions grow. |
| Causal mask | Forbid attending to the future. | **What** must hold for *training = inference* in autoregressive use. |
| MHA / MQA / GQA | Replicate or share K/V as groups. | **What** is traded: **quality vs memory bandwidth**; KV cache is often the *binding constraint* at long context. |
| RoPE / pos encoding | Add position without throwing away relativity. | **What** the model *needs* that pure embeddings do not: **order**; **RoPE** encodes *relative* structure which helps length generalization *somewhat*. |
| Pre-norm | Normalize before sublayers. | **Why** it tends to be easier to optimize; practical default in modern LLMs. |
| FlashAttention | I/O-aware tiling of attention. | **What** is optimized: **memory traffic**, not the mathematical *definition* of attention. |
| “Attention interpretability” | Heatmaps are **not** faithful explanations. | **Why** readers must be cautious: attention shows **one** routing pattern, not the **reasoning trace**. |

## Suggested one-sentence “big picture” (place near Fig. 1 of the chapter)

> **Attention is a learned, sparse-ish lookup that decides which past tokens to blend when computing each new representation; it replaced recurrence because the blend can be done in structure that hardware can parallelize.**

## Undergrad metaphors (use with explicit caveats)

- **Causal attention as “everyone can only look at what’s on their left in a line.”** Not society—just a training/inference contract.
- **KV cache** as “saved intermediate keys/values so you do not recompute the past for each new token.”

## “Why FLOP counting matters to non-architects” (short paragraph to add)

> FLOP and memory accounting are the language in which *teams negotiate* model size, batch size, and latency. A PM does not need tensors; they *do* need to know: **quadratic** attention vs **linear** in sequence length in naive implementations, and **cache** as the limiter in serving.

## Revision suggestions

- A micro-intuition figure caption: *This equation says how expensive attention is; this hardware note says why FlashAttention changes what lengths are deployable.* Link equation to curve.
- Plain-language “**what breaks first**” under long context: **not FLOPs alone**; **HBM, bandwidth, batching, kernel limits.**
