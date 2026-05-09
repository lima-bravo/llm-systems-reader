# Editorial feedback: *Large Language Models as Engineered Systems*  
**(repository: `main.tex`, `preamble.tex`, `weeks/*.tex`, `figures/`, `references.bib`)**

Scope of this note: manuscript structure, consistency, pedagogy, risk of misstatement, and production readiness for an undergraduate-oriented systems primer (safe adoption, failure literacy, governance—not frontier model research).

---

## 1. Strengths (keep and foreground)

### 1.1 Pedagogical spine

- **Repeated chapter architecture**—narrative (“Setting the Scene”) → notation box → technical core → explicit failure modes → “Proved vs Assumed” / derivation ledger where used—matches how competent engineering texts train **calibrated** readers rather than dazzled ones.
- **Epistemic labeling in `preamble.tex`** (`\Def`, `\Emp`, `\Cons`, `\Heur`, `\Norm`, `\Find`, etc.) is distinctive and aligned with assurance-minded audiences (internal audit, safety, procurement).

### 1.2 Intellectual stance

- **Cross-entropy / MLE as “plausibility not truth”** is sustained from the preface through Week 1 and reused downstream (hallucination, calibration, eval). That thread is the correct backbone for corporate and societal risk framing.
- **System boundary emphasis** (especially retrieval, tools, prompts-as-artifacts, observability) matches where production incidents actually occur.

### 1.3 Distinctive chapters

- **Week 10** (governance, assurance cases, defense-in-depth framing via established safety-engineering lineage) is stronger than typical LLM surveys.
- **Week 12** (human-centric five-axis ladder) bridges engineer jargon and stakeholder diagnosis; keep it visible in marketing and TOC—it is a differentiator.

### 1.4 Disclosure

- **Preface acknowledgment of LLM-assisted drafting** (`main.tex`) is appropriate and should survive any commercial edition unchanged in substance.

### 1.5 Bibliography

- **`references.bib`** is large, sectioned by week in the header comment, and mixes canonical texts with calibration/governance lines—appropriate ambition for a serious primer.

---

## 2. Critical consistency errors (fix before any external review)

### 2.1 Chapter count vs manuscript reality

- **`main.tex` preface** states the book is organised into **“eleven chapters”** (approx. line 96).
- **`main.tex` actually `\input`s twelve week files**: `week01` … `week12`.
- **`weeks/week12_human_centric_error_model.tex`** opens with **“The eleven chapters of this book…”** (approx. line 8).

**Editorial action:** Global replace with accurate count (twelve) **or** adopt naming (“parts”, “modules”) that matches the file structure. Align `VOICE.md` (it still says “eleven chapters”).

### 2.2 “Chapter” vs “Week” vs section numbering

- Filenames use `weekNN`; prose sometimes says “Chapter~1” (e.g. `weeks/week03_tokenization_embeddings.tex` references “Chapter~1”).
- `\documentclass{article}` yields **sections**, not `\chapter`; calling units “chapters” is conventional but **table of contents depth** and cross-references must be checked so PDF numbering matchesstudent expectations.

**Editorial action:** Pick one canonical term (**Week** vs **Chapter**) for student-facing prose and sync all cross-references.

---

## 3. Structural gap: neural-network draft vs published spine

- **`weeks/ch03_neural_networks.tex`** exists as a **working draft explicitly not included in `main.tex`**, with a comment that future integration will **renumber CH3–CH12 to CH4–CH13** (file header).
- Current spine jumps from optimization/statistical foundations into **tokenization** as `\section` order in `main.tex`.

**Consequences**

- Any **parallel companion** or cross-reference scheme that assumes a dedicated “neural networks” chapter **does not match** the published reader order until integration lands.
- Pedagogically, some students will lack an explicit **MLP / backprop / depth** chapter unless Week 2 or elsewhere fully substitutes.

**Editorial action:** Either (a) integrate and renumber with a clear migration note, or (b) remove forward-looking draft from default builds and document the omission in the preface until shipped.

---

## 4. Audience and pacing

### 4.1 Stated prerequisites vs actual density

- Preface targets **undergraduate quantitative background**.
- **Week 1** alone is very long and technically dense (notations, assumptions A1.x, calibration machinery, multiple viewpoints on cross-entropy).

**Risk:** Honors / MSc-friendly; generic third-year cohort may need **trimmed track**, **problem-driven sequencing**, or mandatory companion routing.

**Editorial action:** Add an explicit **“minimal path”** (concept summaries + figures + failure-mode sections only) vs **“full derivation path”** in front matter.

### 4.2 Assessment artifacts

- Adoption often depends on **exercises, rubrics, labs, exams**. Not evidenced from root structure in this review pass.

**Editorial action:** Commission **two exercises per learning-objective bullet** minimum for a course package; separate **instructor manual**.

---

## 5. Factual, legal, and staleness risk

### 5.1 Fast-moving product landscape

Weeks cite **specific APIs, vendors, and calendar years** (e.g. function-calling era, MCP). Useful for motivation; **expires quickly**.

**Editorial action:** Sandbox volatile claims in **dated sidebars** or “As of YYYY-MM” callouts; keep core math and system invariants in the permanent text.

### 5.2 Regulatory summaries

Week 10-style synthesis (EU AI Act timing, NIST AI RMF, ISO 42001, jurisdictional framing) is pedagogically valuable but **not legal advice**.

**Editorial action:** Standard textbook disclaimer + **subject-matter legal/regulatory review** for target markets.

---

## 6. Line editing and citation hygiene

- Historical narrative is rich; **granular citations** (not only opening attributions) reduce reviewer pushback in academic channels.
- Ensure **every normative claim about standards** ties to a cite or official primary source.

---

## 7. Production / LaTeX hygiene

- `\documentclass{article}` + long-form multi-week content is workable but **may need `report` or `book`** for publisher workflows (chapters, odd/even, front matter).
- Verify **float placement**, **hyperlink stability**, and **build reproducibility** (CI latexmk or Docker) before submission.

---

## 8. Summary table

| Area              | Assessment                                      |
|-------------------|-------------------------------------------------|
| Mission fit       | Strong for systems + governance + failure modes |
| Rigor / structure | Strong                                          |
| Internal consistency | **Weak** (chapter count; week/chapter language) |
| UG pacing         | Heavy without scaffolding                       |
| Companion alignment | **Blocked** until NN chapter numbering resolved |
| Legal/staleness   | Needs layered editorial policy                  |

---

*Generated from repository inspection: `main.tex`, selected `weeks/*.tex`, `preamble.tex`, `references.bib` header, grep on “eleven chapters”.*
