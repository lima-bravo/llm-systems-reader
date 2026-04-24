# Why & what: Week 8 — Alignment, instruction tuning, preference optimization

**Maps to:** `weeks/week08_alignment_preference_optimization.tex`

## Gap

RLHF, DPO, and variants are *methods*. The *why* is **normative**: alignment **does not** mostly add facts; it **reweights** behaviors **already reachable** in pretraining. The chapter’s introduction states this; a reader-focused recap prevents “we aligned it, so it’s true.”

## What this chapter is for

- **What:** A pipeline—**SFT** (imitate demonstrations), then **preferences** (compare outputs), then **optimization** of policy toward reward or preference loss—with explicit **failure modes** (reward hacking, sycophancy, over-refusal).
- **Why:** So PMs and engineers **do not ascribe to alignment what only pretraining+RAG+tools can do**, and so **value choices** in data are not laundered as “safety as math.”

## Suggested “capability vs alignment” box (tightened prose)

> **Capability** answers “what patterns from pretraining are available?” **Alignment** answers “**which** of those patterns are selected when the prompt allows several?” A helpful chat persona is *mostly* a **reordering** of mass—**not a database of new medical facts**. If a fact is absent from the base model’s *usable* support, *post-training won’t inject it* reliably.

## Why / what anchors

| Stage | **What** | **Why** |
|-------|----------|---------|
| SFT | Supervised imitation of (instruction, response) pairs. | **Teaches the format and *some* target behavior, by example*. |
| Reward model (Bradley–Terry, etc.) | Scores *which* answer is better *for human raters* on a distribution of prompts. | **Encodes a utility function**; **it is not universal**—it’s a **lens**. |
| RLHF (PPO + KL) | Maximize reward while **staying near** a reference to avoid *collapse* to exploit-y strings. | **What** the KL does in plain terms: *don’t move so far that the model becomes weirdly optimized to the reward net*. |
| DPO / direct prefs | Update policy from pairwise prefs **without** an explicit online RL loop (as classically). | **Why** teams like it: **simpler** and **stabler** in many setups; **not** a guarantee of *better values*, just *different* optimization plumbing. |
| RLAIF / Constitution | Use AI to supply supervision | **Scales** collection; **replicates** the *values* of the annotator or constitution author—**audit that**. |

## Failure-mode sentences (plain, cold)

- **Reward hacking:** The model finds **bizarre** outputs that *fool* the reward model. **What** to do: **diversify** training evals, **adversarial** data, *human* review on slices.
- **Sycophancy:** Agreeing with a mistaken user to gain approval. **Why:** preference data *often* rewards “being liked.”
- **Over-refusal:** Block safe asks. **Why:** **harmlessness** over-weighted in the mixture; **tension** with helpfulness.
- **Alignment tax:** Slight capability drop in some *measurements* on some tasks after *RL*. **Not** a moral fact—**an empirical** trade.

## Suggested one-paragraph *non-math* reader outcome

> After this chapter, a reader can explain **in a meeting** why “**we need more RLHF**” is not a substitute for “**our facts are out of date**” or “**our policy must refuse X**” when those are *retrieval* or *rules-engine* problems, not *preference* ones.

## Undergrad “minimum” story

- **Base** = talented mimic of the internet.  
- **SFT** = mimic of **good assistant examples**.  
- **Preferences** = “when unsure between two imitations, **choose** the one raters like.”  
- **Math** = how to **bake in** that *choose the liked one* objective **stably**.

## Revision suggestions

- A **rubric** example: 4 dimensions (helpful, harmless, honest, style) and **how** a single scalar reward **hides** tradeoffs (Goodhart in narrative form).
- **One line** on **jailbreaks**: *alignment** shifts the **modal** behavior, not the **all-token** support—**safety** still needs **defense in depth** (see Week 9/10).
