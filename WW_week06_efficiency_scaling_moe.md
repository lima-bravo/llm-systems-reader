# Why & what: Week 6 — Efficiency, scaling, mixture of experts

**Maps to:** `weeks/week06_efficiency_scaling_moe.tex`

## Gap

Parallelism, ZeRO, and MoE are easy to list as *techniques*. The *why* is **binding resource identification**: for many jobs, the limit is not “FLOPs on paper” but **memory**, **all-to-all**, or **tail latency**—*different* design problems.

## What this chapter is for

- **What:** A vocabulary to split an LLM workload into **compute**, **memory**, and **bandwidth**; a map of **parallelism styles**; the **MoE** idea: many parameters, few active per token.
- **Why:** So teams do not “use MoE because scale” but because **a concrete bottleneck** (throughput, capacity per dollar) matches MoE’s tradeoffs.

## Suggested “three axes” opening (reinforce the existing table in prose)

> When someone says “it doesn’t fit on a GPU,” they might mean any of **three** different impossibilities: **not enough FLOPs/sec**, **not enough HBM to store weights+states+activations**, or **not enough internal/off-node bandwidth to feed the chips**. A fix that helps one axis can **hurt** another (e.g. larger batch improves utilization but can hurt latency). This chapter is about *naming* the binding axis before buying hardware or choosing MoE.

## Why / what anchors

| Topic | **What** | **Why** |
|--------|----------|---------|
| Data / tensor / pipeline / expert parallelism | Split batch, split matrices, split layers, split experts. | **What** you scale: *samples, math on each layer, time across stages, or conditional paths*. **Why** no single “best” parallel plan—cluster geometry decides. |
| ZeRO / FSDP | Shard optimizer state, gradients, parameters across ranks. | **What** you buy: run **bigger** models on **more** but **smaller** units; **cost** is **communication** and code complexity. |
| Activation checkpointing | Recompute activations in backward to save memory. | **Trades** compute for **memory**; standard at scale. |
| MoE routing | A gate picks top-k experts per token. | **What** is weird: *different* tokens in a batch can hit *different* experts—**unbalanced** routing causes **saturated** experts and **idle** others. |
| Load-balancing loss | Penalize skew in assignment counts. | **Why** needed: the router is **gameable** without it; *training stability* and **utilization** depend on it. |
| All-to-all in expert parallel | Send tokens to GPUs holding experts. | **Why** MoE is a **network** problem, not a matmul handwave. |
| “MoE buys FLOPs, not always memory” | All experts **exist** in memory. | The common **misconception** to **kill** in plain language. |

## Suggested one-paragraph “MoE in English”

> A dense model uses **every** weight for **every** token. MoE stores **more** total weights, but a **gating** function picks a **small** subset to apply to each token. You get the **expressivity** of a very large model with the **FLOPs** of a much smaller *active* one—**but** you still pay the **footprint** of the **full** expert pool and you pay the **communication** to route tokens. If your problem is **latency under fixed memory**, MoE is not a free lunch.

## Undergrad “minimum” story

- **Parallelism** = split work so many machines cooperate.
- **ZeRO** = don’t each keep a full copy of everything; **pass pieces** as needed.
- **MoE** = **many** specialists, **select** a few per case—like a hospital triage, **but** the triage is learned and can be wrong in interesting ways (bad routing, expert collapse).

## Phrasing to foreshadow Week 7/11

> Efficiency chapters determine **what you can run**; they do not determine **what you should *say* to users**—that is product, alignment, and **API policy**.

## Revision suggestions

- A **one-page “when MoE is a bad fit”** list: tiny batches (routing overhead dominates), very tight HBM, jobs needing strong structure across all subspaces (not always, but a **sanity** check).
- Explicit **tail latency** paragraph: *MoE = more variance in per-token work*; **P99** is part of the spec.
