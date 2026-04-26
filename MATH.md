# Math Refresher Authoring Standard

This document defines the required style and structure for the `math_refresher` chapters.

## Purpose

The refresher exists to help readers who studied undergraduate math in the past but need guided recall now.  
The goal is memory rekindling and intuition building, not proving theorems from scratch.

## Reader Assumption

- Reader has prior undergraduate exposure.
- Reader may have forgotten key constructs, notation, and reasoning chains.
- Writing must support recovery of understanding without intimidation.

## Core Writing Rules

- Choose verbosity over brevity when explaining reasoning chains.
- Do not punish forgetting; guide gently and explicitly.
- Explain every mathematical construct in context:
  - what it is,
  - why this chapter needs it,
  - how it contributes to the chapter goal.
- Introduce symbols before use and define notation explicitly.
- Avoid high-level claims without the chain of insights that makes them meaningful.

## Required Chapter Structure (per `math_weekXX.tex`)

1. `Setting the Scene`
   - Explain what math is used in this week.
   - Explain why that math is needed for this chapter.
   - Include concise historical development:
     - key contributors/body of work,
     - critical insights,
     - how those insights lead to the current chapter’s methods.

2. `Notation Introduced in This Chapter`
   - List all symbols used in formulas.
   - Give plain-language meaning for each symbol.

3. `What You Need To Recall Precisely`
   - Detailed reminder-level explanations of foundational results.
   - Show how each theorem/identity builds on previous constructs.
   - No full formal proofs required.

4. `How These Results Build on Each Other`
   - Explicit reasoning chain as ordered steps.
   - Must connect definitions -> identities -> objective -> interpretation.

5. `Reminder Glossary (Term by Term)`
   - Define each key term (example: entropy, KL divergence, logits, calibration).
   - Keep definitions operational and chapter-relevant.

6. `Worked Example`
   - Use a worthwhile, non-toy example.
   - Walk through the reasoning chain, not only final arithmetic.
   - Include practical interpretation and action implications.

7. `Intuition Checkpoints`
   - Common misunderstanding patterns and how to avoid them.

8. `References and What To Use Them For`
   - Include references and map each one to covered topics.
   - References should support targeted refresh, not generic bibliography dump.

## Cross-Chapter Rules

- If later chapters reuse earlier math, include pointers instead of full duplication.
- Keep symbol semantics consistent across weeks (same symbol, same meaning unless explicitly redefined).
- When reusing a construct from prior weeks, briefly remind intent before using it.

## Tone and Voice

- Match `VOICE.md` guidance: clear, respectful, precise, and intuition-oriented.
- Maintain inclusive guidance tone.
- Prioritize clarity and cognitive support over rhetorical compression.
