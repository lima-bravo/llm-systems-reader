# Editor's Command File — *Large Language Models as Engineered Systems*

*Maintained by: editorial review sessions. This file is the live command document. All prior findings in `editorial_reader.md` and `editorial_refresh.md` are superseded by this file when they conflict.*

---

## Current status: STRONG DRAFT — blocking structural issues resolved; agentic AI, verification, private corpus, refresher alignment, NTG editorial fixes, Feynman Standard mechanism pass, NTG completion pass, NTG→main backport, article error taxonomy completion (six classes + calibration), article structural reorder (taxonomy before ladder), ch13 + NTG ch13 structural reorder + six-class taxonomy completion, and ladder-relationship notes for compounding/coverage complete across all documents

The manuscript has genuine distinction. The voice is right, the intellectual spine is right, the systems framing is right. The §A blocking issues have been resolved (2026-05-09). Six agentic AI coverage gaps in ch12 addressed (2026-05-09). Verification cost erosion added across ch10, ch12, ch13 (2026-05-09). Private corpus / vocabulary gap treatment added across ch04, ch08, ch10 (2026-05-09). Five math refresher alignment gaps fixed (2026-05-09): positional encodings (ch05), constrained optimisation/partition functions (ch02), SVD/Eckart-Young (ch08), Unigram-LM EM (ch04), BM25/RRF formulas (ch10). Non-technical guide editorial fixes applied (2026-05-09): two factual corrections, Schaeffer balance, vocabulary gap, automation complacency, verification cost inversion, voice pass (see §A10). Feynman Standard mechanism pass applied (2026-05-09): standard codified in STRUCTURE.md and preface; mechanism subsections added to NTG ch04, ch05, ch08 (see §A11). NTG completion pass applied (2026-05-09): remaining Feynman Standard gaps in ch03 and ch09 fixed; worked diagnosis example added to ch13; practical synthesis chapter (ch14) and closing note with further reading (ch15) written and registered (see §A12). NTG→main backport applied (2026-05-09): three improvements identified from NTG writing applied to main reader ch09 and ch13 (see §A13). Article editorial pass applied (2026-05-09): both standalone articles updated for Feynman Standard and voice consistency (see §A14). §B items remain required for a commercial edition. §C items are optional enhancements.

**Verdict:** §A is complete. All three readers (main, math refresher, non-technical guide) are editorially consistent. The "map then tool" principle is now applied uniformly across all five documents (NTG ch13, main reader ch13, engineering article, legal article — all teach the full failure taxonomy before demonstrating the ladder). NTG now meets the Feynman Standard across all chapters, has a worked diagnosis example for the five-axis model, a practical synthesis for non-technical readers deploying these systems, and a closing note that returns to the preface's promises. Main reader ch09 now derives sycophancy from the margin-only identifiability of Bradley-Terry; ch13 now carries the full six-class escape taxonomy (compositional degradation and distributional mismatch added in §A18), applies the "map then tool" structure (escape classes section now precedes the diagnostic ladder section), includes calibration failure within the groundedness axis, and expands the adversarial item with the indirect prompt injection mechanism. Both standalone articles now carry the full five-axis model with mechanism explanations plus a complete six-class taxonomy of failures that escape the ladder: normative, adversarial (with indirect injection mechanism), drift, complacency, compositional degradation, and distributional mismatch. Calibration failure is named and explained within the groundedness section of all three documents. Address §B items before any external review or classroom pilot.

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

### A10. ✓ Non-technical guide editorial fixes — FIXED 2026-05-09

Full editorial review of the non-technical companion guide (all 14 files). Two factual corrections required; four completeness/voice items also applied.

| Fix | File | Issue | Action taken |
|-----|------|-------|-------------|
| **Factual 1** | `chapter07_scaling_efficiency.tex` | Mixtral 8x7B date stated as "2024"; correct date is December 2023 | Changed "in 2024" → "in December 2023" |
| **Factual 2** | `chapter10_memory_the_model_lacks.tex` | BM25 attributed to Robertson and Spärck Jones "at Cambridge"; Robertson was at City University London | Split attribution: "Robertson at City University London and Spärck Jones at Cambridge" |
| **Balance** | `chapter06_pretraining_gpt.tex` | Emergence discussion left reader with stronger impression of discontinuous emergence than current consensus supports | Rewrote "Emergence claims" paragraph to give Schaeffer (2023) reading majority weight while retaining honest uncertainty for remaining cases |
| **Completeness** | `chapter10_memory_the_model_lacks.tex` | Private-corpus vocabulary gap (present in main reader ch04, ch10) absent from NTG | Added paragraph on tokenizer vocabulary mismatch in "What goes wrong, and why" |
| **Completeness** | `chapter11_trust_governance.tex` | Automation complacency failure mode absent; aviation analogy already in chapter | Added paragraph on complacency in "What goes wrong, and why", tied to existing aviation analogy |
| **Completeness** | `chapter12_apis_agents_mcp.tex` | Verification cost inversion (present in main reader ch10, ch12, ch13) absent from NTG | Added paragraph on verification as binding constraint in "The engineering consequence" |
| **Voice** | `chapter07_scaling_efficiency.tex` | Energy/infrastructure paragraph had two sentences in tech-journalism register | Reworded to Sagan plain-prose register |

Files changed: `chapter06_pretraining_gpt.tex`, `chapter07_scaling_efficiency.tex`, `chapter10_memory_the_model_lacks.tex`, `chapter11_trust_governance.tex`, `chapter12_apis_agents_mcp.tex`.

---

### A11. ✓ Feynman Standard — mechanism pass on NTG — FIXED 2026-05-09

Editorial review identified three chapters where the NTG explained *what* a component produces but not *why* the training/design makes it produce that. Identified as the gap between vocabulary-and-orientation (delivered) and mechanism-level comprehension (the Feynman Standard, not yet met in those chapters).

**Standard codified:**
- `STRUCTURE.md`: Feynman Standard added to audience contract (learning outcomes), to voice anchor as a named principle, and to the cohesion checklist as a mandatory gate.
- `chapter00_preface.tex`: Feynman Standard named and explained in the "What this book is" section; Feynman's bird/name distinction quoted and applied.

**Mechanism subsections added:**

| Chapter | Subsection added | Mechanism explained |
|---------|-----------------|---------------------|
| `chapter04_letters_to_vectors.tex` | "Why training pressure carves meaning into the space" | Next-token prediction creates shared prediction targets for words that appear in similar contexts; the cheapest path to lower loss is similar internal representations. The geometry is the residue of that pressure, not a designed feature. Bias-as-corpus-statistics consequence follows directly. |
| `chapter05_attention.tex` | "What produces the weights: the learned matching mechanism" | Each position produces a query (what am I looking for?) and a key (what do I have to offer?). The model learned, through gradient updates on billions of next-word predictions, to produce queries and keys that match when one token is relevant to another. Pronoun-antecedent example walked through concretely. |
| `chapter08_adapting_giant_models.tex` | "Why the low-rank bet is usually a good one" | Adaptation tasks shift behavioural defaults among things the model already knows, not acquire new knowledge. That kind of change is narrow relative to the full parameter space. LoRA exploits the narrowness. The bet fails for tasks requiring genuinely new capability absent from pretraining. |

---

### A12. ✓ NTG completion pass — FIXED 2026-05-09

Final pass to bring the non-technical guide from educational to equipped: reader finishes able not just to understand but to act.

**Remaining Feynman Standard gaps fixed:**

| Chapter | Subsection added | Mechanism explained |
|---------|-----------------|---------------------|
| `chapter03_neural_networks.tex` | "How the weights are adjusted: what backpropagation actually does" | Forward pass produces loss; backward pass applies the chain rule in reverse to compute per-weight gradient; cost = two passes × every example × thousands of iterations. GPU parallelism: within-layer multiplications are independent, so cards designed for video game rendering accelerate training by two to three orders of magnitude. Vanishing gradient: chain-rule multiplication of many small numbers → signal near zero at early layers; residual shortcut short-circuits the chain and fixes this. |
| `chapter09_teaching_manners.tex` | "What the reward model actually learns" | Reward model = function from (prompt, response) → scalar. Trained on ranked pairs, not on absolute labels. Loss penalises higher score for rejected response; rewards correct ordering. Consequence: model learns a pattern-matcher, not a judge. Reward hacking follows directly (policy finds inputs that fool the pattern-matcher). Sycophancy follows directly (agreement was marginally preferred in annotation data → reward model rewards agreement → policy learns to agree). |

**Ch13 worked diagnosis example added:**
- New `\section{A worked diagnosis}` inserted between "Walking the ladder" and "Connections to earlier chapters"
- Prompt: "Who wrote 1984, give me a brief summary"
- Model response contains: one grounding failure (Room 101 attributed to Ministry of Truth, should be Ministry of Love) and one plausibility-trap attribution (1948→1984 digit-reversal — widely repeated, never confirmed by Orwell)
- Walked axis by axis: structure, meaning, context pass; grounding fails at two specific details; environment passes
- Key lesson: grounding failures concentrate in peripheral details (supporting citations, secondary attributions, names and dates) precisely because those details are underrepresented in training

**Two new chapters written and registered in `non_technical_guide.tex`:**

| File | Content |
|------|---------|
| `chapter14_what_to_ask.tex` | "What to Ask Before You Deploy" — 6 sections covering hallucination, sycophancy/reward hacking, prompt brittleness, context loss, prompt injection, automation complacency. Each section: 2-3 concrete questions a non-technical reader can ask engineers or vendors. Questions are demanding (require real answers, reveal system quality). Closing note: questions are the beginning of a productive conversation, not a checklist. |
| `chapter15_closing_note.tex` | "A Closing Note, and Where to Go Next" — returns to preface promises; consolidates what the reader now holds (the mechanism, not just the vocabulary); separates what will change (specific models/architectures) from what will not (objective → plausibility gap; preference model → pattern-matcher; form-without-reference problem). Annotated further reading: technical companion; three key papers (Vaswani 2017, Ouyang 2022, Schaeffer 2023); two popular books (Mitchell 2019, Christian 2020); guidance on reading lab blogs critically. |

`non_technical_guide.tex` updated: `chapter14_what_to_ask` added to `\mainmatter`; `chapter15_closing_note` added to `\backmatter`.

---

### A20. ✓ Ladder-relationship notes for compounding and coverage — FIXED 2026-05-10

The compounding and coverage/distributional escape classes lacked explicit notes about how (or whether) they appear when a reader walks the five-axis ladder. Without these notes, a reader who encounters a coverage failure on the ladder would diagnose it as a grounding failure and apply the wrong remedy; a reader who chains steps and walks each one individually would see nothing wrong and conclude the chain is safe.

**Change applied to all four documents:**

| Class | Note added |
|-------|-----------|
| **Compounding** | A chain in which every individual step passes the ladder is not therefore safe — the ladder has no view of accumulated error across steps. (The three technical documents already had this note; the NTG version was weakened to "Each step may pass the ladder individually" and was strengthened to be explicit.) |
| **Coverage / distributional mismatch** | Coverage failures can surface on the ladder as grounding failures. The ladder correctly names the symptom; it does not identify the cause as a training-deployment distribution gap. Applying the grounding remedy — retrieval, verification, tool use — addresses individual claims but not the structural problem. The structural remedy is deployment-distribution evaluation. |

**Files changed:** `non_technical_guide/chapter13_map_of_errors.tex`, `weeks/ch13_human_centric_error_model.tex`, `article/human_centric_error_model.tex`, `article/legal_diagnostic_ladder.tex`.

---

### A19. ✓ NTG ch13 structural reorder + six-class taxonomy completion — FIXED 2026-05-10

`non_technical_guide/chapter13_map_of_errors.tex` brought into alignment with the "map then tool" principle and the six-class escape taxonomy.

**Structural reorder (section order change):**

| Before | After |
|--------|-------|
| `\section{The five axes, in plain language}` | `\section{The five axes, in plain language}` |
| `\section{Walking the ladder}` | `\section{What the ladder does not catch}` (rewritten, see below) |
| `\section{A worked diagnosis}` | `\section{Walking the ladder}` |
| `\section{Connections to earlier chapters}` | `\section{A worked diagnosis}` |
| `\section{What the ladder does not catch}` | `\section{Connections to earlier chapters}` |

- New opening of escape classes section: "The five axes map the full range of single-output failures... Several failure classes exist alongside them that fall outside that single-output frame entirely. These are worth knowing before walking the ladder..."
- New closing transition: names a different response for each of the six classes; bridges explicitly to the ladder as a procedure for the five-axis failures.
- New opening of `\section{Walking the ladder}`: "With the full failure landscape in view, the ladder's scope is clear: it is a diagnostic procedure for the five-axis failures --- the single-output failures that a systematic walk can surface."

**Taxonomy rewritten (four classes replaced/added):**

| Fix | Gap | Change |
|-----|-----|--------|
| **Calibration failure** | Grounding section recommended verification but did not explain why expressed confidence cannot be used to triage which claims to check | Added paragraph: model writes with uniform confident prose regardless of reliability; cannot use surface certainty to prioritise verification; all factual claims require the same scrutiny |
| **Normative item expanded** | Collective-impact (population-level harm) was a separate fourth item; this is governance territory (Ch11), not a ladder-escape class | Folded population-level harm into the normative item as a related variant; normative item now covers both individual and collective normative failures |
| **Complacency added** | Missing from NTG (present in main reader ch13, both articles, NTG ch11) | Added as fourth class: vigilance decay in high-volume mostly-correct settings; review becomes perfunctory; record shows it happened, not how carefully; remedy is workflow (rotation, spot checks, review quality metrics) |
| **Compounding added** | Missing from NTG entirely | Added as fifth class: errors multiply across chained steps; 95% per step → below 60% on ten-step chain; remedy is checkpointing, not step improvement |
| **Coverage added** | Missing from NTG entirely | Added as sixth class: fine-tuning population ≠ deployment population; underperformance at edges; distinct from drift and hallucination; remedy is deployment-specific evaluation |

**"Where we stand" roadmap paragraph added:** "The five axes map single-output failures. Six further failure classes exist alongside them that fall outside the single-output frame: normative, adversarial, drift, complacency, compounding, and coverage failures. The chapter maps all of these before demonstrating the ladder in practice."

---

### A18. ✓ ch13 structural reorder + six-class taxonomy completion — FIXED 2026-05-10

`weeks/ch13_human_centric_error_model.tex` brought into alignment with the "map then tool" principle already applied to both articles in §A16/§A17. The chapter previously taught the diagnostic ladder before disclosing the six escape classes; now the escape classes section precedes the ladder section.

**Structural reorder (section order change):**

| Before | After |
|--------|-------|
| `\section{The Diagnostic Ladder}` | `\section{What the Model Does Not Capture}` (expanded, see below) |
| `\section{What the Model Does Not Capture}` | `\section{The Diagnostic Ladder}` |
| `\section{Worked Example}` | `\section{Worked Example}` |
| `\section{Connections to Earlier Chapters}` | `\section{Connections to Earlier Chapters}` |

- New opening of escape classes section: "The five axes map the full range of single-output failures... Six additional failure classes exist alongside them; they escape the single-output frame entirely and require different detection and remediation. The diagnostic ladder in the next section addresses only the five axes."
- New opening of `\section{The Diagnostic Ladder}`: "With the full failure landscape in view, the ladder's scope is clear: it is a systematic procedure for the five-axis failures."

**Six-class taxonomy now complete in ch13 (two classes were missing):**

| Fix | Gap | Change |
|-----|-----|--------|
| **Calibration failure** | Grounding subsection lacked explanation of why expressed confidence cannot be used to triage which claims to check | Added paragraph: uniform authoritative prose register regardless of reliability; token-level probabilities not accessible to users; all claims require uniform verification |
| **Expanded adversarial item** | Adversarial item was brief; indirect injection mechanism absent from technical chapter that discusses RAG pipelines | Named indirect prompt injection, explained mechanism (instructions in content model is asked to process, not in user prompt), named defenses: input sanitisation, output schema enforcement, privilege separation |
| **Compositional degradation** | Absent from ch13 (present in both articles) | Added: $p^k$ reliability on $k$-step chain; 95% per step → below 60% on ten-step; failure is a property of the chain, not any single step; remedy is architecture (decompose + checkpoint); cross-references to ch12 agent evaluation and ch11 staged HITL review |
| **Distributional mismatch** | Absent from ch13 (present in both articles) | Added: fine-tuning distribution ≠ deployment distribution; model underperforms at periphery of training-task distribution; distinct from drift (parametric cutoff) and environment failure; references RLHF phases (ch09); remedy is deployment-specific evaluation |

**New closing of escape classes section**: names specific remediation for each of the six classes; bridges explicitly to the ladder.

**Supporting additions (smaller, applied in prior session):**
- Learning objective 4 updated to enumerate all six escape classes by name
- LLM Components Covered extended to include compositional degradation and distributional mismatch
- "Where we stand" paragraph in Setting the Scene updated: "The five axes map single-output failures. Six additional failure classes exist alongside them... The chapter maps all eleven before demonstrating the ladder in practice."

---

### A17. ✓ Article structural reorder: taxonomy before ladder — FIXED 2026-05-09

Both articles restructured so the full failure taxonomy is taught before the ladder is demonstrated.

**Pedagogical rationale**: The ladder is most useful as a reasoning tool when the reader already has a map of all the territory it operates in. The previous structure taught the ladder first, then disclosed its limits as a coda. Readers encountered the six escape classes after the walk was complete, making them feel like footnotes. The new structure teaches the full failure landscape first, then shows the ladder in action — the walk becomes a demonstration of a known tool against a known map.

**Changes made (both articles)**:
- Added roadmap paragraph to intro section: five-rung failures (single-output) + six escape classes (outside the frame); article maps both before demonstrating the ladder.
- Renamed and moved "What the model/ladder does not capture" to before "Walking the ladder"; renamed to "Beyond the five axes" / "Beyond the five rungs" to signal its role as a map extension rather than a coda.
- Updated opening of moved section: frames it as completing the map before the walk, not as disclosing the ladder's limits after the walk.
- Added closing transition in moved section: names the different remediation required for each of the six classes; bridges explicitly to the ladder as a procedure for the five-axis failures.
- Updated opening of "Walking the ladder": makes the ladder's scope explicit — a procedure for the five-axis/rung failures — before beginning the example.
- Fixed forward reference in legal article drift paragraph: "The walking example above already surfaces this" → "Legal practice surfaces this regularly" (section now precedes the walk).

---

### A16. ✓ Article error taxonomy completion — FIXED 2026-05-09

Both articles now carry a complete six-class error taxonomy beyond the five-axis ladder. Four classes were added or expanded in this pass.

| Fix | File | Gap | Change |
|-----|------|-----|--------|
| **Calibration failure** | both articles | Groundedness sections recommended verification but did not name why the model's expressed confidence cannot be used to triage which claims to check. | Added paragraph: model's prose register is uniformly authoritative regardless of reliability; token-level probabilities correlate with accuracy but not strongly enough to substitute for external verification and inaccessible to users seeing prose; all claims must be verified uniformly, not selectively for claims that happen to sound uncertain. Legal version notes that legal prose is authoritative by convention, which the model has absorbed and applies regardless of whether the underlying claim is accurate. |
| **Indirect prompt injection mechanism** | `human_centric_error_model.tex` | Adversarial item was two sentences with no mechanism. Legal article has developed version; engineering article written for the people who build RAG pipelines had less. | Expanded: indirect prompt injection = instructions in content model is asked to process, not in user prompt; retrieval pipeline processes potential adversarial inputs every call; model has no reliable mechanism to distinguish instructions from data; defenses: input sanitization, output schema enforcement, privilege separation. |
| **Compositional degradation** | both articles | Absent from both. Multi-step chained inference compounds errors multiplicatively; no individual step fails the ladder, failure is a property of the chain. | Added as fifth class: 95% reliability per step → <60% on a ten-step chain; remedy is architecture (decompose + checkpoint), not prompt. Legal version: multi-step doctrinal analysis (standing → jurisdiction → standard → element satisfaction) requires verification at each intermediate step, not only at conclusion. |
| **Distributional mismatch** | both articles | Absent from both. Fine-tuning distribution ≠ deployment distribution; model may underperform in specific niches not from missing pretraining data but from alignment toward modal tasks. | Added as sixth class. Engineering version: targeted evaluation on real deployment distribution before relying on benchmark numbers. Legal version: specialty courts, narrow regulatory domains, emerging statutory areas may be at periphery of tool's fine-tuning distribution; remedy is practice-area evaluation before deployment. |
| **Conversation-level framing note** | `human_centric_error_model.tex` | Framework assumes single-output evaluation; conversation-level degradation unaddressed. | Added sentence to closing paragraph: earlier errors propagating into later outputs, instruction drift across a long session, and losing track of constraints set at session start require session-level evaluation. |

---

### A15. ✓ Article verification + complacency additions — FIXED 2026-05-09

Both standalone articles extended with two failure classes that the previous editorial pass had not yet included.

| Fix | File | Gap | Change |
|-----|------|-----|--------|
| **Automation complacency (fourth item)** | `human_centric_error_model.tex` | "What the model does not capture" listed three failure classes; the same complacency problem addressed in the main reader (ch13) and NTG was absent. | Added fourth item: the five-axis procedure assumes an active reviewer; human-factors research documents vigilance decay after a run of correct outputs; system records whether review happened, not how carefully; effective error rate rises as vigilance decays. |
| **Verification cost** | `human_centric_error_model.tex` | "Why this matters" section did not address the asymmetry between falling generation cost and stable verification cost, which is a direct implication of the ladder for engineering teams. | Added paragraph: generation cost falling; verification cost not falling at same rate; team doing full five-axis review spends most attention above groundedness; ladder guides where to concentrate verification before failures occur. |
| **Automation complacency (fourth item)** | `legal_diagnostic_ladder.tex` | "What the ladder does not capture" listed three failure classes; professional-responsibility angle on complacency was missing. | Added fourth item: duty of competence includes sustaining review quality over time; oversight that becomes perfunctory after a run of correct outputs does not satisfy the duty; bar records whether review happened, not how carefully; effective error rate rises as vigilance decays. |
| **Verification cost (fourth firm-level recommendation)** | `legal_diagnostic_ladder.tex` | "What this means for firms" listed three recommendations; the ROI calculation asymmetry was unaddressed. | Added fourth: drafting time falls, verification time does not fall at same rate; ROI built on generation savings alone undercounts verification burden; bottleneck shifts to careful review; ladder guides concentration of review effort. |

---

### A14. ✓ Article editorial pass — FIXED 2026-05-09

Both standalone articles (`article/human_centric_error_model.tex` and `article/legal_diagnostic_ladder.tex`) reviewed against the Feynman Standard and updated voice. Both were strong; four targeted improvements applied.

| Fix | File | Gap | Change |
|-----|------|-----|--------|
| **Mechanism after walking example** | `human_centric_error_model.tex` | Walking example identified groundedness failure (invented ORM method) without explaining why the model produced it. | Added paragraph after the walk: next-token prediction → ORM method patterns statistically likely in training data → model produces plausible-fitting call regardless of whether the specific method exists. Key observation: failure concentrates in peripheral detail (exact method name), not the skeleton (filter/sort/return). Genre correct, specific referent not. Remedy reframed: giving the model the ORM schema changes the question from "what is statistically likely" to "what is consistent with this document." |
| **Line-break repair** | `human_centric_error_model.tex` | Broken sentence in environment section split across lines. | Joined with semicolon: "A language model has access to its weights and its context window; it does not have access to..." |
| **Retrieval mechanism explanation** | `legal_diagnostic_ladder.tex` | Groundedness section stated that retrieval-augmented tools still fail at meaningful rates (citing Magesh study) without explaining the mechanism. | Added paragraph: the model produces the most plausible continuation of the prompt given the retrieved text, not faithful transcription; parametric prior baked in during training can override retrieved source when they conflict; result is misrepresentation of a real holding, not fabrication — "misreading in the way a rushed human reader might misread, at scale and without the fatigue that would signal the risk." |
| **"What the ladder does not capture" section** | `legal_diagnostic_ladder.tex` | Engineering article has this section; legal article lacked it. Three failure classes relevant to legal practice: normative (legally defensible but strategically/ethically wrong — judgement the tool cannot supply), adversarial (prompt injection in document review — hostile party embedding instructions in reviewed materials), drift (parametric knowledge frozen at training cutoff; model's background doctrinal assumptions don't update even when retrieval fetches current cites; currency checking remains human responsibility). | Added `\section*{What the ladder does not capture}` before "What this means for firms." |

---

### A13. ✓ NTG→main backport — FIXED 2026-05-09

Three improvements identified while writing for the non-technical guide that the main reader lacked. Writing without equations forces explicit statement of causal chains; two of those chains were present in the main reader's mathematics but not drawn explicitly in prose.

| Fix | File | Gap | Change |
|-----|------|-----|--------|
| **Sycophancy mechanism** | `weeks/ch09_alignment_preference_optimization.tex` | Sycophancy paragraph stated the phenomenon and cited Bai et al. but did not derive it from the training structure. The main reader already proves margin-only identifiability of Bradley-Terry (Eq. `eq:bt`); the causal chain from that property to sycophancy was not drawn. | Added paragraph completing the chain: margin-only identifiability → if agreement wins the margin consistently in training data → reward model learns to score agreement above disagreement → policy trained against it learns to agree → adversarial-disagreement examples in the preference mix are the targeted fix because they force the reward model to learn truth-tracking rather than agreeableness as the margin signal. |
| **Worked example mechanism** | `weeks/ch13_human_centric_error_model.tex` | Existing worked example (coding assistant / ORM method) demonstrated the diagnostic procedure but stopped at "the remedy lives here" without naming the mechanism that produced the grounding failure. | Added post-walk section naming: next-token prediction optimises for plausibility (Ch1 mechanism); ORM method name patterns are common in training data so the invented call is statistically likely; failure concentrates in peripheral details (specific method names) vs. skeleton (filter + sort + return) because the skeleton is more strongly represented; hallucinated citations, invented API endpoints, and fabricated function signatures all follow the same pattern. Added separate paragraph for environment failure: no engineering intervention can prevent it, only the human can close the gap. |
| **What endures vs. what ages** | `weeks/ch13_human_centric_error_model.tex` | No section distinguished time-stable structural claims from time-sensitive empirical ones. Engineering readers in a fast-moving field need this distinction explicitly named. | Added `\section{What Endures and What Ages}` (`\label{sec:ch13-what-endures}`) after the Chapter 13 Takeaway. Three load-bearing structural claims: (1) plausibility–truth gap (objective-level, survives model changes); (2) pattern-matcher problem (training-procedure-level: margin-only identifiability of pairwise preferences → Goodhart drift → sycophancy); (3) form-without-reference problem (Harnad/Bender-Koller; engineering additions import reference at inference time, don't solve architecturally). Closing: "These three are the load-bearing walls of the current architecture. The rest is furniture." |

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

*Last updated: 2026-05-09 (article structural reorder: taxonomy before ladder — §A17). Review basis: `main.tex`, all `weeks/*.tex`, `math_refresher/math_refresh.tex`, `math_preface_probability.tex`, `math_chapter01.tex`–`math_chapter13.tex`, `preamble.tex`, `VOICE.md`, `editorial_reader.md`, `editorial_refresh.md`, all 14 `non_technical_guide/*.tex` files. Chapter title mapping verified by grep on section headers. Agentic AI gap analysis: full read of `ch12_access_apis_agents_mcp.tex` (1,509 lines pre-edit), cross-check against ch09/ch10/ch11/ch13 for agent-relevant content. Refresher alignment: cross-document audit of all 13 reader chapters against 13 refresher chapters; five gaps identified and filled (positional encodings, constrained optimisation/partition functions, SVD/Eckart-Young, Unigram-LM EM, BM25/RRF). NTG editorial review: full read of all 14 chapters; seven fixes applied (see §A10). Feynman Standard: standard codified in STRUCTURE.md and preface; mechanism subsections added to NTG ch04 (embedding geometry), ch05 (attention weight production), ch08 (LoRA low-rank justification) (see §A11).*
