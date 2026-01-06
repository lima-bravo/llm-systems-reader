# Week 9 Lab — LLM Systems, Retrieval, and Evaluation

## Purpose

This lab accompanies **Week 9: LLM Systems — Retrieval, Tool Use, and Evaluation Harnesses**.

The goal is to shift perspective from models to complete systems, and to
understand where real-world failures occur.

---

## Contents

week09/
├── week09_lab_llm_systems_rag_eval.ipynb
└── README.md


---

## Prerequisites

- Python ≥ 3.9
- PyTorch ≥ 2.0
- NumPy

---

## What this lab does

### 1. Retrieval
- Builds a small external knowledge base
- Embeds and retrieves documents via similarity

### 2. Prompting
- Injects retrieved context into prompts
- Explores sensitivity to formatting and order

### 3. Tool abstraction
- Treats retrieval as a callable tool
- Separates decision from execution

### 4. Evaluation
- Compares base vs RAG-augmented behavior
- Highlights silent failure modes

---

## What to focus on

This lab is **not** about optimizing retrieval quality.

It *is* about:
- understanding interfaces and contracts,
- identifying where errors enter the system,
- designing evaluation that catches real failures.

---

## Reflection (required)

Answer briefly in the final notebook cell:

- Where did retrieval help?
- Where did it fail silently?
- What would you log in production?
- How would you design regression tests?

---

## Systems engineering perspective

Consider:
- traceability across components,
- fault isolation,
- human oversight loops.

These concerns dominate real deployments.

---

## Looking ahead

Week 10 concludes the course with **governance, risk, and future directions**:
- assurance cases,
- socio-technical impact,
- limits of current paradigms.

Week 9 is the capstone for technical system design.

weeks/
└── week09_llm_systems_rag_tools_evaluation.tex

labs/
└── week09/
    ├── week09_lab_llm_systems_rag_eval.ipynb
    └── README.md


┌──────────────┐
│   User /     │
│ Environment  │
└──────┬───────┘
       │ prompt / context
       ▼
┌─────────────────────┐
│  Application Layer  │
│  - UI / API         │
│  - Guardrails       │
│  - Prompt templates │
└──────┬──────────────┘
       │ structured request
       ▼
┌──────────────────────────────────┐
│         LLM SYSTEM CORE           │
│                                  │
│  ┌─────────────┐   ┌──────────┐  │
│  │ Retrieval / │   │  Tools   │  │
│  │ Memory (RAG)│   │ (APIs)   │  │
│  └──────┬──────┘   └────┬─────┘  │
│         │               │        │
│         ▼               ▼        │
│      ┌───────────────────────┐  │
│      │   Foundation Model     │  │
│      │  (pretrained + aligned)│  │
│      └───────────────────────┘  │
└──────────────┬───────────────────┘
               │ response
               ▼
┌──────────────────────┐
│ Monitoring & Logging │
│ - traces             │
│ - evals              │
│ - incidents          │
└──────────────────────┘

User
 │
 │ prompt
 ▼
Prompt Builder
 │   ┌─────────────┐
 │──▶│  Retriever  │──┐
 │   └─────────────┘  │
 │                    ▼
 │              Retrieved Context
 │                    │
 ▼                    │
LLM Inference ◀────────┘
 │
 │ tool call?
 ▼
Tool Executor ──▶ External System
 │
 ▼
LLM (final response)
 │
 ▼
User

