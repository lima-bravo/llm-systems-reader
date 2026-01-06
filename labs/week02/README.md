# Week 2 Lab — Optimization, Generalization, and Scaling Intuition

## Purpose

This lab accompanies **Week 2: Optimization, Generalization, and Scaling Intuition**.

The objective is to develop intuition for how optimization choices shape
training stability and generalization — a critical skill when reasoning about
large language models.

---

## Contents


---

## Prerequisites

Same environment as Week 1:
- Python ≥ 3.9
- PyTorch ≥ 2.0
- NumPy

---

## How to use this lab

This notebook is intentionally comparative.

You should:
1. Reuse or import the dataset and model from Week 1
2. Change **one variable at a time**:
   - optimizer (SGD vs AdamW)
   - learning rate
   - model size
3. Observe:
   - convergence speed
   - instability or divergence
   - train vs validation gap

---

## Suggested experiments

- Small model + high learning rate  
- Larger model + moderate learning rate  
- Same model, different optimizers  
- Same optimizer, different random seeds  

Keep notes as you go.

---

## Reflection (required)

Write short notes answering:
- When did training fail, and why?
- When did larger models generalize better?
- What does this suggest about LLM scaling?

Add these reflections to the final notebook cell.

---

## Systems engineering perspective

Consider:
- How would you detect silent training failures?
- What metrics would you alert on?
- How would you justify hyperparameter choices to stakeholders?

These questions will recur in later weeks when systems scale up.

---

## Looking ahead

Week 3 will focus on **representation learning and tokenization** — the interface
between raw text and neural computation.

Do not optimize prematurely; clarity beats performance.

