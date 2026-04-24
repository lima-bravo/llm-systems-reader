# Why & what: Week 7 — Adaptation, LoRA, quantization, deployment

**Maps to:** `weeks/week07_adaptation_lora_quantization.tex`

## Gap

The chapter already opens with a strong “engineering problem” frame. The extra human bridge: **most organizations will never pretrain, but will repeatedly adapt**—*what* a **delta** *means* in product terms (rollback, A/B, regulatory scope) and *why* full fine-tuning is both **expensive and risky cognitively** (catastrophic forgetting) even when compute exists.

## What this chapter is for

- **What:** Methods to start from a **base** $W_0$ and add a small, swappable **change** (LoRA/adapters) or to **shrink** numerics (INT8/4, GPTQ/AWQ, QLoRA) for serving.
- **Why:** So deployment is **versionable, testable, and reversible**—*properties* a single monolithic 140GB fine-tune often **lacks**.

## Suggested “one base, many heads” phrasing (short manifesto)

> Think of a foundation model as **long-term infrastructure** and an adaptation as **a product configuration**. The mathematical methods here—low-rank updates, quantization—exist so **configuration can be small, fast, and swappable** without secretly rewriting every capability. **What** you ship is often $(W_0, \Delta)$, not a brand-new $W$.

## Why / what anchors

| Topic | **What** | **Why** |
|--------|----------|---------|
| Full fine-tune | Update all parameters. | **What** you risk: **forgetting** unused skills, **giant** artifacts, **coarse** rollback, **long** re-validation. |
| LoRA / PEFT | Add low-rank $BA$ to selected weights. | **What** the hypothesis claims: **updates live in a thin subspace**; **why** it matters: **cheaper** train/serve of **deltas**. |
| Dora / Adapters (etc.) | Variants and routing of extra capacity. | **Picking** among them is an **MLOps** question: latency, #tasks, who edits what. |
| Quantization | Fewer bits per weight/activation. | **What** you trade: **memory and bandwidth** vs **error** in matmul; **perception** of “quality” can track surprising metrics. |
| PTQ vs QAT | Calibrate on data vs train with fake quant. | **Why** QAT costs more: **tighter** error bounds for aggressive quant. |
| QLoRA | LoRA in 4-bit base weights. | **What** is achieved: **consumer/adjacent** GPUs can **iterate**; **not** a substitute for *exact* 32-bit when numerics *matter*. |
| Registries, rollback, tests | Treat adapters as **releases**. | **Why** this chapter is in a **systems** book: **ML without change management** is a liability. |

## Undergrad “minimum” story

- **Base model** = expensive shared trunk on the network.
- **LoRA** = small **patch** file that only touches part of the weights.
- **Quantization** = same math with **shorter** numbers: faster/cheaper, but sometimes **dumber**; **you measure** on your tasks.

## Suggested “why low rank?” sentence without linear algebra

> Many useful changes to behavior do not require nudging *every* parameter; **they can sit in a few dominant directions of variation**. LoRA is the engineering bet that **a tiny matrix bank can capture the part of the update that the product actually cares about**.

## Concrete user-facing “why I should care”

> If the legal team asks, “**what** changed from v3 to v4?”, a **20MB LoRA** plus a pinned base is an **auditable** answer. A new **full** weight dump is a **forensic** project.

## Revision suggestions

- A **compliance** paragraph: **who signs off** on an adapter that changes refusal behavior in a regulated use case—ties Week 7 to Week 10 without the math.
- A **one-screen** “**quantization smoke test**” checklist: perplexity, task accuracy, refusal rate, toxicity—*because* all can move.
