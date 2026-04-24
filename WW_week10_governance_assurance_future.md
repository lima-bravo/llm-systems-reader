# Why & what: Week 10 — Governance, assurance, future

**Maps to:** `weeks/week10_governance_assurance_future.tex`

## Gap

Assurance cases, risk matrices, and regulations can read as *compliance theater* unless tied to a **concrete** question: **when this system misfires, who is answerable, what evidence justifies *continued* operation, and which controls *independently* cut risk?** The *why* is **legitimacy and auditability of deployed statistical systems**, not checkbox completion.

## What this chapter is for

- **What:** A vocabulary for **hazards**, **controls**, **assurance** arguments (claims supported by **evidence** and **assumptions**), and a map of **major regulatory** frames.
- **Why:** So engineering choices (Weeks 1–9) are **traceable** to **accountable** decisions: *what* was tested, *what* was *not* covered, and *what* must *fail closed*.

## Suggested “from model to accountability” paragraph (tighten)

> Technical performance is a **necessary** input to deployment; it is not **sufficient** for *permission to operate* in most regulated or high-stakes settings. This chapter is about the **artefacts** and **arguing structure** that let an *external* reviewer (regulator, customer security team, board) see **a line of sight** from your claims (“the bot won’t do X in situation Y”) to **evidence** (evals, monitoring, **human** review) and **acknowledged** gaps.

## Why / what anchors

| Construct | **What** (plain) | **Why** |
|------------|------------------|---------|
| Socio-technical system | **Model + people + org + law + environment** | Isolating “the network” is **analytic**; **hazards** live at **interfaces** (user ↔ UI ↔ model ↔ tool ↔ data). |
| Assurance case (GSN) | **Top goal** decomposed to **strategies** and **evidence** | **Makes the argument** explicit: *what* must be true, *what* is **assumed**, *how* you **know** sub-goals hold. **Not** a substitute for *good* data—*discipline* for the argument. |
| Hazard register | **Named bad events** with severity/likelihood | **Why** ordinal scales: **comparability** across groups; **beware** treating them as **real** probabilities *without* calibration. |
| Defence in depth | **Multiple** weakly correlated controls | **What** the AI analogue of safety engineering is: *no* single “alignment” or “filter” is **credible** alone. |
| Model card / datasheet | **Documented** capacity, *limits*, *data*, *metrics* | **What** the market and civil society **asked** for: **transparency** of *provenance* and *measured* behavior—not marketing. |
| Regulation (EU AI Act, NIST RMF, ISO 42001) | **Obligation patterns** and **roles** (provider/deployer) | **Why** teams read this: *contracts* and *penalties* **attach**; not a substitute for *technical* depth, but it **constrains** what “done” can mean. |

## Undergrad “minimum” story

- **Assurance** = a **mathematical proof**-shaped *thing*, but for **an empirical system**: *claims* backed by *tests* and *explicit assumptions*—**honesty** about *unknowns*.
- **Governance** = *who* can **ship**, **block**, and **shut off**; **not** a slide deck, **a** **process** with *teeth*.

## Suggested wording to demystify the assurance case (no jargon)

> Think: **We say the service won’t recommend illegal acts under conditions Z. Sub-claim: the policy blocks category A. Evidence: test suite T with results... Assumption: traffic looks like Z.** If the assumption fails, the **top** claim is **suspended**—**that** is the **intended** use of **assumptions** in the notation.

## “Future” section—human what/why without hype

- **What** to communicate: scaling continues to change economics; not every open problem in truthfulness is solved by a bigger model.  
- **Why** the chapter ends here: unknowns are where governance must stay humble, and funding for eval plus red-team is rational insurance.

## Revision suggestions

- A one-page “minimum viable model card” in plain English: who, data, tests, known failures—parallel to the formal GSN, not a replacement.  
- Connect incident reporting to post-market monitoring in one sentence so the reader grasps the loop.

## Phrase to keep risk matrices honest

> A 4×4 color chart does not make rare catastrophic events go away; it ranks them for action. The treatment is controls and evidence, not green cells.
