# Narrative Prologue Content Plan

This document plans the content of the book-level Sagan-voiced
introduction and the eleven per-chapter prologues. Each entry lists
the four narrative beats (problem, lineage, current practice, error
modes), the historical names and dates to anchor on, and the bridge
to the math.

## Book-level Introduction (replacing the Preface)

**Beat 1 — The problem.** Anchored on the reader's own experience:
they have probably already used a chatbot, perhaps to write code or
a school essay. The interesting question is not whether the answer
was correct; it is what the system was actually doing. We are about
to take that system apart, slowly, and assemble it back together.

**Beat 2 — How we got here.** A compressed history of the field,
visible from one ridge: Shannon's 1948 information theory; the
n-gram era; the connectionist revival of the 1980s; word embeddings
in the 2010s; sequence-to-sequence models; the Transformer in 2017;
GPT-1, 2, 3; instruction-tuning and RLHF; tool use, retrieval, and
agents; governance.

**Beat 3 — Where we stand and how to read this book.** A reader's
manual: the four-beat structure of every chapter, the relationship
between the narrative prologues and the math, the role of the
notation boxes and proved-vs-assumed recaps, the labs.

**Beat 4 — What goes wrong.** A short, honest catalogue of what
modern LLMs cannot reliably do, framed as engineering consequences,
not as failings of any one researcher or company. Hallucination,
brittleness, sycophancy, the alignment tax, prompt injection.

**Closing.** Why the engineer who understands the lineage and the
error modes is more useful, more humble, and more dangerous (in the
useful sense) than one who only knows the tooling.

## Chapter 1 — Statistical Foundations

**Problem.** What does it mean to predict the next word? The
question is older than the computer. Markov in 1913 counted vowels
and consonants in *Eugene Onegin* to argue that consecutive letters
are not independent; he gave us conditional probability over
sequences a century before we had the data to make it useful.

**Lineage.** Markov 1913; Shannon's 1948 paper on the entropy of
English; the n-gram era of speech recognition; Bengio et al.'s
2003 neural language model; word2vec 2013; recurrent and then
attention-based models. The idea that has survived every shift is
that language is best modelled probabilistically.

**Current practice.** Train a neural network to predict the next
token, evaluate its predicted distribution against the ground truth
with cross-entropy. The math in the next section unpacks why this
particular loss is the right one — it is what we always end up at
when we ask "minimise the surprise of seeing the data we actually
saw."

**Error modes.** A model trained on cross-entropy is a calibrated
liar by default: it produces the most probable next token, not the
true next token. This is the seed of hallucination. Probabilities
are not truths; the well-trained model is the one that knows how
much it does not know, and most of them, including the best ones,
are not yet that.

## Chapter 2 — Optimization, Generalization, and Scaling Intuition

**Problem.** A neural network has billions of parameters. We have
no closed-form solution. We have a loss landscape with no map. The
question is how to walk down it.

**Lineage.** Cauchy's 1847 method of steepest descent; Robbins and
Monro 1951 (stochastic approximation); back-propagation, Werbos
1974, popularised Rumelhart, Hinton, and Williams 1986; momentum;
Adam, Kingma and Ba 2014; the move to AdamW; Kaplan et al. 2020
and Chinchilla 2022 turning training into a planning exercise.

**Current practice.** AdamW with warmup, cosine decay, gradient
clipping, mixed-precision arithmetic; compute-optimal scaling laws
that tell us how to spend a budget; SGD-as-Langevin-dynamics as
the implicit theoretical lens.

**Error modes.** Loss spikes that do not recover; learning rates
that look fine on a small model and destroy a big one; over- and
under-training; double descent. The dramatic-sounding ones tend to
be diagnosable; the quiet ones — a model that trains successfully
but generalises badly — are the hard ones.

## Chapter 3 — Tokenization and Embeddings

**Problem.** A computer can only see numbers. A language has an
unbounded vocabulary. We need a finite alphabet that loses as
little as possible. This problem is older than LLMs; phone-book
sorting, code-page wars, and Unicode all rehearsed it.

**Lineage.** Word-level vocabularies (and their out-of-vocabulary
problem); character-level models (powerful but costly); byte pair
encoding, Sennrich et al. 2016; WordPiece, Schuster and Nakajima
2012, made famous by BERT; SentencePiece, Kudo and Richardson
2018, with whitespace as a sentinel; the Unigram language-model
tokenizer.

**Current practice.** Subword tokenizers, trained once and frozen
for the life of the model, with deterministic segmentation. The
math in the next section explains why the WordPiece score is the
log-likelihood gain of a merge, and why the Unigram tokenizer's
EM-prune algorithm is the right one for its objective.

**Error modes.** Multilingual disparity (a sentence in Thai costs
two to five times as many tokens as the same sentence in English);
prompt brittleness when whitespace shifts a token boundary; the
"the model doesn't know X" problem when X is split across awkward
subwords; Unicode-based prompt injection.

## Chapter 4 — The Transformer

**Problem.** A sequence model needs to look back. How far, and how?
Recurrent networks did this serially; they ran out of memory and
ran out of patience. The training signal had to traverse every
intermediate step, and gradients vanished.

**Lineage.** Elman's 1990 simple recurrent net; Hochreiter and
Schmidhuber 1997 LSTM; Bahdanau et al. 2015 attention as a soft
content-based memory; the 2017 Transformer of Vaswani and
colleagues, which removed recurrence and made the entire context
addressable in parallel.

**Current practice.** Multi-head self-attention with QKV
projections; position information injected by sinusoidal, learned,
ALiBi, or rotary embeddings; pre-norm residual stacks; FFN blocks
between attention layers; KV-caching for serving. The math in the
next section is the bookkeeping for the attention identity, the
sqrt(d_k) scaling, and the KV-cache memory budget.

**Error modes.** Attention sinks (the first token absorbs spurious
mass); positional drift outside the trained context length; the
KV-cache budget that turns a small architectural choice into a
serving cost line item; FlashAttention's memory-bound regime.

## Chapter 5 — Pretraining, GPT-Style Models, and In-Context Learning

**Problem.** The Transformer is an architecture. By itself it knows
nothing. The interesting question is what happens when we feed it
trillions of tokens of text. We are about to find out that the
answer has structure we did not put there on purpose.

**Lineage.** The 1990s LM benchmarks; word2vec's analogy
arithmetic; ELMo, GPT-1, BERT, GPT-2, GPT-3; the 2020 paper that
declared in-context learning a phenomenon worth its own name;
Chinchilla 2022 forcing a redefinition of "compute-optimal".

**Current practice.** Train a causal language model on a large,
deduplicated, quality-filtered corpus. Decode by sampling under
some controlled randomness. The model "learns in context" by
inferring which latent task its prompt is conditioning on.

**Error modes.** Memorisation of strings the model was not meant
to memorise; mode collapse under greedy decoding; the prompt
brittleness that makes "few-shot" feel more like superstition than
science; emergent capabilities that turn out to be artefacts of
the metric.

## Chapter 6 — Efficiency, Scaling, Mixture-of-Experts

**Problem.** Dense scaling is expensive. Every parameter sees every
token. We would like to grow capacity without growing the compute
per token at the same rate.

**Lineage.** Jacobs and Jordan 1991 mixture-of-experts; Shazeer et
al. 2017 sparsely-gated MoE; the Switch Transformer 2021;
GLaM 2022; Mixtral 2024 as the first open-weights MoE that anyone
could run at home.

**Current practice.** Top-k routing into a pool of experts, with
load-balancing losses to keep the routing healthy; capacity factor
to bound dropped tokens; auxiliary z-losses for router stability.
The math in the next section formalises capacity factor, the load-
balancing gradient, and the active-vs-total parameter accounting.

**Error modes.** Expert collapse (one expert eats every token);
router instability; dropped tokens at high capacity factor;
training that is bound by interconnect bandwidth instead of FLOPs.

## Chapter 7 — Adaptation, LoRA, Quantization

**Problem.** A 70-billion-parameter base model is a public good.
We cannot retrain it for every customer. We cannot even hold full
gradients of it on a single machine. How do we adapt?

**Lineage.** Full fine-tuning was the original answer. Adapter
modules, Houlsby et al. 2019, were the first cheap version. LoRA,
Hu et al. 2021, found a low-rank decomposition that worked
embarrassingly well. QLoRA, Dettmers et al. 2023, added 4-bit
NF4 quantisation and made adaptation possible on a single
consumer GPU.

**Current practice.** Quantise the base in 4 bits; train a small
LoRA adapter at rank 8 to 64 with mixed precision; serve the base
once and a registry of adapters per customer. The math in the next
section derives the LoRA parameter ratio, the LoRA memory equation,
and the NF4 equal-mass quantile construction.

**Error modes.** Rank starvation (the adapter is too small to
capture the desired delta); base-drift on quantisation (the
quantised base no longer matches the unquantised one); adapter
sprawl (more adapters than the registry can audit).

## Chapter 8 — Alignment and Preference Optimization

**Problem.** A pretrained model is fluent. It is not, by default,
helpful, honest, or safe. It cannot be: it has only ever been
asked to predict the next token, not to be useful.

**Lineage.** Instruction-tuning on supervised data; OpenAI's
InstructGPT and the RLHF pipeline of Ouyang et al. 2022; DPO
(Rafailov et al. 2023) as a closed-form simplification; KTO, IPO,
ORPO, SimPO, RLAIF, Constitutional AI as variants.

**Current practice.** Pretrain → instruction-tune → align with a
preference dataset, either via reward modelling and RL or via
direct optimisation on a preference loss. The math in the next
section derives the Bradley-Terry model, the closed-form RL
optimum, and the DPO loss.

**Error modes.** Reward hacking; sycophancy (the model agrees with
whatever the user asserts); the alignment tax (capability lost
during alignment); hidden-value disagreement between annotators
and users; jailbreaks that transfer across providers.

## Chapter 9 — Retrieval, Tools, Evaluation

**Problem.** A model trained today knows nothing of yesterday.
Worse, it cannot know what it does not know. To be useful for
real work it must be paired with retrieval and tools. To be
trusted it must be evaluated continuously.

**Lineage.** Information retrieval is older than the computer
(Luhn 1957). BM25, Robertson and Walker 1994. Dense retrieval
with neural embeddings, Karpukhin et al. 2020. Retrieval-augmented
generation, Lewis et al. 2020. Tool-use prompts and JSON schema
calling. Evaluation harnesses such as HELM, MMLU, MT-Bench.

**Current practice.** Hybrid retrieval (BM25 + dense + reranker);
RAG with a structured prompt; tool use via function-calling;
continuous evaluation as a separate engineering function. The
math in the next section is the BM25 formula, the cosine
similarity caveats, the lost-in-the-middle setup, and the four
evaluation metrics.

**Error modes.** Retrieved context that hallucinates anyway
(garbage in, fluent garbage out); lost-in-the-middle (relevant
chunks placed where the model can't see them); tool-output prompt
injection; eval drift (your benchmarks no longer measure what you
care about).

## Chapter 10 — Governance, Assurance, the Future

**Problem.** A trained, aligned, retrieved-from, tool-using model
is still not safe. It is deployed into a context. The context has
laws, customers, regulators, mistakes. Safety is a property of
that whole system, not of the model.

**Lineage.** Aviation's safety culture (forty years of root-cause
analysis). Medical-device assurance cases. The IEC 61508 family.
The EU AI Act and NIST AI RMF, both 2023–2024. Internal red-
teaming and external evaluation programs.

**Current practice.** Risk scoring with explicit uncertainty
bands; assurance cases built from claims, sub-claims, and
evidence; drift triggers tied to monitored metrics; defence in
depth across pre-model, model, system, detective, corrective,
and post-deployment layers. The math in the next section is the
risk-residual equation and the drift-trigger inequality.

**Error modes.** Safety theatre that satisfies the form without
the function; capture by frameworks (compliance becomes the goal,
not the safety it was meant to encode); silent drift below the
trigger threshold; policy and empirical claims confused for one
another in the same paragraph.

## Chapter 11 — Modern LLM Access

**Problem.** A trained model on a server is useless without an
interface. A working interface needs a wire format, a contract,
a billing model, error semantics, retries, observability, a tool
schema, and increasingly a multi-server protocol.

**Lineage.** RPC and SOAP; REST; GraphQL; the shift to
JSON-over-HTTPS; OpenAI's chat-completions API in 2022 making
streaming and function-calling everyday; the Model Context
Protocol of 2024 standardising tool servers across clients.

**Current practice.** Chat-completions APIs with streaming,
prompt caching, and tool calling; SDKs in many languages; agent
loops with explicit termination invariants; MCP servers for
declaratively shared tools. The math in the next section gives
the latency and cost equations, the M/M/1 model, and the agent
termination invariants.

**Error modes.** Latency-cost trade-off mismatched against the
product; retry storms that amplify rather than absorb errors;
tool-output prompt injection that turns retrieved data into
control flow; agent loops without termination invariants.
