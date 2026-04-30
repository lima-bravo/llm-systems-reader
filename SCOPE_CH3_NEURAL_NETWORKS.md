# Scope memo — Chapter 3: Neural Networks

**Status:** draft for editorial review.
**Goal:** give the reader the neural-network primitives that Chapters 4 through 13 quietly assume, without expanding the book into a general deep-learning textbook.

## Audience and prerequisites

The Preface declares the prerequisite as "an undergraduate in a quantitative discipline — some calculus, some linear algebra, some probability." This chapter is written for a reader who has that baseline but who has *not* taken a deep-learning course. A reader who has — who can write down backprop on a whiteboard and pick GeLU over ReLU without thinking — is the reader the user wants to be able to skip this chapter entirely. We will signal that explicitly at the chapter's opening so readers can self-select.

## In scope

Topics the chapter will cover, in roughly the order they appear:

- **The neural network as a function class.** Affine layer, elementwise nonlinearity, composition into a multilayer perceptron (MLP). One-line acknowledgment of universal approximation, not a derivation.
- **Backpropagation.** Chain rule applied to a multi-layer composition. Forward / backward FLOP equivalence (the result Chapter 2 used without justification).
- **Activation functions.** Sigmoid and tanh and the vanishing-gradient origin story; ReLU and dead-neuron failures; GeLU as smoothed ReLU; GLU and SwiGLU as the gated variants modern Transformers actually use.
- **Weight initialization.** Xavier/Glorot and He init from a variance-preservation argument; the bridge to Chapter 5's `1/sqrt(d_k)` attention scaling.
- **Normalization.** BatchNorm (briefly, and why Transformers do not use it); LayerNorm derivation; RMSNorm as the simplification Llama and friends use.
- **Residual connections.** Identity-path stability; why depth becomes trainable; one-line nod to the ODE-limit interpretation.
- **The MLP block as a Transformer primitive.** Forward reference to Chapter 5: how the chapter's primitives compose into the FFN; why the FFN holds most of a Transformer's parameters; preview of pre-norm vs post-norm placement.

## Out of scope

Topics deliberately not covered, with rationale:

- **CNNs.** Not used in production LLMs; covered well in any deep-learning textbook.
- **RNNs and LSTMs.** Already covered as historical context in Chapter 5's prologue (Elman, Hochreiter–Schmidhuber, Sutskever–Vinyals–Le); no value in re-deriving here.
- **Dropout.** Not used at frontier-LLM scale; brief mention only if it serves the discussion of init or normalization.
- **BatchNorm derivation in depth.** Mentioned only to motivate why LayerNorm exists; the BN-specific machinery (running statistics, train/eval mode) is not load-bearing for LLMs.
- **Detailed optimization theory.** Adam, AdamW, scaling laws are Chapter 2's territory and stay there.
- **Optimization theory of deep nets.** NTK, mean-field, neural tangent kernel, edge-of-stability, lottery ticket hypothesis. Active research; not load-bearing for engineers.
- **Generative adversarial networks, VAEs, diffusion models.** Different model classes; not used by LLMs.
- **Hardware-level details** (kernel fusion, memory hierarchy specific to neural-net ops). Already in Chapter 7's territory.

## Section structure and page budget

Target total: **~22 pages** of body content, in line with Chapters 1–2's depth.

| Section | Approx. pages |
|---|---|
| Setting the Scene (Sagan-voiced prologue) | 2 |
| Learning Objectives + LLM Components Covered + Notation | 2 |
| §1 The neural network as a function class | 2 |
| §2 Backpropagation | 4 |
| §3 Activations | 3 |
| §4 Weight initialization | 2 |
| §5 Normalization | 2 |
| §6 Residual connections | 2 |
| §7 The MLP block as a Transformer primitive | 1 |
| Worked example A: 1-D regression (mechanics) | 2 |
| Worked example B: XOR via 2-layer MLP (necessity) | 2 |
| Proved vs Assumed + Bridges + Ledger + Takeaway | 2 |
| **Total** | **~26** |

These are budget targets, not contracts; sections can shift by ±1 page in drafting.

## Dependencies on prior chapters

The chapter relies on:

- **Chapter 1** for cross-entropy and the conditional-probability framing of the loss being optimized.
- **Chapter 2** for SGD and the optimization machinery; the neural network is now the concrete model class on which Chapter 2's gradient updates operate.

## What downstream chapters will draw from this one

Concrete handoffs the chapter must establish cleanly:

- **Chapter 4 (Tokenization & Embeddings)** will use the embedding lookup as a degenerate linear layer and rely on the matrix-multiplication framing.
- **Chapter 5 (Transformer)** will compose the FFN, residual connections, layer normalization, and the variance-preservation init argument that this chapter sets up. Chapter 5's `1/sqrt(d_k)` attention scaling is the same idea as the variance-preserving init derived here.
- **Chapter 7 (MoE)** treats the MLP block as the unit being routed; it needs the reader to already know what that block is.
- **Chapter 8 (Adaptation/LoRA)** inserts low-rank deltas into the linear layers introduced here.

## Editorial decisions for confirmation

A few choices worth your sign-off before drafting begins:

1. **Depth of backprop derivation.** Two reasonable depths: (a) compute the gradient for a 2-layer MLP by hand, then state the general pattern; or (b) write the general matrix-form chain-rule derivation directly, with the 2-layer case as the worked example. Recommendation: (a), because the audience is "no deep-learning background," and concrete-then-general is easier on the first read.
2. **Worked examples — two-step progression.** The chapter carries
   two worked examples in sequence, chosen so the second answers a
   question the first leaves open.

   - **Example A — 1-D regression (mechanics).** Fit a small MLP
     with two or three hidden units to a smooth function on a
     scalar input, e.g. $y = \sin(2x)$ on $x \in [-\pi, \pi]$, with
     one hidden layer of width 8 and a tanh or GeLU activation.
     Walk through one forward pass on a batch of four points, one
     backward pass with the gradients computed by hand, one SGD
     step at a stated learning rate, and the resulting parameter
     update. Plot the predicted function before and after. The
     example demonstrates the *machinery*: how layers compose, how
     the chain rule produces the gradient, how SGD moves
     parameters, why nothing here is mysterious. Everything fits in
     2D plots and a half-page numeric table. *Pedagogical role: see
     how the math actually flows, on a problem you can hold in
     your head.*

   - **Example B — XOR via a 2-layer MLP (necessity).** Apply the
     same machinery to the canonical Minsky–Papert problem: four
     points $(0,0), (0,1), (1,0), (1,1)$ with the XOR labels.
     First show that no single linear layer with a sigmoid output
     can fit them — this is the 1969 critique made arithmetic.
     Then add one hidden layer with two units and a nonlinear
     activation, and show that the two-dimensional decision
     boundary now bends through a region the linear model cannot
     reach. Walk one forward pass and one backprop step on a
     converged solution to confirm the geometry. *Pedagogical
     role: see why we need the machinery — depth and nonlinearity
     are not decorations, they are what lets the network represent
     functions a linear layer cannot.*

   The two examples together teach the reader to ask, of any
   neural-network design choice, both "does the math work" and
   "does the architecture have the capacity to represent what we
   need." The progression from regression to classification, and
   from sufficient capacity to insufficient capacity, mirrors the
   historical arc the chapter's prologue describes (Rosenblatt's
   trainable linear classifier, Minsky and Papert's necessity
   argument, the multilayer response that followed).
3. **Universal approximation.** Recommendation: one-paragraph acknowledgment, no derivation. "Sufficiently wide MLPs can approximate continuous functions arbitrarily well; this is necessary but not sufficient for the engineering question of whether SGD will find such an approximation." This keeps the focus on engineering, not on existence theorems.
4. **Historical lineage — named contributions.** The prologue anchors on
   the seminal papers that defined the modern neural-network primitives.
   Listed in chronological order, with the contribution each paper
   made:

   - **Frank Rosenblatt** (1958), *The Perceptron: A Probabilistic
     Model for Information Storage and Organization in the Brain*,
     Psychological Review. The first trainable linear classifier;
     introduced the perceptron unit and a learning rule.
   - **Marvin Minsky and Seymour Papert** (1969), *Perceptrons: An
     Introduction to Computational Geometry*, MIT Press. Proved
     that single-layer perceptrons cannot represent XOR; motivated
     the multilayer response and is partly responsible for the
     subsequent funding contraction.
   - **Paul Werbos** (1974), *Beyond Regression: New Tools for
     Prediction and Analysis in the Behavioral Sciences*, Harvard
     PhD thesis. The first full statement of backpropagation in a
     learning context; predates the better-known 1986 paper.
   - **David Rumelhart, Geoffrey Hinton, and Ronald Williams**
     (1986), *Learning Representations by Back-propagating Errors*,
     Nature. Brought backprop to wide attention and showed it
     could train multi-layer networks on non-trivial tasks.
   - **Yann LeCun et al.** (1989), *Backpropagation Applied to
     Handwritten Zip Code Recognition*, and the LeNet line. First
     large-scale demonstration of backprop on a real engineering
     problem; established convolutional architectures, which we
     mention only as historical context.
   - **Sepp Hochreiter and Jürgen Schmidhuber** (1997), *Long
     Short-Term Memory*, Neural Computation. Diagnosed the
     vanishing-gradient problem in deep recurrent networks and
     proposed the gated cell that solved it. (Brief mention; RNN
     details belong to Chapter 5's prologue.)
   - **Geoffrey Hinton, Simon Osindero, and Yee-Whye Teh** (2006),
     *A Fast Learning Algorithm for Deep Belief Nets*. The
     pre-training-then-fine-tune recipe that briefly made deep
     networks trainable before init and ReLU made it unnecessary.
   - **Xavier Glorot and Yoshua Bengio** (2010), *Understanding
     the Difficulty of Training Deep Feedforward Neural Networks*.
     Introduced the variance-preserving initialization
     (Xavier/Glorot init) that made depth tractable without
     pre-training.
   - **Vinod Nair and Geoffrey Hinton** (2010), *Rectified Linear
     Units Improve Restricted Boltzmann Machines*. The paper that
     made ReLU the default activation, supplanting sigmoid/tanh
     and removing one of the main vanishing-gradient bottlenecks.
   - **Alex Krizhevsky, Ilya Sutskever, and Geoffrey Hinton**
     (2012), *ImageNet Classification with Deep Convolutional
     Neural Networks* (AlexNet). The watershed empirical
     demonstration that deep networks at scale outperformed
     hand-engineered features. Named for context, not derived
     from.
   - **Sergey Ioffe and Christian Szegedy** (2015), *Batch
     Normalization*. The first widely adopted normalization layer;
     covered in this chapter mainly to motivate why Transformers
     use the alternative below.
   - **Kaiming He, Xiangyu Zhang, Shaoqing Ren, and Jian Sun**
     (2015), *Delving Deep into Rectifiers* (He init) and *Deep
     Residual Learning for Image Recognition* (ResNet). Two
     foundational results: the variance-preserving init for
     ReLU networks, and the residual connection that made depths
     beyond a hundred layers trainable.
   - **Jimmy Lei Ba, Jamie Ryan Kiros, and Geoffrey Hinton**
     (2016), *Layer Normalization*. The variant Transformers
     actually use, and the one Chapter 5 will derive in the
     attention context.
   - **Dan Hendrycks and Kevin Gimpel** (2016), *Gaussian Error
     Linear Units (GELUs)*. The smoothed activation now standard
     in BERT, GPT, and most of the modern Transformer family.
   - **Biao Zhang and Rico Sennrich** (2019), *Root Mean Square
     Layer Normalization*. The simplification (RMSNorm) used by
     Llama, Mistral, and many recent models.
   - **Noam Shazeer** (2020), *GLU Variants Improve Transformer*.
     SwiGLU and the gated activations now standard inside the
     Transformer's feed-forward block.

   The Sagan voice keeps the prologue calm and credit-giving
   rather than triumphant, and the chronology lets the reader see
   that the ``modern Transformer building blocks'' are a chain of
   incremental, named contributions over six decades, not a single
   leap.
5. **Math notation.** Recommendation: use `f_θ : R^d → R^k` for the network as a function, `h^{(ℓ)}` for the activations at layer `ℓ`, `W^{(ℓ)}, b^{(ℓ)}` for the linear-layer parameters, `φ` for the elementwise nonlinearity. This matches the conventions Chapter 2 already uses for parameters `θ` and is consistent with notation in Chapters 5 and 7. No conflicts with existing equation labels.

If this scope feels right, the next task is the existing-content survey (Task 2): a brief audit of where neural-network material currently leaks into other chapters, so we can decide what to consolidate into Chapter 3 and what to leave as cross-references.
