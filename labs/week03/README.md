# Week 3 Lab — Tokenization and Embeddings

## Purpose

This lab accompanies **Week 3: Tokenization and Embeddings — From Text to Vectors**.

The objective is to understand how text is transformed into vectors, and how
tokenization and embeddings shape everything a language model can and cannot do.

---

## Contents

week03/
├── week03_lab_tokenization_embeddings.ipynb
└── README.md

week03/
├── week03_lab_tokenization_embeddings.ipynb
└── README.md


---

## Prerequisites

- Python ≥ 3.9
- PyTorch ≥ 2.0
- NumPy

Optional:
- matplotlib (for plotting similarities)

---

## What this lab does

### 1. Tokenization
- Starts with naive word-level tokenization
- Highlights out-of-vocabulary and brittleness issues

### 2. Vocabulary construction
- Builds explicit token → ID mappings
- Makes vocabulary size and coverage visible

### 3. Embeddings
- Trains a small embedding model
- Inspects similarity structure in embedding space

---

## What to focus on

This lab is **not** about training quality.

It *is* about:
- how token boundaries change meaning,
- how similar words cluster geometrically,
- how representational choices constrain downstream reasoning.

---

## Reflection (required)

Answer briefly in the final notebook cell:

- Where did tokenization distort meaning?
- Which tokens became ``close'' in embedding space, and why?
- How would subword tokenization change the results?
- What system-level risks follow from these choices?

---

## Systems engineering perspective

Consider:
- Tokenizer compatibility as an interface contract
- Embedding drift as a versioning risk
- Prompt sensitivity caused by token boundaries

These are operational, not academic, concerns.

---

## Looking ahead

Week 4 introduces the **Transformer architecture**, where embeddings become the
objects that attention operates on.

Understanding this week is critical before moving on.


weeks/
└── week03_tokenization_embeddings.tex

labs/
└── week03/
    ├── week03_lab_tokenization_embeddings.ipynb
    └── README.md

