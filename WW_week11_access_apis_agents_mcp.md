# Why & what: Week 11 — APIs, agents, MCP

**Maps to:** `weeks/week11_access_apis_agents_mcp.tex`

## Gap

Chat-completions schemas, streaming, tools, agents, and MCP are **interface** and **protocol** material. The *human* layer: **users never touch weights**; they touch **contracts** (JSON), **rate limits**, **retries**, and **orchestration**. *What* fails is often **not** “the matrix multiply” but **timeouts, schema drift, and tool injection**.

## What this chapter is for

- **What:** The **access stack** from **runtime** to **HTTP** to **SDK** to **agent loop**; **MCP** as a **standard socket** for tools/resources.
- **Why:** So **application** engineers **reason about reliability and security** at the **same** table as **model** engineers—because **the product** is **the stack**.

## Suggested “from weights to applications” anchor

> Training ends with **files**; products begin with **requests**. Every serious integration is: **serialize the chat state**, **choose sampling knobs**, **maybe** let the model emit a **tool call**, **execute** that call in a **sandbox** with **policy**, **feed** results back, **repeat** until **stop**. The **math** of the transformer is **step 3 of 8** in that list.

## Why / what anchors

| Layer | **What** (plain) | **Why** |
|--------|------------------|---------|
| Chat schema | Messages with **roles**, **tool** blocks, **multi-turn** state | **What** the model **sees** is **constructed** by your **app**—**not** “the user’s raw string” only. |
| Sampling params | temperature, top-p, max tokens, penalties | **Same** weights, **different** product behavior; **must** be **versioned** with evals. |
| Streaming | Token-by-token responses | **UX** and **time-to-first-token**; **also** **complicates** **logging** and **mid-stream** **errors**. |
| Tool / function calling | Model returns **structured** action requests | **Bridge** between **language** and **side effects**—**host** is **responsible** for **auth** and **limits**. |
| Agent frameworks | Graphs of **plan/execute/critique** | **Engineering** patterns; **not** **AGI**—**state machines** with **LLM** **nodes**. |
| MCP | **JSON-RPC** **tool/resource** **surface** **shared** across hosts | **Why** it exists: **stop** $M$ **models** × $N$ **tools** **ad-hoc** integr**ation**; **one** **wire** **story**. |
| Observability | Traces, spans, **cost** per call | **What** **SRE** needs: **not** **loss curves** but **p95** **latency** and **$ per task**. |

## “Agent in one sentence” (no mystique)

> An **agent** is **a control loop** where the **LLM** **proposes** **actions** in a **finite** **interface** and **code** **decides** **whether** **to** **run** them, **with** **what** **privileges**, and **when** **to** **stop**.

## Undergrad “minimum” story

- **API** = **order food** at a **restaurant** (menu is the **schema**); you don’t go to the kitchen (weights on raw GPU) unless you **self-host**.
- **Tool** = **waiter** brings a **special** item from **another** **room**—**you** **still** **pay** **if** **they** **drop** **it**.
- **MCP** = **standard** **electrical** **outlet** **shape** so **any** **lamp** **fits**—**reduces** **spaghetti** **adapters**.

## Security *without* equations (must be explicit in human layer)

- **Tool output** is **untrusted** if it comes from **external** **systems**—**treat** as **user** **input** **to** **the** **next** **turn** for **injection** **analysis**.
- **Rate limits** are **not** **meanness**; they **bound** **blast** **radius** of **runaway** **loops**.

## Revision suggestions

- A **single** **walkthrough** figure **caption** in **words**: **user** message → **router** → **model** → **optional** **tool** → **model** → **user**; **mark** **where** **PII** **can** **leak**.
- **Cross-link** **OpenTelemetry** **to** **Week** **9** **eval** **regressions**: **same** **build** **ID** **for** **prompt+model+tool** **stack**.

## Phrase to deflate “API will fix alignment”

> **No** **HTTP** **status** **code** **exists** for “**model** **values** **are** **wrong** **for** **our** **brand**.” **That** **is** **policy**, **eval**, and **governance**—**Weeks** **8–10**, **not** **OpenAPI** **alone**.
