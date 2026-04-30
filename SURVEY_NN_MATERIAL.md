# Existing-content survey — neural-network material in chapters 1–12

**Status:** draft for editorial review.
**Purpose:** before drafting Chapter 3 on neural networks, audit
where neural-network primitives currently appear in the book and
decide, for each finding, what to do — *consolidate* into the new
chapter, *cross-reference* from where it currently sits, *leave in
place* unchanged, or *delete* as redundant once Chapter 3 lands.

## Headline

The book currently teaches the neural-network primitives **piecemeal
and on demand**: each chapter introduces just enough machinery to
explain its own subject. The densest concentrations are in Chapter 4
(Transformer), which carries the FFN, LayerNorm, RMSNorm, residual
connections, and pre-norm placement, and in Chapter 7 (Adaptation),
which carries a single mention of He init in the LoRA setup. There
is **no current chapter** in which the reader is told *what an MLP
is, what backprop is, why depth is trainable, or why these
particular activations and normalizers won*. Chapter 3 fills that
hole. The findings below show that almost everything currently in
place can stay where it is — the new chapter adds the foundation
underneath, and the existing chapters gain forward references back
to it.

## Findings, organised by primitive

For each primitive Chapter 3 will cover, what's already there:

### 1. The MLP / feed-forward block

- **CH4 §Feed-Forward Blocks** has the canonical form
  `FFN(x) = W₂ σ(W₁ x + b₁) + b₂` (Eq. week4-ffn-classic) plus
  SwiGLU (Eq. week4-swiglu). Treats the FFN at the level a
  Transformer needs: shapes, parameter count, FLOP cost, the
  key-value-memory interpretation. Assumes the reader already
  knows what a feed-forward network is.
- **CH6 §MoE** uses `FFN(x) = W₂ σ(W₁ x)` as the unit being routed.
- **CH7 §LoRA** mentions MLP up/down projections.
- **Recommendation:** *cross-reference*. CH4's FFN treatment is at
  the right depth for the Transformer chapter; the missing piece is
  the level *below* — what is a layer, what is composition, why two
  layers with a nonlinearity is the smallest non-trivial network.
  Chapter 3 introduces the MLP from scratch; CH4 changes one
  paragraph at the start of Feed-Forward Blocks to read "as
  introduced in Chapter 3, the FFN is a two-layer MLP applied
  position-wise."

### 2. Backpropagation and the chain rule

- **CH2 §How we got here (prologue)** mentions Werbos 1974, the
  Rumelhart-Hinton-Williams 1986 Nature paper, and states that
  backprop is "the chain rule of calculus" used to compute the
  gradient of a deep nonlinear function. No derivation.
- **CH2 §Gradient Clipping** mentions backprop in passing.
- **CH1 §Chain rule of probability** uses the *probability* chain
  rule for sequence factorisation; this is unrelated to the
  *calculus* chain rule used for backprop. The naming clash is
  worth a one-line clarification in CH3.
- **Recommendation:** *consolidate*. Backprop is acknowledged
  historically in CH2 but never derived. Chapter 3 owns the
  derivation. CH2's prologue can be lightly trimmed to point at
  CH3 instead of restating the historical lineage in detail; the
  derivation moves wholesale to CH3.

### 3. Activations (sigmoid, tanh, ReLU, GeLU, SwiGLU)

- **CH4 §Feed-Forward Blocks** mentions the activation `σ` started
  as ReLU and "has been superseded by smoother variants (GeLU,
  Swish/SiLU) for training stability." One sentence.
- **CH4 §SwiGLU** derives the SwiGLU expression.
- **CH8** uses `σ(·)` for the logistic sigmoid in the
  Bradley-Terry / DPO log-likelihood; this is the **same symbol but
  a different role** (statistical model link function vs. neural
  activation). Chapter 3 should fix the convention.
- **Recommendation:** *consolidate the historical/comparative
  treatment* (sigmoid → tanh → ReLU → GeLU → SwiGLU progression),
  *cross-reference* the SwiGLU derivation in CH4. CH4 keeps SwiGLU
  because the FLOP and parameter accounting belong with the
  Transformer block; CH3 explains *why* GeLU and SwiGLU dominate
  modern designs in the first place.

### 4. Weight initialization (Xavier, He, scaled)

- **CH7 §LoRA** has a single mention: "$A$ is initialised with a
  random Gaussian (typically scaled like He initialisation) and $B$
  is initialised to zero, so the initial product $BA = 0$ and the
  output is unperturbed at the start of training."
- **CH4 §Why √d_k?** derives the variance-preserving scale for
  attention scores (`1/√d_k` argument). This is the same
  variance-preservation idea that motivates Xavier and He init,
  but the chapter doesn't say so.
- **Recommendation:** *consolidate*. Chapter 3 owns the general
  variance-preservation argument and the Xavier/He derivations;
  CH4's `1/√d_k` argument gets a one-line nod back to Chapter 3.
  CH7 keeps the He-init reference but cross-references CH3 for the
  derivation.

### 5. Layer normalization, RMSNorm, BatchNorm

- **CH4 §LayerNorm and RMSNorm** has both definitions (Eq.
  week4-rmsnorm), with the per-token mean/std normalisation, the
  γ/β rescaling, the RMSNorm simplification, and the citation to
  Ba-Kiros-Hinton 2016 and Zhang-Sennrich 2019. No discussion of
  BatchNorm.
- **CH4 §Pre-Norm vs Post-Norm** has the placement argument and
  the Xiong et al. 2020 stability result.
- **CH2 §LR Schedules** mentions "normalization placement (pre-LN
  vs post-LN)" as a design knob; doesn't define LayerNorm.
- **Recommendation:** *cross-reference*. CH4's LayerNorm/RMSNorm
  derivation is at the right depth and sits naturally with the
  Transformer block. Chapter 3 should mention BatchNorm only
  briefly — enough to motivate why Transformers use the
  alternative — and then forward-reference CH4 for the LayerNorm
  derivation. The pre-norm-vs-post-norm placement argument also
  stays in CH4. The two chapters compose: CH3 says *what
  normalisation is and why it exists*; CH4 says *which variant the
  Transformer uses and where to place it*.

### 6. Residual connections / residual stream

- **CH4 §Pre-Norm Variant** uses the residual identity-path
  argument to explain why pre-norm is more stable.
- **CH4 §The Residual Stream** has the full residual-stream view
  (Elhage et al. 2021) — a `d`-dimensional vector per token, with
  each sublayer reading and writing.
- **Recommendation:** *consolidate the "depth becomes trainable"
  argument* into CH3 (this is the part that a reader needs before
  CH4); *cross-reference* the residual-stream interpretability
  framing back to CH4. CH3 explains why ResNet's identity path made
  100-layer networks trainable; CH4 then adds the
  Transformer-specific reading-and-writing interpretation.

### 7. Universal approximation

- **Not currently mentioned anywhere.** No chapter states or
  alludes to the universal-approximation theorem.
- **Recommendation:** *consolidate* into CH3 as a one-paragraph
  acknowledgment, per the scope memo's editorial decision (3).

### 8. Historical lineage (perceptron, Minsky-Papert, etc.)

- **CH2 prologue** has Werbos and Rumelhart-Hinton-Williams.
- **CH4 prologue** has the RNN / LSTM / encoder-decoder /
  attention / Transformer arc (Elman, Hochreiter-Schmidhuber,
  Sutskever-Vinyals-Le, Bahdanau-Cho-Bengio, Vaswani et al.).
- **Rosenblatt, Minsky-Papert, Glorot-Bengio, He et al., Ba et al.,
  Hendrycks-Gimpel, Shazeer 2020** are not mentioned anywhere in
  the book.
- **Recommendation:** *consolidate*. The 16 named contributions
  in the scope memo's editorial decision (4) all live in CH3. CH2
  and CH4's prologues already work for their respective subjects
  (optimisation history, sequence-modelling history); no change.

### 9. Hidden state / hidden layer

- **CH3 (Tokenization)** uses "Neural networks operate on $\R^d$"
  and the embedding-as-linear-layer framing.
- **CH4 prologue** uses "hidden state" in the RNN sense (Elman's
  network maintaining a hidden state); also uses it in the
  attention sense (encoder hidden states).
- **CH6, CH7** use "hidden state" casually without definition.
- **Recommendation:** *cross-reference*. The term "hidden state" is
  used loosely — sometimes meaning the activation at a layer,
  sometimes the RNN-style recurrent state. CH3 should pin down the
  feed-forward sense (`h^{(ℓ)}` for the activations at layer `ℓ`)
  in its notation block, and the existing chapters' usage will read
  consistently against that anchor.

## Items that don't need consolidation

Findings that look like neural-network material but should stay
where they are:

- **CH3 (Tokenization) §Embedding Layer is a Linear Map.** Frames
  the embedding as a linear projection from a one-hot simplex.
  Strictly correct and at the right level for the tokenization
  chapter. CH3-NN can mention "we'll see in the next chapter that
  the embedding lookup is a linear layer." No change needed here.
- **CH8 sigmoid** in Bradley-Terry. Different role (statistical
  link function). No change.
- **Unicode normalization** in CH3. Different sense of
  "normalization." No change.
- **CH7 quantization** discusses neural-network number formats
  (FP16, BF16, INT8, NF4) but not as a neural-network primitive
  per se — it's a deployment technique applied to *trained*
  weights. No change.

## What Chapter 3 introduces that no chapter currently has

Items the book is currently missing entirely; Chapter 3 is the
right home for each:

- The MLP as a function class (perceptron → multi-layer)
- The backpropagation derivation
- Forward / backward FLOP equivalence (currently used without
  justification in CH2 and CH4)
- The full progression of activations from sigmoid to SwiGLU,
  with the *reason* each newer one was preferred
- Xavier / He weight initialization and the
  variance-preservation argument they share with CH4's `1/√d_k`
- BatchNorm vs LayerNorm vs RMSNorm comparison (CH4 has only
  LayerNorm/RMSNorm)
- Residual connections and the identity-path stability argument
- Universal approximation as an acknowledgment

## Summary of edits to existing chapters

Once Chapter 3 lands, the existing chapters need only light edits:

| Chapter | Edit |
|---|---|
| CH2 prologue | Trim the historical mention of backprop; defer to Chapter 3. |
| CH4 §FFN | One-line forward reference to Chapter 3's MLP introduction. |
| CH4 §Why √d_k? | One-line nod to the same variance-preservation argument as Chapter 3's init derivation. |
| CH4 §LayerNorm | One-line forward reference to Chapter 3's normalization motivation. |
| CH4 §Pre-Norm | One-line nod to Chapter 3's residual-connection treatment. |
| CH7 §LoRA init | One-line forward reference to Chapter 3's He-init derivation. |

These are six one-line edits. None of them is structural; none
removes existing content; none changes a derivation. The new
chapter slots in cleanly under the existing material, and the
existing material gains pointers back rather than being rewritten.

## Open editorial decisions surfaced by the survey

1. **The naming clash on `σ`.** CH4 uses `σ` for the elementwise
   activation (sigmoid in the FFN context). CH8 uses `σ(·)` for
   the logistic sigmoid in the Bradley-Terry log-likelihood. CH4
   also uses `σ(x)` for the per-token *standard deviation* in
   LayerNorm. Chapter 3 will need to introduce `φ` (or some other
   neutral symbol) for the elementwise activation function, with
   a note that `σ` is reserved for the logistic sigmoid as a
   specific instance, and `σ(x)` for std deviation is local
   notation in the LayerNorm equation only. *Recommendation:*
   adopt `φ` in CH3 for activations generally; the existing
   chapters' use of `σ` for the logistic sigmoid stays, since
   that's the standard convention in those contexts.

2. **The "chain rule" naming clash.** CH1 uses "chain rule" for
   the *probability* chain rule (sequence factorisation). CH3-NN
   will use "chain rule" for the *calculus* chain rule (in
   backprop). Chapter 3's notation block should call out the
   distinction explicitly. *Recommendation:* one-line note in
   CH3's notation block.

3. **CH2 prologue trim.** The current CH2 prologue spends one
   paragraph on Werbos and Rumelhart-Hinton-Williams. Once CH3
   carries the full lineage, that paragraph in CH2 becomes a
   redundancy. *Recommendation:* trim to one sentence in CH2 that
   refers forward to CH3, and let CH3 carry the full credit-list.

If the survey is accepted, the next task (Task 3) is the
section-level outline with page budgets per section, drawn from
both this survey and the scope memo.
