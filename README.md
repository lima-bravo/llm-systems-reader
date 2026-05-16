# llm-systems-reader

A foundational reader on Large Language Models for engineers, written from a
systems-engineering perspective. The reader treats LLMs not as black boxes but
as *engineered socio-technical systems*, and walks through the underlying
technology end-to-end so that a practicing engineer can reason rigorously about
integration, failure modes, and tradeoffs.

The repository also contains companion and spin-off LaTeX works (a non-technical
guide, a math refresher, and standalone articles). All PDFs are built from the
same root with one script; see [Building PDFs](#building-pdfs).

## Scope (main reader)

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

### Other documents in this repository

| Output (`targets.txt`) | Source | Role |
| --- | --- | --- |
| `main.pdf` | `main.tex` | Primary engineering reader (above) |
| `non_technical_guide/non_technical_guide.pdf` | `non_technical_guide/non_technical_guide.tex` | Same chapter arc without formulas; see `non_technical_guide/README.md` |
| `math_refresher/math_refresh.pdf` | `math_refresher/math_refresh.tex` | Strang-style math companion keyed to the main chapters |
| `article/human_centric_error_model.pdf` | `article/human_centric_error_model.tex` | Standalone article from the error-model chapter |
| `article/legal_diagnostic_ladder.pdf` | `article/legal_diagnostic_ladder.tex` | Long-form legal diagnostic ladder |
| `article/legal_diagnostic_ladder_brief.pdf` | `article/legal_diagnostic_ladder_brief.tex` | One-page legal brief |

## Repository layout

```
.
├── main.tex                 Top-level document; \input's every chapter
├── preamble.tex             Packages, math macros, TikZ setup, styling
├── references.bib           Bibliography for the main reader
├── targets.txt              PDF paths to build (one per line)
├── build-pdfs.sh            Build all targets; stage into PDF/
├── weeks/                   One .tex file per main-reader chapter
├── figures/                 TikZ source for diagrams
├── labs/                    Accompanying Jupyter notebooks (one per week)
├── templates/               Assurance-case, hazard-analysis, controls matrix
├── non_technical_guide/     Companion guide (own preamble, chapters, README)
├── math_refresher/          Math companion chapters + math_refresh.tex
├── article/                 Standalone articles (.tex / .md)
├── editorial_archive/       Past reviews and editorial notes
├── build/                   latexmk output (aux + PDF); gitignored
├── PDF/                     Staged PDFs after a successful build-pdfs run
├── CHANGELOG.md             Wave-level history of revisions
└── .project/                Editorial decisions and authoring notes
```

## Building PDFs

**Requirements:** TeX Live 2022 (or newer) with `latexmk` and `pdflatex` on
your `PATH`. The main reader uses `pdflatex` + `bibtex` with an `apalike`
bibliography; other documents may omit BibTeX.

### Build everything (recommended)

From the repository root:

```bash
./build-pdfs.sh
```

The script:

1. Reads relative PDF paths from `targets.txt` (comments and blank lines
   allowed).
2. For each target, runs `latexmk` from `./build` with `-outdir` and
   `-auxdir` set so artifacts land under `build/` with the same layout as
   the final PDF path (e.g. `build/article/legal_diagnostic_ladder.pdf`).
3. Copies each built PDF into `PDF/` with the same relative path, **only when
   the file changed** (byte-for-byte compare with the existing staged copy).

Add or remove a publication by editing `targets.txt` and ensuring the
matching `.tex` file exists alongside the listed `.pdf` path.

### Build a single target

Example for the main reader only:

```bash
mkdir -p build
cd build
latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error -cd \
  -outdir=. -auxdir=. ../main.tex
```

Use the corresponding `../<path>.tex` and set `-outdir` / `-auxdir` to
`build/<subdir>` when the PDF is not at the repository root (mirror the paths
used in `build-pdfs.sh`).

### Manual four-pass build (main reader only)

```bash
pdflatex main.tex
bibtex   main
pdflatex main.tex
pdflatex main.tex
```

Run these from the directory that contains `main.tex` (the repository root).
Auxiliary files will be created next to the sources unless you pass
`-output-directory` / use `latexmk` as above.

## Conventions

- **Bibliography**: citations in the main reader live in `references.bib`.
  Web resources use `@misc` entries with `howpublished = {\url{...}}` and an
  access-date `note`.
- **Figures**: TikZ diagrams live in `figures/*.tex` and are included via
  `\input{figures/<name>}` inside a `figure` environment with a caption and
  label.
- **Chapters**: one `\section` per chapter, no manual "Chapter N:"
  prefix in the heading (LaTeX auto-numbers). Subsections follow
  the template in Chapter 1. Cross-reference with
  `\label{sec:weekN-subject}` for the original chapters and
  `\label{sec:nn-subject}` for the neural-networks chapter,
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
