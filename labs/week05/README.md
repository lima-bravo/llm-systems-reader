# Week 5 Lab — Pretraining and In-Context Learning

## Purpose

This lab accompanies **Week 5: Pretraining, GPT-style Models, and In-Context Learning**.

The goal is to understand how a model trained only on next-token prediction
can appear to learn from examples provided in a prompt.

---

## Contents

week05/
├── week05_lab_pretraining_incontext.ipynb
└── README.md


---

## Prerequisites

- Python ≥ 3.9
- PyTorch ≥ 2.0
- NumPy

---

## What this lab does

### 1. Pretraining
- Trains a tiny decoder-only language model
- Uses a simple character-level dataset for clarity

### 2. Prompting
- Feeds structured prompts to the trained model
- Observes continuation behavior

### 3. In-context learning
- Tests whether patterns provided in the prompt are followed
- Compares seen vs unseen prompt formats

---

## What to focus on

This lab is **not** about performance.

It *is* about:
- recognizing memorization,
- identifying genuine generalization,
- seeing how easily evaluation can mislead.

---

## Reflection (required)

Answer briefly in the final notebook cell:

- Where did the model memorize?
- What looked like in-context learning?
- How could a careless benchmark exaggerate capability?
- What system controls would you add before deployment?

---

## Systems engineering perspective

Consider:
- prompts as part of the system configuration,
- reproducibility of evaluations,
- risks of prompt injection and leakage.

These issues become critical at scale.

---

## Looking ahead

Week 6 will focus on **efficiency and scaling**:
- sparse models,
- Mixture-of-Experts,
- and why not all parameters are used all the time.

Week 5 is where LLM behavior becomes visible — study it carefully.


weeks/
└── week05_pretraining_incontext.tex

labs/
└── week05/
    ├── week05_lab_pretraining_incontext.ipynb
    └── README.md

