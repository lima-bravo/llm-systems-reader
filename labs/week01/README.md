# Week 1 Lab — Probabilistic Foundations for Next-Token Prediction

## Purpose

This lab accompanies **Week 1: Statistical Learning Foundations for Large Language Models**.

The goal is to reconnect core probabilistic learning concepts to *observable model behavior*, using a deliberately simple next-token prediction setup. This mirrors the training objective of modern LLMs, without the architectural complexity of Transformers.

You should come away with a concrete intuition for:
- what model probabilities mean (and do not mean),
- how confidence and entropy behave,
- why high-confidence errors are inevitable under maximum likelihood training,
- and how these properties matter for system design.

---

## Contents


---

## Prerequisites

- Python ≥ 3.9
- PyTorch ≥ 2.0
- NumPy

Optional (but helpful):
- matplotlib or seaborn (for plotting entropy / calibration curves)

---

## How to run

1. Create and activate a virtual environment (recommended):

```bash
python -m venv .venv
source .venv/bin/activate


pip install torch numpy
jupyter lab
week01_lab_probabilistic_foundations.ipynb

