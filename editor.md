# Editor's Command File — *Large Language Models as Engineered Systems*

*Maintained by: editorial review sessions. This file is the live command document. All prior findings in `editorial_reader.md` and `editorial_refresh.md` are superseded by this file when they conflict.*

---

## Current status: STRONG DRAFT — blocking structural issues resolved; agentic AI, verification, private corpus, and refresher alignment gaps filled

The manuscript has genuine distinction. The voice is right, the intellectual spine is right, the systems framing is right. The §A blocking issues have been resolved (2026-05-09). Six agentic AI coverage gaps in ch12 addressed (2026-05-09). Verification cost erosion added across ch10, ch12, ch13 (2026-05-09). Private corpus / vocabulary gap treatment added across ch04, ch08, ch10 (2026-05-09). Five math refresher alignment gaps fixed (2026-05-09): positional encodings (ch05), constrained optimisation/partition functions (ch02), SVD/Eckart-Young (ch08), Unigram-LM EM (ch04), BM25/RRF formulas (ch10). §B items remain required for a commercial edition. §C items are optional enhancements.

**Verdict:** §A is complete. Agentic AI, verification cost, private corpus, and refresher alignment coverage are now substantive. Address §B items before any external review or classroom pilot.

---

## §A — BLOCKING ISSUES ✓ RESOLVED 2026-05-09

### A1. ✓ Chapter count inconsistency — FIXED

Three places in the manuscript state **"eleven chapters"**:
- `main.tex` preface (~line 96): *"The book is organised into eleven chapters"*
- `weeks/week12_human_centric_error_model.tex` line 8: *"The eleven chapters of this book…"*
- `VOICE.md`: *"consistency of tone across eleven chapters"*

The actual `\input` count in `main.tex` is **twelve** week files (`week01`–`week12`). The number mismatch is visible on page 1 of the published PDF. Fix before anything else.

**Action:** Global replace to "twelve" in all three locations. Then align `VOICE.md`.

---

### A2. ✓ Neural networks chapter: integrated as Chapter 3 — FIXED

`weeks/ch03_neural_networks.tex` is a **1,706-line draft** that is explicitly excluded from `main.tex`. Its header says future integration will renumber chapters 3–12 as 4–13. This single unresolved decision creates **two cascading problems**:

**Problem 1 — Pedagogical gap in the main reader.** The reader currently jumps from optimization/generalization (Week 2) directly to tokenization and embeddings (Week 3). Students without deep learning background have no chapter covering MLP forward pass, backpropagation, depth, or activation functions. Weeks 4–8 (Transformer, Pretraining, LoRA, Alignment) assume this knowledge. The gap is manageable for students with prior deep learning exposure; it is a real obstacle for the stated audience of "undergraduate with quantitative background but no prior deep learning."

**Problem 2 — Math refresher chapter numbering is broken vs shipped reader.** This is a student-facing operational bug (see A3 below).

**Decision required (pick one):**
| Path | What it means |
|------|---------------|
| **Integrate:** Merge `ch03_neural_networks.tex` into `main.tex` as Week 3; renumber weeks 3–12 as 4–13; renumber math refresher accordingly. | Closes the pedagogical gap; makes numbering honest. Adds scope. |
| **Defer explicitly:** Remove the draft from the default build; add a note in the preface acknowledging the gap and pointing students without DL background to a named external reference (e.g. Nielsen's *Neural Networks and Deep Learning*, free online). Renumber math refresher to match current 12-week spine. | Faster path to a clean v1.0; gap is disclosed. |

Neither path is wrong. The status quo — draft present in repo, excluded from build, companion written as if it's Chapter 3 — is the one path that must not continue.

---

### A3. ✓ Math refresher chapter numbers now match reader — FIXED

The refresher has **13 chapters** keyed as "Chapter N Refresher." The reader has **12 weeks**. The offset arises because math_chapter03 ("Neural Networks") corresponds to the unintegrated draft.

**Current broken mapping (if NN chapter is NOT integrated):**

| Reader Week | Topic | Refresher student reaches | Refresher actual topic |
|-------------|-------|--------------------------|------------------------|
| Week 3 | Tokenization | Chapter 3 | **Neural Networks** ← WRONG |
| Week 4 | Transformer | Chapter 4 | Tokenization ← off by 1 |
| Week 8 | Alignment | Chapter 8 | Adaptation/LoRA ← off by 1 |
| Week 9 | RAG/Systems | Chapter 9 | Alignment ← off by 1 |

A student who opens "Chapter 9 Refresher" while reading Week 9 (RAG) will study alignment math. This undermines the companion's core lookup contract.

**Fix (tied to A2 decision):**
- If integrating NN chapter: refresher numbering becomes honest as-is.
- If deferring NN chapter: rename math_chapter04→math_chapter03, math_chapter05→math_chapter04, etc. (shift left by 1 for chapters 4–13). Rename section titles to "Week N Refresher" matching the reader filenames.

Add a **cross-reference table** at the front of `math_refresh.tex`: two columns, Reader Week and Refresher Chapter. One table, one page. Eliminates the confusion permanently regardless of which path is taken.

---

### A4. ✓ "Chapter" terminology — unified throughout — FIXED

Reader files are named `weekNN`; prose inside the files sometimes says "Chapter~1" (e.g. `week03` references "Chapter~1"). Student-facing documents should pick one canonical term and apply it everywhere. Recommend **"Chapter"** since the refresher already uses it and it is more conventional in a print textbook context. If keeping "Week," the refresher section headers must be updated to match.

**Action:** Grep for "Chapter~" and "Week~" cross-references in all `weeks/*.tex` files; normalize to one term.

---

### A8. ✓ Private corpus / vocabulary gap — ADDED 2026-05-09

The "missing information problem" — deploying an LLM on a private corpus (internal communications, proprietary research, enterprise documentation) that it has never seen during training — was covered by only 8 lines in ch08. Added in three coordinated locations:

| Location | Content |
|----------|---------|
| **ch10** new `\subsection{Private Corpus Deployment: The Vocabulary Gap}` (`\label{sec:private-corpus-vocab-gap}`) — inserted after RAG failure modes, before Tool Use | Four failure layers: (1) tokenization fragmentation with BioBERT/LegalBERT motivation; (2) embedding retrieval gap — two failure shapes (same-term verbatim and synonym gap); (3) semantic collision / false-familiar problem; (4) confident confabulation of private entities. Mitigation stack in cost order: vocabulary overlap audit → glossary injection → hybrid retrieval with RRF formula (Eq. `ch10-rrf`) → domain embedding fine-tuning → vocabulary expansion + continued pretraining |
| **ch08** new `\paragraph{Adaptation for private corpora.}` (`\label{sec:ch8_private_vocab}`) — inserted after continued pretraining paragraph | Vocabulary expansion mechanics (mean sub-token init, unfreeze embedding matrix only); domain bi-encoder fine-tuning (synthetic query generation + spot-check); data quality notes for noisy private corpora; privacy implication (fine-tuned adapter = data access control) |
| **ch04** extended `\section{Human Factors and Failure Modes}` (`\label{sec:ch4_oov}`) + Bridges section | New bullet: private corpus fragmentation; `\Emp` block with 15%-of-word-types-at-3+-subtokens deployment gate; forward references to ch08 and ch10. Bridges to ch08/ch10 extended with private vocab cross-references |

`references.bib` updated with `biobertlee2020` (Lee et al. 2020) and `legalbert2020` (Chalkidis et al. 2020).

`WORK_IN_PROGRESS.md` created during drafting (now deleted after commit).

---

### A7. ✓ Verification cost erosion — ADDED 2026-05-09

The failure mode where verification overhead erodes or eliminates the economic benefit of LLM deployment was absent from all chapters. Added in three coordinated locations:

| Location | Content |
|----------|---------|
| **ch10** `\subsection{Verification Cost Erosion}` (after LLM-as-judge) | Break-even arithmetic with formal derivation (Eq. `ch10-breakeven`, `ch10-breakeven-threshold`); worked example showing sensitivity of break-even error rate to verification ratio $v$; calibration routing problem (cannot selectively verify without an external classifier); LLM-as-judge cost circuit (correlated failures, per-call floor cost) |
| **ch13** `\section{What the Model Does Not Capture}` | Automation complacency as the fourth case beyond the five-axis model; Parasuraman & Manzey (2010) citation; three amplifying patterns (low base-rate, plausibility of grounding failures, throughput pressure); engineering consequences (calibration cases, review accuracy metrics); cross-reference to ch10 break-even |
| **ch12** deployment failure modes intro | Forward pointer naming verification cost erosion as a sixth failure mode, with cross-references to ch10 §verification-cost-erosion and ch13 |

`references.bib` updated with `parasuraman2010complacency`.

---

### A6. ✓ Chapter 12 agentic AI coverage gaps — FILLED 2026-05-09

A review of `ch12_access_apis_agents_mcp.tex` identified six gaps relative to a practitioner-ready treatment of agentic AI. All six have been addressed:

| Gap | Status | Location in ch12 |
|-----|--------|-----------------|
| Reward hacking in agent loops (bridge from ch09) | ✓ Added | Deployment Failure Modes — 7th mode |
| Cascading / unrecoverable state | ✓ Added | Deployment Failure Modes — 6th mode |
| Multi-agent coordination failure modes | ✓ Added | New `\subsection{Multi-Agent Failure Modes}` after Agent Frameworks |
| Planning under uncertainty / partial observability | ✓ Added | New `\subsection{Planning under Uncertainty}` after Termination |
| Agent evaluation methodology | ✓ Added | New `\subsection{Agent Evaluation Methodology}` in eval/observability section |
| Unified human-in-the-loop / escalation controls | ✓ Added | New `\section{Human-in-the-Loop Controls}` before Honest Limits |

**Content notes:**
- Reward hacking bridges explicitly to §\ref{sec:ch09_reward_hacking}; deployment-time vs training-time distinction is drawn clearly.
- Cascading state includes a reversibility hierarchy and idempotency requirement for agent tools.
- Multi-agent section covers trust propagation, cascading hallucination, coordination overhead, and deadlock/livelock.
- Partial observability section names the POMDP framing as a bridge for readers who encounter decision-theory literature.
- Evaluation section covers SWE-bench and TAU-bench with an empirical caveat on distribution shift.
- HITL section introduces blast-radius/reversibility taxonomy, escalation policy arms (proceed/confirm/clarify/abort), and an engineering-consequence block for production implementation.

---

### A9. ✓ Math refresher alignment with reader — FIXED 2026-05-09

A cross-document audit identified five locations where the reader uses mathematical tools or formulas not covered in the companion refresher. All five fixed:

| Fix | Refresher chapter | Content added |
|-----|------------------|---------------|
| **Fix 1** | math_chapter05 | Positional encodings: sinusoidal absolute PE (formula), ALiBi (linear bias formula), RoPE (rotation matrix + relative-position identity); glossary entries; worked RoPE mini example ($d_k=2$, $m=1$, $n=3$, $\theta=\pi/6$); intuition checkpoints |
| **Fix 2** | math_chapter02 | Constrained optimisation: Lagrange multiplier setup ($\nabla f = \lambda\nabla g$), Lagrangian definition, Chinchilla compute-optimal allocation ($N^\star\propto C^{1/2}$); partition function / normalising constant; DPO $Z(x)$ cancellation in ratio $\pi^\star(y^+)/\pi^\star(y^-)$; glossary entries |
| **Fix 3** | math_chapter08 | SVD: $M=U\Sigma V^\top$ decomposition, Eckart--Young theorem ($M_r$ is optimal rank-$r$ approx, error $=\sqrt{\sum_{i>r}\sigma_i^2}$), singular spectrum diagnosis for LoRA rank budget; glossary entries; worked mini example ($3\times2$ matrix, rank-1 approx, 90\% energy captured) |
| **Fix 4** | math_chapter04 | Unigram-LM EM: probabilistic segmentation setup ($p(\mathbf{x})=\prod p(t_i)$), E-step (Viterbi), M-step (frequency normalisation), pruning; connection to SentencePiece / LLaMA tokenizers; why private-corpus token extension requires EM restart; glossary; worked mini example (\texttt{low} with 4-segmentation vocabulary) |
| **Fix 5** | math_chapter10 | BM25: full formula with IDF, TF saturation, length normalisation ($k_1$, $b$); RRF: $1/(k+r_\mathrm{bm25})+1/(k+r_\mathrm{dense})$ with $k=60$ rationale; hybrid retrieval motivation; glossary; worked BM25 single-term calculation; worked 3-chunk RRF fusion example |

`math_chapter02.tex`, `math_chapter04.tex`, `math_chapter05.tex`, `math_chapter08.tex`, `math_chapter10.tex` all updated.

---

### A5. LaTeX document class — production risk (still pending)

`\documentclass{article}` works for a draft but produces a PDF without chapters, odd/even page handling, or standard front-matter conventions expected by publishers. Before any external submission:

- Switch to `\documentclass[11pt,a4paper]{book}` or `{report}`.
- Update section hierarchy: current `\section` → `\chapter`, `\subsection` → `\section`, etc.
- Verify `preamble.tex` custom environments still render correctly after the hierarchy shift.
- Ensure math refresher standalone compile is not broken by shared macro changes.

---

## §B — REQUIRED FOR COMMERCIAL EDITION

### B1. Assessment materials: none currently present

Publisher adoption decisions for undergraduate texts depend heavily on instructor resources. There are no exercises, problem sets, labs, or rubrics visible in the current manuscript structure (the `labs/` directory exists but was not populated in this review).

**Minimum requirement for a course-adoptable edition:**
- 2–3 exercises per chapter learning objective
- At least one "systems trace" exercise per chapter (trace a real failure mode through the technical mechanism)
- Instructor manual with solutions
- One lab per conceptual cluster (statistical foundations, transformer mechanics, alignment, deployment)

**Action:** Commission exercises separately from prose drafting. The voice guide in `VOICE.md` does not extend to exercises — a separate exercise style guide should be written.

### B2. Two reading tracks: missing

The preface claims undergraduate quantitative background is sufficient, but Week 1 alone is long and technically dense (calibration machinery, multiple views on cross-entropy, assumption ledger). Some chapters assume familiarity that a typical third-year student may not have refreshed recently.

**Action:** Add an explicit "minimal path" notation to the front matter. Suggest: concept summary + figures + failure-mode section = minimum; full derivation sections = optional depth track. Mark each section in the chapter template with a small icon or label indicating which track it belongs to.

### B3. Staleness policy for product/API references

Weeks 11 (MCP, APIs) and parts of weeks 9–10 cite specific vendor capabilities, API versions, and calendar periods. These will age.

**Action:** Wrap time-sensitive claims in a **"As of [YYYY-QN]"** dated sidebar convention. Keep core math and system architecture claims in permanent text. Draft a policy for the preface: "Claims about specific products are dated; architectural and mathematical claims aim for permanence."

### B4. Legal and regulatory review

Week 10's synthesis of EU AI Act timing, NIST AI RMF, and ISO 42001 is pedagogically strong but requires a legal/regulatory review for the target markets before commercial publication. Standard textbook disclaimer is necessary but not sufficient.

### B5. Shared macro file

`math_refresh.tex` uses its own minimal preamble, not `\input{preamble}`. This creates risk of notation drift (e.g. `\KL`, `\E`, entropy notation) between the two documents.

**Action:** Extract shared math macros into `math_macros.tex`; `\input` it from both preambles. Ensures `$\mathrm{D_{KL}}$` renders identically in both PDFs.

---

## §C — ENHANCEMENTS (post-v1.0)

### C1. Chapter count in VOICE.md

Once A1 is resolved, update the count in VOICE.md from "eleven" to the final canonical number.

### C2. Figure inventory

The `figures/` directory exists. A pass to ensure every chapter has at least one figure (especially Week 4, transformer architecture) would help the visual learner segment of the audience.

### C3. Build reproducibility

Add a `Makefile` or `latexmk` config and document a Docker/Nix build environment. CI that produces both PDFs on every commit reduces "works on my machine" incidents.

### C4. Bibliography granularity

`references.bib` is large and well-structured. A pass to add granular in-text citations for normative claims (especially in governance chapter) would reduce reviewer pushback in academic channels.

---

## What is genuinely strong — do not touch

1. **Prose quality of the "Setting the Scene" sections.** Week 1, Week 4 (Transformer history), and Week 12 (human-centric model opening) are excellent. The Sagan-register voice is calibrated correctly — modest, precise, historically honest. These sections should be preserved verbatim through any revision.

2. **The cross-entropy/MLE → hallucination spine.** Running from the preface through Week 1 and reused in failure-mode discussions downstream. This is the correct intellectual backbone for a systems audience. Do not dilute it in response to any "make it simpler" pressure.

3. **Failure modes built into every chapter.** Rare in LLM education material. This is the differentiator for safety-minded and governance audiences.

4. **Week 12 (human-centric five-axis model).** The best chapter in the reader. Bridges engineering vocabulary to stakeholder diagnosis. Should be featured in all marketing and adoption materials.

5. **Week 10 (governance/assurance).** Stronger than comparable survey material. The safety-engineering lineage framing is appropriate and defensible.

6. **Math refresher Strang-style cadence.** Problem → insight → lineage → mental model in every item is exactly right for a lookup companion. Do not expand it into a second textbook.

7. **Epistemic labeling in preamble.tex.** The `\Def`, `\Emp`, `\Cons`, `\Heur` etc. environments are distinctive and well-suited to assurance-minded readers. Keep them.

8. **Preface acknowledgment of LLM-assisted drafting.** Retain in any commercial edition unchanged in substance.

---

## Open questions requiring author decision

| Question | Options | Status |
|----------|---------|--------|
| ~~Integrate NN chapter or defer?~~ | ~~See A2 above~~ | ✓ Integrated 2026-05-09 |
| ~~"Chapter" or "Week" as canonical term?~~ | ~~See A4 above~~ | ✓ "Chapter" adopted 2026-05-09 |
| Target document class for publisher? | `book` vs `report` | Pending — before publisher submission |
| Exercise authoring: author writes or commissioned? | — | Pending — before B1 |

---

*Last updated: 2026-05-09 (refresher alignment pass). Review basis: `main.tex`, all `weeks/*.tex`, `math_refresher/math_refresh.tex`, `math_preface_probability.tex`, `math_chapter01.tex`–`math_chapter13.tex`, `preamble.tex`, `VOICE.md`, `editorial_reader.md`, `editorial_refresh.md`. Chapter title mapping verified by grep on section headers. Agentic AI gap analysis: full read of `ch12_access_apis_agents_mcp.tex` (1,509 lines pre-edit), cross-check against ch09/ch10/ch11/ch13 for agent-relevant content. Refresher alignment: cross-document audit of all 13 reader chapters against 13 refresher chapters; five gaps identified and filled (positional encodings, constrained optimisation/partition functions, SVD/Eckart-Young, Unigram-LM EM, BM25/RRF).*
