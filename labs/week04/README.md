# Week 4 Lab — The Transformer Block

## Purpose

This lab accompanies **Week 4: The Transformer — Attention as the Core Computational Primitive**.

The objective is to demystify the Transformer by building its core components
explicitly and inspecting their behavior.

---

## Contents

week04/
├── week04_lab_transformer_blocks.ipynb
└── README.md


---

## Prerequisites

- Python ≥ 3.9
- PyTorch ≥ 2.0
- NumPy

---

## What this lab does

### 1. Self-attention
- Implements scaled dot-product attention
- Visualizes attention matrices
- Verifies masking behavior

### 2. Transformer block
- Adds residual connections
- Adds layer normalization
- Adds feed-forward (MLP) block

### 3. Inspection
- Tensor shapes at each stage
- Sensitivity to input perturbations
- Attention pattern interpretation (with caution)

---

## What to focus on

This lab is **not** about training a full language model.

It *is* about:
- understanding data flow through the architecture,
- seeing how information mixes across tokens,
- appreciating why this architecture scales.

---

## Reflection (required)

Answer briefly in the final notebook cell:

- What does attention actually compute?
- Where does positional information enter?
- Why are residual connections essential?
- What would break if masking were incorrect?

---

## Systems engineering perspective

Consider:
- Attention’s $O(T^2)$ scaling implications
- Memory pressure at long context lengths
- Debugging failures caused by subtle masking bugs

These issues dominate real LLM deployments.

---

## Looking ahead

Week 5 moves from architecture to **pretraining at scale**:
- GPT-style models
- in-context learning
- evaluation pitfalls

Week 4 is foundational — take your time here.


weeks/
└── week04_transformer_architecture.tex

labs/
└── week04/
    ├── week04_lab_transformer_blocks.ipynb
    └── README.md

