# Why & what: Week 1 — Statistical learning foundations

**Maps to:** `weeks/week01_statistical_foundations.tex`

## Gap

The chapter rigorously defines the LLM as a conditional distribution, derives cross-entropy, and links calibration to reliability diagrams. The *human* bridge—why “next-token likelihood” is the *right* abduction for a whole industry, and what *mistake* you make if you treat logits as “confidence in being right”—can sit implicit behind the math.

## What this chapter is for

- **What:** A precise object-level answer to “What is an LLM, mathematically?”: a factored mass function over token sequences, trained by maximum likelihood on (context, next-token) pairs.
- **Why:** So downstream claims about “knowledge,” “memory,” and “reasoning” can be checked against the actual training target (predicting the next token as in the training distribution), not against folk psychology.

## Suggested “chapter promise” blurb (insert after learning objectives)

> Before any architecture, scaling law, or alignment recipe, the reader needs one grounded picture: a modern LLM is a machine that outputs a **probability mass function** over a finite vocabulary at every position, conditioned on everything to the left. This week’s goal is to make that picture operational—how the loss is computed, what it optimizes, what it does *not* optimize, and how to read probabilistic outputs without confusing **being probable** with **being true** or **being calibrated**.

## Why / what anchors by subsection theme

| Theme | **What** (plain language) | **Why** (purpose) |
|--------|----------------------------|-------------------|
| Chain rule / left-to-right | The joint over a sentence factorizes; the model only implements the conditionals. | Explains *what is being memorized* as compressing regularities in text, not “facts” in a database. |
| Cross-entropy / KL | Training nudges predicted probabilities toward empirical frequencies. | Clarifies the moral: **the model is scored on predicting text, not on understanding the world**. |
| Softmax invariance | Adding a constant to all logits leaves probabilities unchanged. | Stops over-reading raw logit scale; justifies numerically stable `logsumexp` as engineering, not “extra math.” |
| Perplexity | Exp of average NLL: “effective branching factor.” | Gives intuition: lower perplexity = fewer viable continuations in distribution; not “smarter” in a normative sense. |
| Calibration | Match between stated probability and long-run frequency of events. | Separates *accuracy* from *honesty of probabilities*; required for any threshold-based decision policy. |
| Scoring rules | Log score rewards sharp, correct forecasts. | **Why** log-loss: it is a proper score—*what* you should optimize if you want forecasts that are incentivized to match beliefs. |

## Suggested wording: three persistent confusions (call out in a callout box)

1. **Probability vs correctness:** “High \(P(\text{token} \mid \text{context})\) means the model assigns mass like the training process would—not that the token is *factually* correct.”
2. **Confidence vs probability:** “Users hear ‘I’m 90% sure’; the model may mean ‘this continuation is typical.’ Typicality is not certification.”
3. **Good calibration on one task** does not transfer automatically under shift; *what* the calibration set represents must be said aloud.

## Undergrad “minimum viable story” (no heavy algebra)

- An LLM is a **next-token guesser** trained on huge text. If it is **well-calibrated** on a task, you can use its numbers in decision rules. If not, the numbers are still useful for **ranking** or **sampling**, not for **governance** without recalibration.

## Concrete phrasing to ground “failure modes from the loss”

> Hallucination, sycophancy, and overconfident false statements are *compatible* with a model that is doing well on next-token prediction: the objective rewards plausible language, and plausibility ≠ truth. That single sentence is the license for the rest of the book’s alignment and RAG content.

## Revision suggestions

- Add a 6–8 sentence “**Can I skip the proofs?**” path: the emotional core is the three-way distinction probability / confidence / correctness, plus one worked numeric softmax + one calibration interpretation.
- After ECE, one sentence: **what policy error** ECE is meant to prevent (e.g. thresholding at 0.9 when the event only happens 60% of the time).
