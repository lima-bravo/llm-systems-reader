# Week 6 Lab — Efficiency, Scaling, and Mixture-of-Experts

## Purpose

This lab accompanies **Week 6: Efficiency, Scaling, and Mixture-of-Experts**.

The goal is to understand why modern LLMs rely on conditional computation
and what new systems challenges this introduces.

---

## Contents

week06/
├── week06_lab_efficiency_moe.ipynb
└── README.md


---

## Prerequisites

- Python ≥ 3.9
- PyTorch ≥ 2.0
- NumPy

---

## What this lab does

### 1. Dense baseline
- Uses a standard feed-forward block
- Serves as a compute reference point

### 2. Mixture-of-Experts
- Implements a tiny routing network
- Activates only a subset of experts per input

### 3. Inspection
- Routing distributions
- Load imbalance
- Output variability

---

## What to focus on

This lab is **not** about maximizing accuracy.

It *is* about:
- understanding compute–capacity tradeoffs,
- identifying new failure modes,
- thinking operationally about scalability.

---

## Reflection (required)

Answer briefly in the final notebook cell:

- Why does MoE enable scaling?
- What new risks appear compared to dense models?
- What monitoring would you require in production?

---

## Systems engineering perspective

Consider:
- routing as a control plane,
- experts as independently failing components,
- latency tails caused by load imbalance.

These dominate real-world deployments.

---

## Looking ahead

Week 7 focuses on **model adaptation and deployment realism**:
- LoRA,
- quantization,
- and why most models are never fully fine-tuned.

Week 6 marks the transition from theory to industrial practice.


weeks/
└── week06_efficiency_scaling_moe.tex

labs/
└── week06/
    ├── week06_lab_efficiency_moe.ipynb
    └── README.md

