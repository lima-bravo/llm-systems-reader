# A Non-Technical Guide to LLM Engineering

A companion to *Large Language Models as Engineered Systems*. This
guide is for the educated reader who wants to understand how
modern Large Language Models actually work, where their building
blocks came from, and why they fail in the particular ways they
do, but who has no calculus, no linear algebra, and no probability
beyond the intuition of weather forecasts and dice.

The guide carries the same chapter ordering and the same Carl-Sagan
voice as the parent reader, but it strips every formula and replaces
every derivation with intuition, history, and the engineering
trade-offs a non-technical reader needs to reason about LLM products
and their failure modes.

## Building the PDF

```bash
cd non_technical_guide
latexmk -pdf non_technical_guide.tex
```

or with a single direct call:

```bash
pdflatex non_technical_guide.tex
pdflatex non_technical_guide.tex
```

Two passes are needed for the table of contents to settle. No
bibliography pass is required: historical claims in this guide
are attributed inline by name, date, and venue, with the
canonical citations available in the parent reader's
`references.bib` for the reader who wants to dig further.

## Layout

```
non_technical_guide/
├── STRUCTURE.md                       Master plan + cohesion ledger.
├── preamble.tex                       Minimal preamble; no math.
├── non_technical_guide.tex            Top-level document.
├── chapter00_preface.tex              Letter to the curious reader.
├── chapter01_predicting_next_word.tex
├── chapter02_learning_from_mistakes.tex
├── chapter03_neural_networks.tex
├── chapter04_letters_to_vectors.tex
├── chapter05_attention.tex
├── chapter06_pretraining_gpt.tex
├── chapter07_scaling_efficiency.tex
├── chapter08_adapting_giant_models.tex
├── chapter09_teaching_manners.tex
├── chapter10_memory_the_model_lacks.tex
├── chapter11_trust_governance.tex
├── chapter12_apis_agents_mcp.tex
└── chapter13_map_of_errors.tex
```

## Reading order

The chapters can be read in any order, but they were written to be
read front to back. Each chapter ends with a *Bridges* paragraph
that lists which chapters depend on it and which chapters its
own arguments depend on. A reader who knows part of the material
can use that paragraph to skip in safely.

## Contributing

Before drafting or editing a chapter, read `STRUCTURE.md`. It is
the single source of truth for the guide's scope, voice, and
cross-chapter promises. Voice guardrails are inherited from
`../VOICE.md` in the parent reader.
