# Week 8 Lab — Alignment, Instruction Tuning, and Preference Optimization

## Purpose

This lab accompanies **Week 8: Alignment, Instruction Tuning, and Preference Optimization**.

The goal is to understand how LLM behavior is shaped after pretraining, and what
new risks and tradeoffs alignment introduces.

---

## Contents

week08/
├── week08_lab_alignment_preference.ipynb
└── README.md


---

## Prerequisites

- Python ≥ 3.9
- PyTorch ≥ 2.0
- NumPy

---

## What this lab does

### 1. Baseline probing
- Tests instruction following
- Observes tone, verbosity, refusal

### 2. Instruction tuning
- Fine-tunes on small instruction–response pairs
- Observes behavioral shifts

### 3. Preference optimization
- Constructs simple preference data
- Demonstrates preference-based losses

---

## What to focus on

This lab is **not** about correctness.

It *is* about:
- understanding what alignment actually changes,
- seeing how values enter the system,
- identifying new failure modes.

---

## Reflection (required)

Answer briefly in the final notebook cell:

- What changed after alignment?
- What stayed the same?
- What risks does alignment introduce?
- How would you communicate limitations to users?

---

## Systems engineering perspective

Consider:
- alignment as a policy layer,
- auditing and governance needs,
- separation of capability and control.

These dominate responsible deployment.

---

## Looking ahead

Week 9 focuses on **LLM systems and retrieval**:
- RAG,
- tool use,
- evaluation harnesses.

Week 8 completes the *model-centric* part of the course.


weeks/
└── week08_alignment_preference_optimization.tex

labs/
└── week08/
    ├── week08_lab_alignment_preference.ipynb
    └── README.md

