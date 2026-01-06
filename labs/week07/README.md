# Week 7 Lab — Model Adaptation, LoRA, and Quantization

## Purpose

This lab accompanies **Week 7: Model Adaptation, LoRA, Quantization, and Deployment Reality**.

The goal is to understand how LLMs are adapted in practice, and why full fine-tuning
is usually avoided in production systems.

---

## Contents

week07/
├── week07_lab_adaptation_lora_quantization.ipynb
└── README.md


---

## Prerequisites

- Python ≥ 3.9
- PyTorch ≥ 2.0
- NumPy

---

## What this lab does

### 1. Baseline model
- Uses a small pretrained or previously trained model
- Freezes base parameters

### 2. LoRA adaptation
- Injects low-rank adapters into linear layers
- Trains only adapter parameters

### 3. Comparison
- Parameter counts
- Training stability
- Overfitting behavior

### 4. Quantization (optional)
- Casts weights to lower precision
- Inspects memory and output drift

---

## What to focus on

This lab is **not** about achieving high accuracy.

It *is* about:
- understanding why PEFT dominates real deployments,
- seeing how small changes alter behavior,
- recognizing validation and rollback challenges.

---

## Reflection (required)

Answer briefly in the final notebook cell:

- Why is LoRA preferred over full fine-tuning?
- What risks does quantization introduce?
- How would you validate and deploy an adapted model?

---

## Systems engineering perspective

Consider:
- adapters as configuration artifacts,
- version control for behavioral changes,
- separation of base model and task-specific logic.

These concerns dominate production AI systems.

---

## Looking ahead

Week 8 will focus on **alignment and post-training**:
- instruction tuning,
- preference optimization,
- safety shaping.

Week 7 completes the journey from model to product.

weeks/
└── week07_adaptation_lora_quantization.tex

labs/
└── week07/
    ├── week07_lab_adaptation_lora_quantization.ipynb
    └── README.md

