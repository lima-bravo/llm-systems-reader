# Why & what: Week 9 — LLM systems: RAG, tools, evaluation

**Maps to:** `weeks/week09_llm_systems_rag_tools_evaluation.tex`

## Gap

The chapter already has a clear “model is a subsystem” introduction. The **reinforcement** to add: **for many products, the system *is* the product**; the model is one plugin. *Why* RAG and tools *exist* is **to externalize** what language models *should not* internalize: **fresh facts**, **exact math**, and **verifiable action**.

## What this chapter is for

- **What:** **RAG** = retrieve, pack context, then generate; **tools** = structured IO to code or APIs; **eval** = the measurement harness that **detects** failures when the stack changes.
- **Why:** So teams **do not** attribute database freshness or calculator accuracy to the **7B** vs **70B** decision.

## Suggested “system boundary” blurb (telegraphic)

> The user’s question hits **(a)** retrieval **(b)** policy layer **(c)** the model **(d)** the tool executors—**then** the answer returns. A regression in (a) or (d) **looks** like the model “got dumber.” **What** the chapter adds to Week 1–4 knowledge is: **a fault taxonomy that tracks components**, not *parameters*.

## Why / what anchors

| Topic | **What** | **Why** |
|--------|----------|---------|
| RAG | $q \to$ top-k chunks $\to$ prompt augmentation $\to$ answer. | **What** is outsourced: *storage and lookup*; **not** a guarantee the model *uses* chunks faithfully—**hence** faithfulness metrics. |
| Chunking, embeddings | **Break** docs into indivisible *units of retrieval*. | **What** is subtle: *too long* = noise; *too short* = missing context. **A design choice, not a constant.* |
| Hybrid retrieval | Mix lexical (BM25) and dense. | **Why** different failure modes: **exact strings** vs **paraphrase**. |
| Tool calling | Model emits a **JSON**-ish request; host executes; optional second turn. | **What** is gained: *correct arithmetic, live DB, side effects* with **governance** at the **host** boundary. |
| ReAct / loops | Observability-friendly pattern; **narrated** as reasoning, **mechanically** I/O. | **Why** caution: **logs are not** guaranteed faithful **rationales**. |
| Eval harnesses | Datasets, metrics, LLM-judge, **A/B**. | **What** the org learns is **trending quality**, not a **single** “accuracy.” **Prompts** are part of the **versioned** system. |

## “RAG in one breath” (for non-ML stakeholders)

> **Store** documents, **turn the question** into a search, **pull** a few *likely* paragraphs, **paste** them above the user question, **ask** the model to *ground* its answer. If the search pulls garbage, the model is **unfixably** under-informed—**tune retrieval first**.

## Suggested “failure mode → owner” table (for prose)

- **Answer not supported by context** → model + *prompt* + **no constraining** loss for cite-every-claim.  
- **Right doc not retrieved** → **retriever/embedding** problem.  
- **Stale doc in index** → **data/ops** problem.  
- **Tool not invoked when needed** → **schema/prompting** and **planner** problem.

## Undergrad “minimum” story

- **Model alone** = smart parrot with **fading snapshot** of the world.  
- **+ RAG** = parrot with **open book**; still need **what page to read**.  
- **+ tools** = parrot with **a phone**; **host** must **dial and verify**.

## Revision suggestions

- A **3-bullet** “**if you only do one RAG fix**” ordered list: *chunking/re-rank/query rewrite*—*because* the chapter lists many; human readers need **defaults**.
- **One explicit** “**prompts are code**” sentence with **version hash** in CI—ties to Week 11 APIs.

## Phrase to prevent eval cargo-culting

> A number going **up** on a *leaderboard* that **doesn’t** mirror your *traffic* is a **hazard**; the harness must **sample the real** distribution of queries—**including** the weird ones.
