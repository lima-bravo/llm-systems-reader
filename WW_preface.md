# Why & what: Preface and book frame

**Maps to:** `main.tex` (Preface, reading order, dependencies).

## Gap

The preface states the audience (strong math/CS) and the four ingredients (probabilistic modeling, optimization, systems, human factors). The *motivation* for mixing them—what problem this synthesis solves for a reader—is easy to under-specify. A mathematically strong reader can still miss *why* sociotechnical framing belongs in the same volume as cross-entropy.

## What this part of the book is for

- **What:** A single map of LLMs as *engineered systems* whose failures are as often about deployment, data, and humans as about wrong gradients.
- **Why:** Without that map, “fix the model” becomes the default move when “fix the interface / policy / eval / retrieval” is correct.

## Suggested human-centric opener (prose you can adapt)

> This reader treats a large language model as one component inside a system that has interfaces, costs, failure modes, and accountabilities. The math tells you what the model is *fit to do*; the rest tells you what you can *ask it to do safely* in a product. The point of combining statistics, optimization, and human factors in one book is not breadth for its own sake—it is to stop mistaking a distribution fit for a specification of behavior.

## Bridge sentences to add near the dependency figure

- **Why the graph exists in plain terms:** “The arrows are not ‘difficulty’; they are ‘you will reuse the vocabulary and assumptions introduced here.’ Skipping a prerequisite chapter is fine if you already carry that vocabulary—but then you are responsible for your own dictionary.”
- **What success looks like for a reader:** “You can look at a deployment diagram and name which risks come from the statistical object (miscalibration, spurious correlation), which from training (data contamination), which from the stack (RAG freshness), and which from governance (missing audit trail).”

## Undergrad-friendly grounding

- **System vs model:** A model is a function + weights; a system is model + tokenizer + API + policy + people who operate it.
- **Why ‘socio-technical’ isn’t a buzzword:** It marks *where* responsibility sits when no single layer has a full proof of correctness.

## Tightening checklist

- [ ] One short paragraph that answers: “If I only read one chapter, which and why?” (Even if the answer is “Week 1 + Week 9,” say so.)
- [ ] One sentence: who is *not* the audience (e.g. prompt-only users with no code) to set expectations.
