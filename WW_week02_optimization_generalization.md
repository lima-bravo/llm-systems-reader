# Why & what: Week 2 — Optimization, generalization, scaling

**Maps to:** `weeks/week02_optimization_generalization.tex`

## Gap

SGD, Adam, schedules, and scaling laws are derived or stated with high density. A reader can perform the updates yet still miss the *operational* point: training is a noisy, budgeted search in billions of dimensions under hardware constraints, and “generalization” here is *empirically* observed—not something the chapter proves from convexity.

## What this chapter is for

- **What:** The mechanical story of *how* weights move (stochastic gradients, adaptive moments, schedules, clipping) and the macro story of *how much compute and data* buys what quality.
- **Why:** So when training diverges, slows, or plateaus, you can separate **bad hyperparameters** from **bad pipeline assumptions**, and when planning capacity, you can reason in **FLOPs and tokens** instead of “bigger is better” slogans.

## Suggested lead-in (human-centered)

> This chapter is not about proving that SGD converges. It is about what actually happens when you take the Week~1 loss and minimize it in the only regime that matters for LLMs: **enormous models, small minibatches, finite time, and real clusters**. The optimizers and schedules exist to **stabilize noise** and **use hardware**. The scaling laws are **curve fits** with engineering consequences: if you have a compute budget, they tell you how to spend it *between* parameters and data.

## Why / what anchors

| Topic | **What** | **Why** |
|--------|----------|---------|
| SGD as noise | You follow noisy estimates of a gradient, not the full gradient. | Sets expectation: some jitter is *normal*; the question is whether variance is controlled. |
| Momentum / Adam | Maintain running estimates to adapt step sizes per parameter. | **Why** not plain SGD: ill-conditioning and pathological curvature are typical in deep nets. |
| Warmup + decay | Don’t start at full step size; cool down the schedule. | **Why** early instability and late overfitting/noise; **what** a schedule *buys* is stable convergence under mixed precision. |
| Gradient clipping | Cap update magnitude. | In RNN/Transformer stacks, a few spiky activations/gradients can derail training—clipping is a **safety rail**, not a hack. |
| Mixed precision + loss scaling | Use fp16 where possible, scale loss to avoid underflow. | **What** the engineer trades: **memory and throughput** vs **numerical risk**. |
| Chinchilla / Kaplan | Power-law relations among parameters, data, and loss. | **What** they answer: *given a FLOP budget, should I buy more width or more tokens?* **Why** it matters: mis-sized runs waste millions. |
| Double descent / benign overfitting | High-capacity models can generalize in ways classical U-shaped bias–variance stories miss. | **Why** “overparameterized” is not an insult here—**but** it is *not* a license to skip measurement. |
| Reproducibility | Seeds, determinism, data order. | **What** is at stake: **regressions and audits**; **why** ML without reproducibility is not engineering. |

## Suggested one-paragraph “philosophy of the chapter”

> Optimization teaches you how a model *gets* the weights; it does not define what “truth” the weights represent. The loss landscape is not interpretable the way a physical model is—**what** you can trust is the **measurement stack**: ablations, held-out quality, and comparing runs under the same data and seed policy. Treat scaling laws as **budgeting tools**: they tell you *where* you are likely on the Pareto frontier, not *why* the frontier exists.

## Undergrad-level mental model

- Think: **gradient = noisy compass**, **learning rate = step size in fog**, **schedule = when to take big vs small steps**, **scaling laws = how much food (tokens) a big animal (parameters) needs**.

## Suggested “warning label” phrasing (integrate where scaling laws appear)

> These laws are **empirical fits** on a band of model sizes. Extrapolating to very small or very large compute can mislead. The **why** of using them is *relative allocation of budget*, not prophecy.

## Revision suggestions

- A short “**if training blows up, check this ordered list**” in prose (LR too high, warmup too short, clip threshold, data bugs, sharding desync) ties math to the lab.
- One explicit sentence: **optimizer state memory** (Adam) is why *training* a 7B and *serving* a 7B are different cost structures—forward pointer to Week 6.
