# Editor's Command File — *Large Language Models as Engineered Systems*

*Maintained by: editorial review sessions. This file is the live command document. All prior findings in `editorial_reader.md` and `editorial_refresh.md` are superseded by this file when they conflict.*

---

## Current status: STRONG DRAFT — not yet publication-ready

The manuscript has genuine distinction. The voice is right, the intellectual spine is right, the systems framing is right. The blocking issues are structural and fixable, not conceptual.

**Verdict:** Resolve the five items in §A before any external review or classroom pilot. §B items are required for a commercial edition. §C items are optional enhancements.

---

## §A — BLOCKING ISSUES (fix before any external review or classroom use)

### A1. Chapter count inconsistency — HIGH RISK

Three places in the manuscript state **"eleven chapters"**:
- `main.tex` preface (~line 96): *"The book is organised into eleven chapters"*
- `weeks/week12_human_centric_error_model.tex` line 8: *"The eleven chapters of this book…"*
- `VOICE.md`: *"consistency of tone across eleven chapters"*

The actual `\input` count in `main.tex` is **twelve** week files (`week01`–`week12`). The number mismatch is visible on page 1 of the published PDF. Fix before anything else.

**Action:** Global replace to "twelve" in all three locations. Then align `VOICE.md`.

---

### A2. Neural networks chapter: integration decision required — HIGHEST PRIORITY

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

### A3. Math refresher chapter numbers do not match reader week numbers — STUDENT-FACING BUG

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

### A4. "Chapter" vs "Week" terminology — inconsistency throughout

Reader files are named `weekNN`; prose inside the files sometimes says "Chapter~1" (e.g. `week03` references "Chapter~1"). Student-facing documents should pick one canonical term and apply it everywhere. Recommend **"Chapter"** since the refresher already uses it and it is more conventional in a print textbook context. If keeping "Week," the refresher section headers must be updated to match.

**Action:** Grep for "Chapter~" and "Week~" cross-references in all `weeks/*.tex` files; normalize to one term.

---

### A5. LaTeX document class — production risk

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

| Question | Options | Deadline |
|----------|---------|----------|
| Integrate NN chapter or defer? | See A2 above | Before any classroom pilot |
| "Chapter" or "Week" as canonical term? | See A4 above | Before A3 fix |
| Target document class for publisher? | `book` vs `report` | Before publisher submission |
| Exercise authoring: author writes or commissioned? | — | Before B1 |

---

*Last updated: 2026-05-09. Review basis: `main.tex`, all `weeks/*.tex`, `math_refresher/math_refresh.tex`, `math_preface_probability.tex`, `math_chapter01.tex`–`math_chapter13.tex`, `preamble.tex`, `VOICE.md`, `editorial_reader.md`, `editorial_refresh.md`. Chapter title mapping verified by grep on section headers.*
