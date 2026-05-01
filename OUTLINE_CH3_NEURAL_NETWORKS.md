# Outline — Chapter 3: Neural Networks

**Status:** draft for editorial review.
**Inputs:** `SCOPE_CH3_NEURAL_NETWORKS.md`, `SURVEY_NN_MATERIAL.md`.
**Purpose:** a section-by-section blueprint detailed enough that a
drafter can write the chapter from this outline plus the scope memo
without further planning.

## Chapter shape at a glance

```
Setting the Scene .................. 2 pages
Learning Objectives ................ 0.5 page
LLM Components Covered ............. 0.5 page
Notation and Standing Assumptions .. 1 page
§1 The Neural Network as a Function Class ... 2 pages
§2 Backpropagation ........................... 4 pages
§3 Activations ............................... 3 pages
§4 Weight Initialization ..................... 2 pages
§5 Normalization ............................. 2 pages
§6 Residual Connections ...................... 2 pages
§7 The MLP Block as a Transformer Primitive .. 1 page
Worked Example A: 1-D Regression ............. 2 pages
Worked Example B: XOR via 2-layer MLP ........ 2 pages
Proved vs Assumed ............................ 0.5 page
Connections to Earlier and Later Chapters .... 0.5 page
Bridges to Other Chapters .................... 0.5 page
Derivation Ledger ............................ 0.5 page
Takeaway ..................................... 0.5 page
                                         Total: ~26 pages
```

## Setting the Scene (2 pages, Sagan voice)

Four-beat structure, matching the other chapters:

- **The problem.** Open on a concrete scene: a reader who has
  followed Chapter 1 (cross-entropy) and Chapter 2 (SGD) and is
  about to meet the Transformer in Chapter 4. They have the
  *loss*, they have the *optimizer*, but they do not yet have the
  *function class* that the optimizer is updating. The chapter
  introduces that function class.
- **How we got here.** Chronological lineage anchored on the
  16 named contributions from the scope memo. Walk: Rosenblatt
  1958 → Minsky-Papert 1969 → Werbos 1974 → Rumelhart-Hinton-
  Williams 1986 → LeCun 1989 → Hochreiter-Schmidhuber 1997 →
  Hinton-Osindero-Teh 2006 → Glorot-Bengio 2010 → Nair-Hinton 2010
  → Krizhevsky-Sutskever-Hinton 2012 → Ioffe-Szegedy 2015 →
  He et al. 2015 (init *and* ResNet) → Ba-Kiros-Hinton 2016 →
  Hendrycks-Gimpel 2016 → Zhang-Sennrich 2019 → Shazeer 2020.
- **Where we stand.** A modern neural network used inside an LLM
  is a stack of differentiable transformations alternating linear
  layers with nonlinear activations, trained by gradient descent
  via backpropagation, made trainable at depth by careful
  initialization, normalization, and residual connections. The
  chapter's job is to put each of those primitives in place
  before Chapter 4 composes them into a Transformer.
- **What goes wrong.** Vanishing and exploding gradients,
  activation saturation, dead neurons, bad init that prevents
  training from starting, the gap between *expressive* and
  *trainable*. Reader who has skimmed this list once is prepared
  for the chapter's mechanism-then-failure-mode rhythm.

The opening paragraph should also signal explicitly: *if you have
taken a deep-learning course, you can skim this chapter and skip
forward; the rest of the book uses the primitives introduced
here without re-deriving them.*

## Learning Objectives (0.5 page)

By the end of this chapter, the reader should be able to:

- Define a multilayer perceptron as a composition of affine layers
  and elementwise nonlinearities; name the universal-approximation
  result and its limits.
- Derive backpropagation by applying the calculus chain rule to a
  multi-layer composition; state the forward / backward FLOP
  equivalence that Chapters 2 and 4 use without proof.
- Pick an activation function (sigmoid, tanh, ReLU, GeLU, SwiGLU)
  given task, depth, and stability constraints.
- Initialise the weights of a feed-forward network using Xavier or
  He, justify the variance-preservation argument, and connect it
  to the `1/√d_k` scaling used in Chapter 4.
- Distinguish BatchNorm, LayerNorm, and RMSNorm; explain why
  Transformers use the latter two and not the first.
- Explain residual connections as identity-path stability and
  state why depth becomes trainable with them.
- Identify the MLP block as the foundational primitive that
  Chapter 4 composes into the Transformer's feed-forward
  sublayer.

## LLM Components Covered (0.5 page)

**Foundational primitives**
- Multilayer perceptron (MLP)
- Backpropagation
- Activation functions (sigmoid, tanh, ReLU, GeLU, GLU, SwiGLU)
- Weight initialisation (Xavier/Glorot, He/Kaiming)
- Normalization layers (BatchNorm overview, LayerNorm, RMSNorm)
- Residual / skip connections

**Forward references**
- Chapter 4: FFN, pre-norm, residual stream
- Chapter 7: LoRA's low-rank deltas to linear layers
- Chapter 8: σ for the logistic sigmoid in Bradley-Terry

## Notation and Standing Assumptions (1 page)

Notation block to establish, with naming-clash callouts:

- $f_\theta : \R^{d_{\rm in}} \to \R^{d_{\rm out}}$ — the network as
  a function with parameter vector $\theta$.
- $L$ — number of layers; $\ell \in \{1,\dots,L\}$ — layer index.
- $h^{(\ell)} \in \R^{d_\ell}$ — activations at layer $\ell$, with
  $h^{(0)} = x$ the input and $h^{(L)} = f_\theta(x)$ the output.
- $W^{(\ell)} \in \R^{d_\ell \times d_{\ell-1}}$, $b^{(\ell)} \in
  \R^{d_\ell}$ — linear-layer parameters.
- $\varphi : \R \to \R$ — elementwise activation function (applied
  componentwise).
- $\mathcal{L}(\theta)$ — scalar loss being minimised; from CH1
  this is typically cross-entropy under the empirical distribution.

**Naming clash callouts**:

- *On `σ` vs `φ`.* This chapter uses `φ` for the elementwise
  activation function (a generic placeholder for ReLU, GeLU,
  etc.), and reserves `σ` for the specific logistic sigmoid
  $σ(z) = (1 + e^{-z})^{-1}$ used as one particular activation.
  Chapter 4 also writes `σ` for the FFN activation; that is the
  specific-to-context use. Chapter 8 uses `σ(\cdot)` in the
  Bradley-Terry log-likelihood; that is the same logistic
  sigmoid. Chapter 4 additionally writes `σ(x)` for the per-token
  standard deviation in the LayerNorm equation; that is local
  notation.
- *On "chain rule".* Chapter 1 used "chain rule" for the
  *probability* chain rule that factorises a joint distribution
  over a sequence into conditionals. This chapter uses "chain
  rule" for the *calculus* chain rule that propagates gradients
  through a composition of differentiable functions. The two are
  different theorems; we will be explicit at every use.

**Standing assumptions**:

- (A3.1) All layers are differentiable almost everywhere; ReLU's
  non-differentiability at $z=0$ is handled by convention
  ($\varphi'(0) := 0$).
- (A3.2) Inputs are real-valued and finite. The network is
  evaluated and trained in IEEE-754 floating-point (fp32 or bf16
  per Chapter 2's mixed-precision recipe).
- (A3.3) The loss $\mathcal{L}$ is the empirical cross-entropy
  from Chapter 1, averaged over a minibatch.

## §1 The Neural Network as a Function Class (2 pages)

Subsections:

- **The perceptron.** Rosenblatt 1958. Single linear threshold
  unit, learning rule. Concrete: 2-input perceptron, decision
  boundary as a line in $\R^2$.
- **The Minsky-Papert observation.** XOR cannot be represented
  by a single linear threshold unit. State the result;
  geometric intuition (no single line separates the four XOR
  points).
- **The multilayer response.** Adding a hidden layer of
  nonlinear units gives a function class that *can* represent
  XOR. Formal statement: an MLP is the composition
  $f_\theta(x) = h^{(L)}$ where $h^{(\ell)} = \varphi(W^{(\ell)} h^{(\ell-1)} + b^{(\ell)})$.
- **Universal approximation, in one paragraph.** Cybenko 1989 /
  Hornik 1991: an MLP with one sufficiently wide hidden layer
  and a non-polynomial activation can approximate any
  continuous function on a compact set arbitrarily closely.
  *Caveat:* this is an existence theorem about *representability*;
  it says nothing about whether SGD will *find* such a
  representation, nor about the width required.
- **What we will and will not derive.** The chapter's job is to
  give the reader the operational machinery — backprop,
  activations, init, normalization, residuals — that makes
  trainable depth a reality. Existence theorems are
  acknowledged; trainability is the working subject.

Equations introduced: composition form of $f_\theta$.
References: Rosenblatt 1958, Minsky-Papert 1969, Cybenko 1989,
Hornik 1991.

## §2 Backpropagation (4 pages)

Subsections:

- **The problem.** Given $\mathcal{L}(\theta)$ as a composition
  through $L$ layers, we need $\nabla_\theta \mathcal{L}$ to run
  SGD (Chapter 2). Direct numerical differentiation is
  $O(P^2)$ in parameter count; backprop computes it in $O(P)$
  by reusing intermediates.
- **Chain-rule prerequisite.** One paragraph rehearsing the
  calculus chain rule, with the explicit naming-clash callout
  to the probability chain rule of Chapter 1.
- **Two-layer derivation, by hand.** Concrete:
  $f_\theta(x) = W^{(2)} \varphi(W^{(1)} x + b^{(1)}) + b^{(2)}$
  with scalar loss $\mathcal{L}$. Compute
  $\partial \mathcal{L} / \partial W^{(2)}$,
  $\partial \mathcal{L} / \partial b^{(2)}$,
  $\partial \mathcal{L} / \partial W^{(1)}$,
  $\partial \mathcal{L} / \partial b^{(1)}$ step by step. Show
  that the same intermediate $\delta^{(\ell)}$ — the gradient of
  the loss w.r.t.\ the layer's pre-activation — appears in both
  the $W^{(\ell)}$ and $b^{(\ell)}$ updates and in the recursion
  for $\delta^{(\ell-1)}$.
- **General multi-layer pattern.** State the recursion:
  $$
  \delta^{(L)} = \nabla_{h^{(L)}} \mathcal{L}, \qquad
  \delta^{(\ell-1)} = \bigl(W^{(\ell)\top} \delta^{(\ell)}\bigr) \odot \varphi'(z^{(\ell-1)}),
  $$
  with $z^{(\ell)} = W^{(\ell)} h^{(\ell-1)} + b^{(\ell)}$ the
  pre-activations. Parameter gradients then read
  $\partial \mathcal{L} / \partial W^{(\ell)} = \delta^{(\ell)} h^{(\ell-1)\top}$,
  $\partial \mathcal{L} / \partial b^{(\ell)} = \delta^{(\ell)}$.
- **Forward / backward FLOP equivalence.** The backward pass
  visits each parameter once, just like the forward pass. To a
  constant factor, the backward pass costs the same as the
  forward pass. *This is the result Chapter 2 used without
  justification when stating the `6ND` training-FLOP rule*;
  this section provides the justification.

Equations introduced: $\delta$-recursion, parameter-gradient
formulas, FLOP-equivalence statement.
References: Werbos 1974, Rumelhart-Hinton-Williams 1986.

## §3 Activations (3 pages)

Subsections:

- **Why we need nonlinearity at all.** A composition of
  affine layers without a nonlinearity is itself an affine
  function (proof by inspection: $W^{(2)}(W^{(1)} x + b^{(1)}) + b^{(2)} = W^{(2)} W^{(1)} x + (W^{(2)} b^{(1)} + b^{(2)})$).
  Depth without nonlinearity buys nothing.
- **Sigmoid and tanh: the vanishing-gradient origin story.**
  Definitions, derivatives, the saturation problem at large
  $|z|$ (derivative $\to 0$, gradient signal disappears in
  deep networks).
- **ReLU: the breakthrough.** Definition $\varphi(z) = \max(0,z)$,
  derivative is 1 for $z > 0$ and 0 for $z < 0$. Solves the
  vanishing-gradient problem in the positive half-plane.
  Failure mode: the *dead-neuron* problem (a neuron whose
  pre-activation is always negative receives zero gradient
  forever).
- **GeLU: smoothed ReLU.** Definition
  $\varphi_{\rm GeLU}(z) = z \cdot \Phi(z)$ where $\Phi$ is the
  standard normal CDF; equivalent approximation
  $z \cdot \frac{1}{2}(1 + \tanh(\sqrt{2/\pi}(z + 0.044715 z^3)))$.
  Continuous derivative everywhere; no dead-neuron region.
  The default in BERT, GPT-2/3/4, and most modern decoders.
- **GLU and SwiGLU as gated variants (preview, cross-ref CH4).**
  One paragraph introducing the gated form
  $\varphi(x) = (W_g x) \odot \mathrm{Swish}(W_u x)$ used
  inside the Transformer FFN, with the page-flip pointer to
  Chapter 4 for the parameter-count and FLOP discussion.
- **A practitioner's table.** ReLU for image work, GeLU for
  language, SwiGLU for current Transformers; sigmoid and tanh
  retained for output layers (binary classification, gating)
  and historical contexts.

Equations introduced: each activation's forward and derivative.
References: Nair-Hinton 2010, Hendrycks-Gimpel 2016, Shazeer 2020.

## §4 Weight Initialization (2 pages)

Subsections:

- **Why initialisation matters.** Two failure modes the reader
  must recognise: variance collapse (all activations shrink
  toward 0; gradient vanishes) and variance explosion
  (activations grow exponentially; gradient overflows).
- **The variance-preservation argument.** State the goal: at
  initialisation, the variance of activations should be
  preserved layer-to-layer, $\Var(h^{(\ell)}) \approx
  \Var(h^{(\ell-1)})$. Derive: under independence and zero-mean
  inputs, $\Var(W h) = d_{\rm in} \Var(W) \Var(h)$, so we need
  $\Var(W) = 1/d_{\rm in}$ for variance to be preserved.
- **Xavier / Glorot init.** For tanh / sigmoid activations:
  $\Var(W) = 2/(d_{\rm in} + d_{\rm out})$, balancing forward
  and backward variance preservation.
- **He / Kaiming init.** For ReLU activations: $\Var(W) =
  2/d_{\rm in}$, accounting for ReLU killing half the variance
  in expectation.
- **Bridge to Chapter 4.** One paragraph: the same
  variance-preservation argument motivates the `1/√d_k` scaling
  in scaled dot-product attention. Chapter 4 derives that scale
  for the specific case of attention scores; this chapter has
  given the general form.

Equations introduced: Xavier and He variance formulas, the
variance-preservation chain.
References: Glorot-Bengio 2010, He et al. 2015.

## §5 Normalization (2 pages)

Subsections:

- **Why normalize at all.** Even with good init, activation
  statistics drift during training (internal covariate shift,
  in the original 2015 framing, or simply: moving the
  distribution that downstream layers were tuned for).
  Normalization layers re-establish a target activation
  distribution at each layer, decoupling layer-wise learning
  rates and stabilising training.
- **BatchNorm, briefly.** Definition: normalize each feature
  across the batch. Why Transformers do *not* use it: the
  batch-statistic dependency interacts badly with sequence
  packing and small per-token batches; train/eval-time
  divergence is fragile.
- **LayerNorm.** Definition: normalize each token's activation
  vector along the feature dimension,
  $\mathrm{LN}(x) = \gamma \odot (x - \mu(x)) / (\sigma(x) + \epsilon) + \beta$.
  No batch dependency; robust to sequence length and packing.
- **RMSNorm.** Drops the mean-centering:
  $\mathrm{RMSNorm}(x) = \gamma \odot x / (\mathrm{RMS}(x) + \epsilon)$.
  Empirically matches LayerNorm at lower compute cost; standard
  in Llama, Mistral, and many recent open-weight models.
- **Forward reference to Chapter 4.** Chapter 4 derives the
  pre-norm vs post-norm placement argument and the residual-stream
  reading-and-writing interpretation; this chapter has
  established the normalisers themselves.

Equations introduced: LayerNorm, RMSNorm.
References: Ioffe-Szegedy 2015, Ba-Kiros-Hinton 2016,
Zhang-Sennrich 2019.

## §6 Residual Connections (2 pages)

Subsections:

- **The depth problem.** Empirically, plain MLPs above some
  depth refuse to train: gradients vanish, optimisation stalls,
  validation loss does not decrease. The 2015 ResNet paper
  framed this as a *degradation* problem: deeper networks
  performed *worse* than shallower ones, even on training data.
- **The residual response.** Replace each layer's transformation
  $h^{(\ell)} = F(h^{(\ell-1)})$ with
  $h^{(\ell)} = h^{(\ell-1)} + F(h^{(\ell-1)})$.
  At initialisation (when $F$ is near zero), the residual path
  is the identity; the network behaves as if those layers were
  not there. The optimiser is free to learn small perturbations
  on top of the identity.
- **Why this makes depth trainable.** Two arguments. First,
  gradient: under the residual form, $\partial h^{(\ell)} / \partial h^{(\ell-1)} = I + \partial F / \partial h^{(\ell-1)}$, so the gradient signal does not vanish exponentially with depth as it does in a plain stack. Second, optimisation: an
  identity-initialised deep network is at worst as good as a
  shallow one; ResNet showed empirically that this floor turns
  into a ceiling that grows with depth.
- **One-line nod to the ODE limit.** Continuous-depth view: a
  residual stack with infinitesimal layer changes is the
  Euler discretisation of an ODE
  $dh/dt = F_t(h)$. The view is intellectually interesting and
  rarely operationally load-bearing; one paragraph, no
  derivation.
- **Forward reference to Chapter 4.** The residual connection
  becomes the Transformer's residual stream;
  Chapter 4 layers attention and FFN sublayers on top with the
  pre-norm placement argument. Chapter 4 also gives the
  Elhage-style interpretability framing.

Equations introduced: residual identity-path form,
gradient-through-residual.
References: He et al. 2015 (ResNet).

## §7 The MLP Block as a Transformer Primitive (1 page)

A short forward-pointing section:

- **The MLP block in a Transformer.** State the form
  $\mathrm{FFN}(x) = W_2 \varphi(W_1 x + b_1) + b_2$,
  with $W_1 \in \R^{d_f \times d}$ and $W_2 \in \R^{d \times d_f}$,
  typically $d_f = 4d$. This is the position-wise feed-forward
  network the Transformer applies to each token after
  attention.
- **Why it dominates the parameter count.** Quick FLOP/parameter
  accounting at the chapter level (no heavy derivation; CH4 has
  the full numbers): two `d × 4d` matrices vs one `d × d` for
  attention, so the FFN holds roughly two-thirds of a
  Transformer block's parameters.
- **What CH3 has set up that CH4 will compose.** A sentence list
  of handoffs: the linear layer (§1), backprop (§2), the
  GeLU/SwiGLU activation (§3), the variance-preserving init
  (§4), the LayerNorm/RMSNorm wrap (§5), the residual
  connection (§6) — Chapter 4 will compose these into the
  Transformer block and add the attention sublayer.

This section is deliberately short; its job is the handoff to
Chapter 4, not a re-derivation.

## Worked Example A: 1-D Regression (2 pages)

The mechanics example. Concrete walk:

- **Setup.** Fit $y = \sin(2x)$ on $x \in [-\pi, \pi]$ with a
  one-hidden-layer MLP, hidden width 8, GeLU activation, scalar
  output. Total parameters: $1 \cdot 8 + 8 + 8 \cdot 1 + 1 = 25$.
- **Initialise.** Pick a fixed seed; show the resulting weights
  and the (poor) prediction curve as a 2D plot.
- **Forward pass on a batch of four points.** Tabulate
  $h^{(1)}_j = \varphi(W^{(1)}_j x + b^{(1)}_j)$ for each batch
  point and each of 8 hidden units; then $h^{(2)} = W^{(2)} h^{(1)} + b^{(2)}$.
- **Loss.** Squared error to the targets.
- **Backward pass.** Compute $\delta^{(2)}$, then $\delta^{(1)}$,
  then the parameter gradients. Show numbers in a small table.
- **One SGD step.** At a stated learning rate (say 0.05),
  $\theta \leftarrow \theta - \eta \nabla \mathcal{L}$. Show
  the resulting weights.
- **Plot the new prediction curve.** It should be slightly
  closer to $\sin(2x)$ than the initial one.
- **Reader takeaway.** The math from §2 is not abstract; on a
  problem this small, every number can be checked by hand.

## Worked Example B: XOR via 2-layer MLP (2 pages)

The necessity example. Concrete walk:

- **Setup.** The four XOR points: $(0,0)\to 0$, $(0,1)\to 1$,
  $(1,0)\to 1$, $(1,1)\to 0$.
- **The single-layer attempt.** A linear layer with sigmoid
  output is parameterised by two weights and a bias. Show
  algebraically that no such parameterisation can place a
  separating line that correctly classifies all four points
  (either two opposite corners are below the threshold, or two
  are above). This is Minsky-Papert 1969 made arithmetic.
- **The two-layer solution.** A network with one hidden layer
  of two units and a tanh activation can implement XOR. Give
  one set of converged weights:
  $W^{(1)} = [[1, 1], [1, 1]]$, $b^{(1)} = [-0.5, -1.5]$,
  $W^{(2)} = [1, -2]$, $b^{(2)} = -0.5$.
  Walk the forward pass on all four points; verify that the
  outputs are close to $\{0, 1, 1, 0\}$.
- **The decision boundary.** Plot the 2D classifier's
  decision boundary as it bends through the unit square. The
  region that the linear model cannot reach is precisely the
  region the nonlinearity carves out.
- **One backward pass at the converged solution.** Compute
  $\delta^{(2)}$, $\delta^{(1)}$, and the parameter gradients.
  At the converged solution they should be small but not zero
  (the loss is small but the optimum is not exactly reached at
  this configuration). The point is to show that the same
  $\delta$-recursion from §2 applies to a classification task
  unchanged.
- **Reader takeaway.** Depth and nonlinearity are not
  decorations. They are what lets the network represent
  functions a linear layer cannot. The mechanics from §2 carry
  over from regression to classification with no change.

## Proved vs Assumed (0.5 page)

**Proved here.**
- The composition form of an MLP and the explicit gradient
  recursion via backprop (§2).
- Forward / backward FLOP equivalence to within a constant.
- The variance-preservation derivation that motivates
  Xavier / He init (§4).
- The identity-path interpretation of residual connections at
  initialisation, and the gradient-non-vanishing argument
  through them (§6).

**Empirical / observed.**
- ReLU vs GeLU vs SwiGLU choice; the dominance of SwiGLU in
  modern Transformers is empirical, not derived.
- Pre-norm vs post-norm placement — covered in CH4.
- Universal approximation: existence theorem, not a
  trainability result.
- BatchNorm-vs-LayerNorm choice in Transformers: empirical
  preference driven by practical concerns (batching, packing).

**Assumed.**
- A3.1: differentiability almost everywhere.
- A3.2: finite-precision floating-point arithmetic.
- A3.3: the loss is the cross-entropy from CH1.

## Connections to Earlier and Later Chapters (0.5 page)

- **Chapter 1 → Chapter 3.** The cross-entropy loss this
  chapter's networks minimise is the loss derived in CH1.
- **Chapter 2 → Chapter 3.** The SGD updates this chapter's
  backprop produces gradients for are the updates derived in
  CH2; the `6ND` rule's forward/backward equivalence is
  justified here.
- **Chapter 3 → Chapter 4.** The MLP, activation, init,
  normalization, and residual primitives compose into the
  Transformer block.
- **Chapter 3 → Chapter 7.** LoRA inserts low-rank deltas into
  the linear layers introduced here.
- **Chapter 3 → Chapter 8.** The σ symbol used in
  Bradley-Terry is the logistic sigmoid introduced as one
  activation here.

## Bridges to Other Chapters (0.5 page)

A short table:

| Item established here | Used in |
|---|---|
| MLP / linear layer | CH4 (FFN), CH7 (LoRA), CH8 (RM/policy networks) |
| Backprop chain rule | CH2 (justification for 6ND), CH4 (FLOP budgets) |
| Activations (sigmoid, ReLU, GeLU) | CH4 (FFN), CH8 (Bradley-Terry σ) |
| Variance-preserving init | CH4 (1/√d_k attention scaling) |
| LayerNorm / RMSNorm motivation | CH4 (full LayerNorm/RMSNorm derivation) |
| Residual connection | CH4 (residual stream), CH6 (depth scaling) |

## Derivation Ledger (0.5 page)

Compact index of central identities:

- **Composition form.** $f_\theta(x) = h^{(L)}$ with
  $h^{(\ell)} = \varphi(W^{(\ell)} h^{(\ell-1)} + b^{(\ell)})$ (§1).
- **Backprop $\delta$-recursion.**
  $\delta^{(\ell-1)} = (W^{(\ell)\top} \delta^{(\ell)}) \odot \varphi'(z^{(\ell-1)})$
  (§2).
- **Forward / backward FLOP equivalence.** Backward pass cost
  equals forward pass cost to within a small constant (§2).
- **Xavier init.** $\Var(W) = 2 / (d_{\rm in} + d_{\rm out})$ (§4).
- **He init.** $\Var(W) = 2 / d_{\rm in}$ (§4).
- **LayerNorm.** Per-token feature normalisation (§5).
- **RMSNorm.** LayerNorm without mean-centering (§5).
- **Residual identity path.**
  $h^{(\ell)} = h^{(\ell-1)} + F(h^{(\ell-1)})$ (§6).

## Takeaway (0.5 page)

Closing paragraph in Sagan voice. Key points to land:

- Modern neural networks are not exotic. They are compositions
  of linear layers, nonlinear activations, normalisations, and
  residual connections, trained by gradient descent through the
  chain rule.
- Each primitive in this chapter exists for a reason that is
  empirically grounded and historically traceable. None of them
  was inevitable; each was a response to a specific failure of
  the design that came before.
- The Transformer of Chapter 4 is *what these primitives compose
  into when you also add attention*. By the end of this
  chapter the reader should be able to read Chapter 4 as a
  particular arrangement of pieces they already understand,
  rather than as a list of unfamiliar names.

## Open editorial decisions surfaced by this outline

1. **Loss family.** This chapter assumes the loss is the
   cross-entropy from CH1 (A3.3), which is correct for LLM
   training. The 1-D regression worked example uses squared
   error (the natural loss for regression). *Recommendation:*
   call this out in the worked example as a "different loss for
   illustration" rather than a contradiction with A3.3.

2. **Section §7 length.** I've allocated 1 page; an alternative
   would be to fold §7 into the §6 closing, freeing 1 page for
   §2 (backprop) which is the densest section. *Recommendation:*
   keep §7 as a standalone short section — the explicit handoff
   to CH4 is pedagogically valuable; the reader benefits from
   seeing the Transformer's pieces named once before meeting them
   composed.

3. **Worked example notation.** The 1-D regression example
   uses indexed parameter values (specific weights at specific
   batch points). *Recommendation:* present these as a small
   table with two-or-three significant figures; the reader can
   reproduce the numbers if they wish but does not need to in
   order to follow the argument.

If the outline looks right and the three small editorial
decisions above are acceptable, the next task is **Task 4:
draft the Setting the Scene prologue** in the Sagan voice,
following the four-beat structure laid out at the top of this
outline.
