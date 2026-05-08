# llm-systems-reader

A foundational reader on Large Language Models for engineers, written from a
systems-engineering perspective. The reader treats LLMs not as black boxes but
as *engineered socio-technical systems*, and walks through the underlying
technology end-to-end so that a practicing engineer can reason rigorously about
integration, failure modes, and tradeoffs.

## Scope

Thirteen chapters, each a deep-dive of roughly twenty pages:

1. Statistical learning foundations — LLMs as conditional distributions
2. Optimization, generalization, and scaling intuition
3. Neural networks — the function class, backpropagation, and the
   primitives that make depth trainable
4. Tokenization and embeddings — from text to vectors
5. The Transformer — attention as the core computational primitive
6. Pretraining, GPT-style models, and in-context learning
7. Efficiency, scaling, and Mixture-of-Experts
8. Model adaptation — LoRA, quantization, deployment reality
9. Alignment, instruction tuning, and preference optimization
10. LLM systems — retrieval, tool use, and evaluation harnesses
11. Governance, assurance, and the future of AI systems
12. Modern LLM access — APIs, SDKs, agents, IDE integrations, MCP
13. A human-centric model for understanding LLM errors

Chapter 3 (neural networks) is foundational scaffolding for readers
who have not taken a deep-learning course; readers who have can
skim or skip it. Every other chapter uses its primitives.

Each chapter follows a consistent template: a Sagan-voiced *Setting the
Scene* prologue (problem → lineage → current practice → failure modes),
learning objectives, conceptual core, systems-engineering implications,
human-factors and failure modes, key references, recommended university
lectures, practitioner lab, and a closing takeaway.

## Repository layout

```
.
├── main.tex                 Top-level document; \input's every chapter
├── preamble.tex             Packages, math macros, TikZ setup, styling
├── references.bib           Bibliography (papers + vendor docs + course URLs)
├── weeks/                   One .tex file per chapter (week01..week12
│                            for the original 12 chapters; ch03 for
│                            the new neural-networks chapter inserted
│                            in Wave 11.2)
├── figures/                 TikZ source for diagrams
├── labs/                    Accompanying Jupyter notebooks (one per week)
├── templates/               Assurance-case, hazard-analysis, controls matrix
├── article/                 Standalone articles derived from CH12
│                            (engineering long-form, legal long-form,
│                            legal one-page brief), with .tex / .md / .pdf
├── CHANGELOG.md             Wave-level history of revisions
└── .project/                Editorial decisions and authoring notes
```

## Building the PDF

The document uses `pdflatex` + `bibtex` with an `apalike` bibliography. Any
standard TeX Live 2022 (or newer) installation works.

### One-shot with latexmk (recommended)

```bash
latexmk -pdf main.tex
```

### Manual four-pass build

```bash
pdflatex main.tex
bibtex   main
pdflatex main.tex
pdflatex main.tex
```

The build is currently verified to complete with zero warnings and zero errors
on a stock Debian TeX Live installation.

## Conventions

- **Bibliography**: every citation referenced in text lives in
  `references.bib`. Web resources use `@misc` entries with
  `howpublished = {\url{...}}` and an access-date `note`.
- **Figures**: TikZ diagrams live in `figures/*.tex` and are included via
  `\input{figures/<name>}` inside a `figure` environment with a caption and
  label.
- **Chapters**: one `\section` per chapter, no manual "Chapter N:"
  prefix in the heading (LaTeX auto-numbers). Subsections follow
  the template in Chapter 1. Cross-reference with
  `\label{sec:weekN-subject}` for the original chapters and
  `\label{sec:nn-subject}` for the new neural-networks chapter,
  resolved via `\ref{}`. File names retain their original
  `weekNN_*.tex` numbering as stable internal anchors; the
  rendered chapter numbering is what changed in Wave 11.2.
- **Math macros**: common symbols (`\E`, `\R`, `\KL`, `\entropy`) are defined
  in `preamble.tex` — prefer these over inline `\mathbb{...}`.

## Authoring notes

Editorial decisions (depth, scope, style) for this reader are captured in
`.project/editorial_decisions.md`. Future contributors should read that file
before making structural changes.

## License

See `LICENSE`.
