# Editorial Decisions — LLM Systems Reader

This file captures decisions made during content planning so future sessions (and co-authors) can stay consistent.

## Audience
- Target reader: a working engineer with a solid math/CS background.
- Goal: equip them to reason about LLMs as engineered systems AND integrate them into daily workflows.
- The reader should leave able to (a) explain the mechanics, (b) pick sensible integrations, (c) argue about tradeoffs.

## Decisions captured from the user (2026-04-21)

| Decision | Choice |
|---|---|
| Chapter depth | **Deep dive (~20+ pages per week)** — derivations from first principles, code snippets, case studies, exhaustive bibliography per chapter. |
| Modern access coverage | **Add a new Week 11 chapter** on how LLMs are delivered today: APIs, SDKs, chat UIs, IDE integrations (Claude Code, Cursor), agent runtimes, MCP. Keep Week 9 focused on RAG / tools / eval. |
| Bibliography scope | **Comprehensive** — foundational papers + course URLs (CS224N, CS324, 6.S191, etc.) + vendor docs (OpenAI, Anthropic, HF) + supplementary reading per week. |
| Labs / notebooks | **LaTeX only for now.** Do not touch `.ipynb` files or expand lab READMEs in this phase. |

## Style conventions
- Language: LaTeX, article class, apalike bibliography.
- Every cited work must have a BibTeX entry in `references.bib`.
- Web resources are first-class citizens: cite as `@misc` with `howpublished = {\url{...}}` and an access date in `note`.
- Figures go in `figures/` as `.tex` TikZ files (preamble should enable TikZ) or as image files with `\includegraphics`.
- Each week ends with: Key References, Recommended University Lectures, Practitioner Lab, Takeaway.

## Outstanding questions to revisit later
- Which open-weight models to feature in worked examples (Llama family, Mistral, Qwen, DeepSeek, GPT-OSS)?
- Should we include a chapter on evaluation benchmarks in depth (MMLU, HELM, HumanEval, SWE-Bench, ARC-AGI)?
- Should Week 11 include a short section on plugin/marketplace ecosystems (Claude Code plugins, Cursor extensions)?
- Do we want an appendix on inference-time techniques (speculative decoding, KV-cache, paged attention, continuous batching)?
