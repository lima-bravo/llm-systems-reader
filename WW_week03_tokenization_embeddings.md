# Why & what: Week 3 — Tokenization and embeddings

**Maps to:** `weeks/week03_tokenization_embeddings.tex`

## Gap

BPE merges, WordPiece, and the embedding matrix are easy to present as *procedures*. The *stakes* for systems—tokenizer as a versioned contract, invisible surface where silent drift becomes silent bugs—are the real “why.” The chapter touches this; a dedicated human bridge prevents “it’s just splitting text.”

## What this chapter is for

- **What:** A reversible (or at least spec’d) path from **Unicode text → token IDs → vectors** that the Transformer consumes.
- **Why:** The model has **no** access to characters or words after tokenization. Every evaluation, safety filter, and billing meter depends on the **same** tokenizer the trainer used.

## Suggested “stakes first” opening

> The neural network does not read English. It reads a sequence of **integer indices**; those indices come from a **deterministic** tokenizer. **Change the tokenizer, and you change the input distribution** even if the English sentence looks identical. This week’s core idea: **the tokenizer is part of the model** for every practical purpose—ship it, version it, and test it with the same discipline as weights.

## Why / what anchors

| Topic | **What** | **Why** |
|--------|----------|---------|
| Unicode normalization | Different byte sequences can “look” the same on screen. | **Why** identical-looking prompts can tokenize differently; **what** to standardize in production. |
| BPE / merges | Greedily grow a vocabulary of frequent substrings. | **What** you buy: OOV control and compact alphabets; **what** you pay: **boundary effects** and fragile prompts. |
| Vocabulary size | Tens of thousands of tokens typical. | Tradeoff: **larger** vocab → **fewer** tokens per sentence but **sparser** embedding rows; **smaller** vocab → **longer** sequences, more memory/time. |
| Special tokens & templates | BOS, EOS, chat format strings. | **What** the model *thinks* the task is: **format is content** in LLMs. |
| Embeddings as lookup + linear | One-hot times matrix. | The first **meaningful** continuous representation—sets up geometry for Week 4. |
| Tied I/O embeddings | Share input and softmax weights. | **Why** often done: **parameter and sample efficiency**; not a deep philosophical claim. |
| Positional info | Sinusoid / learned / RoPE (preview). | **What** the model is missing from bags of vectors: **order**. |
| Bias in embeddings | Co-occurrence statistics leak stereotypes. | **Why** “neutral ML” is false without data governance; *geometry reflects corpus*. |

## Suggested “failure modes in one breath” (box)

- **Token boundary attacks:** “bad” word split across merges → model sees a different id sequence than a human expects.
- **Version skew:** server A uses v2 tokenizer, server B v3 → *same* software version, *different* behavior.
- **Multilingual token inflation:** some languages get more tokens per character → **latency and cost** rise even if “quality” looks fine on English.

## Undergrad “minimum story”

- **Tokenization = the keyboard layout of the model.** If you swap keys on the keyboard, the typist (the Transformer) is the same, but the typed essay changes.

## Phrasing to connect to later weeks

> Embeddings are not “the meaning layer”; they are **convenient coordinates** in which attention can do cheap geometry. RAG and tools (Week 9) exist partly because these coordinates never promised **grounding in facts**.

## Revision suggestions

- A **before/after** with two real strings that differ only in an invisible character (NFC vs NFD) and tokenize to **different** lengths.
- A single sentence: **tokens ≠ words**; stop explaining model behavior in words when the *unit* is subwords.
