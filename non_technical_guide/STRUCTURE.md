# Non-Technical Guide to LLM Engineering — Master Structure

This document is the single source of truth for the
*Non-Technical Guide to LLM Engineering*. It is read at the start of
every chapter draft and updated whenever a chapter introduces a new
forward-pointing promise. Its purpose is to keep the thirteen chapters
coherent: each chapter knows what the others have already said, what
they still owe the reader, and which historical figures, dates, and
analogies are theirs to introduce.

The guide is the companion to *Large Language Models as Engineered
Systems*. It carries the same chapter ordering, the same Carl-Sagan
voice, and many of the same opening scenes — but it strips every
formula and replaces every derivation with intuition, history, and
the engineering decisions a non-technical reader needs to reason
about LLM products and their failure modes.

---

## Audience and contract

The reader is an educated adult. They might be a product manager, a
lawyer, a clinician, a teacher, an executive, a journalist, a
policymaker, or simply a curious user who has begun to ask harder
questions about the systems they have started to depend on. They
have no calculus, no linear algebra, and no probability beyond the
intuition of weather forecasts and dice. They are, however,
comfortable with sustained reading and unafraid of careful argument.

By the end of the guide they should be able to:

1. Tell the rough hundred-year story of how we got from Markov in
   1913 to GPT-style assistants today, and name the half-dozen ideas
   that did the most work along the way.
2. Explain, without equations, what an LLM is doing when it answers
   a prompt — and what it is *not* doing.
3. Recognise the characteristic failure modes (hallucination,
   prompt brittleness, sycophancy, prompt injection, lost-in-the-
   middle, alignment tax, reward hacking, retrieval drift) and trace
   each one to a specific engineering decision earlier in the
   pipeline.
4. Use the five-axis error model from Chapter 13 (structure,
   meaning, context, grounding, environment) to diagnose a wrong
   answer in language a non-engineer can act on.
5. Hold a productive conversation with an engineer or vendor about
   the trade-offs of a real LLM product without falling into either
   credulous techno-optimism or reflexive dismissal.

The standard the guide holds itself to is what we call the
**Feynman Standard** — though that phrase overstates the case.
There is no written rulebook. It is an observation of how a great
teacher worked and an aspiration to do something similar. Feynman's
popular physics lectures were not remarkable for avoiding mathematics;
they were remarkable because he refused to let a term stand
unexplained. Every word had to earn its place. Feynman insisted on
the difference between knowing the name of a thing and knowing the
thing. A reader who finishes a chapter should be able to reason
*forward* from the mechanism — to predict, imperfectly but
directionally, what will go wrong when the mechanism is stressed —
not only recognise failure modes by name. A passage that teaches
vocabulary without teaching why the thing behaves as it does has
done half the work. The Feynman Standard is the other half.

---

## Voice anchor

The voice is the same Carl-Sagan-influenced register that the parent
reader uses, governed by `../VOICE.md`. The differences for this
guide are:

- **Diction is plainer.** Words like "stochastic", "objective",
  "gradient", "embedding", "logit", "tensor" are introduced only
  when they will be used by the reader in the wild, and always
  with an immediate plain-English equivalent.
- **No symbols.** No equations, no Greek letters, no inline math.
  When a quantity matters, it is named in English and given an
  order-of-magnitude in words ("about a trillion words", "roughly
  the cost of a small car per training run").
- **Analogies do real work.** Each chapter has at most two or
  three controlling analogies, chosen for accuracy first and
  vividness second. Analogies that mislead in any important way
  are cut even when they are pretty.
- **Mechanism over vocabulary (the Feynman Standard).** Every
  chapter should leave the reader able to reason forward from the
  mechanism, not only name it. An analogy that explains what
  something is called without explaining why it behaves as it does
  has not met the standard. Each "plain language" section must
  include at least one subsection that closes the gap between
  "here is what this component produces" and "here is why the
  training / design makes it produce that".
- **History is foreground.** The named figures of the field
  (Markov, Shannon, Turing, McCulloch and Pitts, Rosenblatt,
  Minsky, Rumelhart, Hinton, Bengio, Mikolov, Hochreiter,
  Schmidhuber, Sutskever, Bahdanau, Cho, Vaswani, Radford,
  Christiano, Ouyang, Rafailov, Bender, Marcus) are named, dated,
  and credited every time their idea reappears. The reader leaves
  the book knowing whose shoulders the present moment stands on.
- **Failure modes are foreground.** Every chapter ends with the
  errors that come from the mechanism it has just explained, in
  the same plain language a user would use in a complaint to a
  vendor.
- **No call-to-action appendixes.** No "now go try this!" closing
  beats. Each chapter ends on a sentence that closes its argument
  and opens the next one.

The guardrails of `../VOICE.md` (no exclamation marks, no cosmic
overreach, no emojis, no italicised awe, no invented quotations,
no historical claims that cannot be verified) apply unchanged.

---

## Structural conventions

Every chapter follows the same five-beat structure, in this order:

1. **Setting the Scene.** The four-beat prologue from `../VOICE.md`
   (problem, lineage, current practice, what goes wrong), adapted
   for the lay reader. About 3–4 pages.
2. **The idea, in plain language.** The conceptual core of the
   chapter. What the technique does, why it does it that way, and
   what the alternative looked like before. No formulas. About
   3–5 pages.
3. **The engineering consequence.** What the idea makes easy,
   what it makes hard, and the trade-offs a product team faces
   today because of it. About 2–3 pages.
4. **What goes wrong, and why.** The specific failure modes that
   trace back to this chapter's mechanism, named in plain English
   and connected explicitly to the user-visible misbehaviours the
   reader has likely already encountered. About 2–3 pages.
5. **Bridges.** A short closing block listing the chapters that
   build on this one and the chapters whose machinery it depends
   on. About a paragraph.

Total target length per chapter: 12–16 pages. Length is adjusted
per chapter according to material density, not padded for
uniformity.

The Preface mirrors the parent reader's preface in structure but
is rewritten for this audience.

---

## Chapter-by-chapter outline

Chapter numbers and titles are chosen to mirror the parent reader.
Each entry lists the chapter's anchoring question, the historical
figures and dates it owns, the central analogies it is allowed to
use, and the failure modes it must explain.

### Preface — A Letter to the Curious Reader

- **Anchor.** What is the thing on the other side of your screen,
  and why is it both more and less than it seems?
- **Owns.** The hundred-year arc from Markov to GPT-4. The framing
  that an LLM is a *socio-technical system* rather than a single
  artefact. The promise that errors are not embarrassments but
  data.
- **Failure modes touched.** Hallucination introduced by name.
  Calibration introduced informally. Alignment introduced informally.

### Chapter 1 — The Idea That a Word Predicts the Next Word

- **Anchor.** What does it mean, formally and informally, to "guess
  the next word"?
- **Owns.** Markov (1913, *Eugene Onegin*). Shannon (1948,
  information theory; the entropy of English ≈ 1 bit per letter).
  The n-gram era. Jelinek's "fire a linguist" remark. Bengio
  et al. (2003) as the first neural language model.
- **Central analogies.** The autocomplete on your phone; the
  cloze test where a sentence has its last word missing.
- **Failure modes.** Hallucination as "the most plausible
  continuation, not the most true one". The probability /
  confidence / correctness conflation. Calibration drift.

### Chapter 2 — How Machines Learn from Their Mistakes

- **Anchor.** How does any computer "learn"?
- **Owns.** The general loop of guess → measure error → adjust →
  repeat. Robbins and Monro (1951, stochastic approximation).
  Cauchy's gradient descent (1847). Adam (Kingma & Ba, 2014).
  Scaling laws (Kaplan et al. 2020; Hoffmann et al. 2022,
  Chinchilla).
- **Central analogies.** A blindfolded hiker walking downhill;
  cooking by tasting and adjusting; the warmup of a runner.
- **Failure modes.** Overfitting / underfitting. Training-data
  bias. The fact that "more data" is not always the right answer.
  Compute as a budget, not a button.

### Chapter 3 — Networks of Simple Decisions

- **Anchor.** What is a "neural network", really, and why is the
  name half-honest?
- **Owns.** McCulloch & Pitts (1943). Rosenblatt's perceptron
  (1958). Minsky & Papert (1969) and the first AI winter.
  Werbos (1974), Rumelhart, Hinton & Williams (1986) for
  backpropagation. The 2012 AlexNet moment (Krizhevsky, Sutskever,
  Hinton).
- **Central analogies.** A circuit of dimmer switches; a committee
  of small voters with adjustable confidence; recipe of recipes.
- **Failure modes.** The "black box" framing — what is true
  about it and what is overstated. Brittleness to inputs that
  look like training data. Adversarial examples in plain
  language.

### Chapter 4 — From Letters to Vectors

- **Anchor.** A computer cannot read words. What does it read?
- **Owns.** Tokenization (BPE, WordPiece, SentencePiece). The
  distributional hypothesis (Harris, 1954; Firth, 1957: "you
  shall know a word by the company it keeps"). word2vec
  (Mikolov et al., 2013). GloVe (Pennington et al., 2014).
- **Central analogies.** A map of meaning where related words
  cluster together; subway lines through a city of concepts.
- **Failure modes.** Tokenization quirks (numbers, code, non-
  English scripts). Why the model "can't count letters" in a
  word. Embedding bias as inherited bias from the training corpus.

### Chapter 5 — Attention, or How a Machine Reads

- **Anchor.** How does a model decide which earlier word matters
  for the next one?
- **Owns.** Recurrent networks and their limits (Elman, 1990;
  Hochreiter & Schmidhuber, 1997, LSTM). Sutskever, Vinyals,
  Le (2014, seq2seq). Bahdanau, Cho, Bengio (2015, attention).
  Vaswani et al. (2017, Transformer, *Attention Is All You
  Need*). The triumph of parallelism.
- **Central analogies.** A reader's eye flicking back to an
  earlier word; a librarian retrieving the relevant index card.
- **Failure modes.** Quadratic cost in context length. Lost-in-
  the-middle. Attention as not-an-explanation. Position
  extrapolation failures.

### Chapter 6 — Pretraining and the Birth of GPT

- **Anchor.** Where do these systems get their breadth from?
- **Owns.** GPT-1 (Radford et al., 2018). GPT-2 (2019), GPT-3
  (2020), ChatGPT (Nov 2022), GPT-4 (Mar 2023). In-context
  learning as discovered behaviour. The training corpus —
  Common Crawl, books, code — and what it contains.
- **Central analogies.** A student who has read the entire
  library but never spoken with anyone. A parrot who has
  memorised every conversation in the room and can recombine
  them.
- **Failure modes.** Cut-off date. Memorisation of personal
  data. Toxic content in the training corpus surviving into
  outputs. The illusion of understanding from in-context
  learning.

### Chapter 7 — Why Bigger Sometimes Helps

- **Anchor.** Why does scale matter, and where does it stop
  mattering?
- **Owns.** Kaplan et al. (2020). Hoffmann et al. (2022,
  Chinchilla). Mixture-of-Experts (Shazeer et al., 2017; later
  Switch Transformer; Mixtral, DeepSeek-MoE). The dollar cost
  of training, in human terms.
- **Central analogies.** A factory whose output scales with
  workers up to a point, then stalls when the loading dock is
  the bottleneck. Specialisation in a hospital.
- **Failure modes.** Scaling-law extrapolation as a guide,
  not a guarantee. Sparse routing collapse. Energy and water
  cost as a real constraint.

### Chapter 8 — Adapting a Giant Model

- **Anchor.** How does a model trained by Anthropic or OpenAI end
  up answering questions about your company?
- **Owns.** Fine-tuning. LoRA (Hu et al., 2021). Quantization
  (4-bit and 8-bit, QLoRA, Dettmers et al., 2023). Distillation.
  On-device deployment.
- **Central analogies.** A general practitioner taking a short
  course in dermatology. A photograph compressed to a JPEG —
  smaller, slightly worse, often good enough.
- **Failure modes.** Catastrophic forgetting. Quantization-
  introduced errors that look random. Drift from the base model's
  guarantees when the customisation is silent.

### Chapter 9 — Teaching Manners and the Cost of Doing So

- **Anchor.** A pretrained model will happily complete an essay
  that begins "the best way to commit fraud is". How do we get
  from there to a useful assistant?
- **Owns.** Instruction tuning. RLHF (Christiano et al., 2017;
  Stiennon et al., 2020; Ouyang et al., 2022, InstructGPT).
  Constitutional AI (Bai et al., 2022). DPO (Rafailov et al.,
  2023). The Anthropic / OpenAI alignment teams as institutions.
- **Central analogies.** Raising a child versus training a
  parrot. A diplomat who has been told what not to say but not
  why.
- **Failure modes.** Alignment tax. Sycophancy. Reward hacking.
  Refusal as a brittle behaviour. Jailbreaks. The gap between
  *aligned* and *trustworthy*.

### Chapter 10 — Memory the Model Doesn't Have

- **Anchor.** How do these models answer questions about events
  that happened after they were trained, or about your private
  documents?
- **Owns.** Retrieval-Augmented Generation (Lewis et al., 2020).
  Vector databases as a category (FAISS, HNSW, Pinecone,
  Weaviate). Tool use. Evaluation harnesses (HELM,
  BIG-bench, lm-eval-harness, MMLU, GSM8K).
- **Central analogies.** A consultant who looks things up in
  a binder before answering. A research assistant who occasionally
  cites a paper that does not exist.
- **Failure modes.** Retrieval drift. Stale or contradictory
  documents. Citation hallucination. Eval-set contamination.
  Goodhart's law on benchmarks.

### Chapter 11 — Trust, Governance, and Who Is Responsible

- **Anchor.** Who is accountable when a deployed LLM produces
  harm?
- **Owns.** The EU AI Act (2024). NIST AI RMF (2023). The
  OECD principles. Pre-deployment evaluations and red-teaming
  as institutional practices. Assurance cases as a discipline
  borrowed from aviation and pharma. Audit and provenance.
- **Central analogies.** Aviation's incident-reporting culture;
  food safety inspection; the FDA approval process and its
  trade-offs.
- **Failure modes.** Regulatory fragmentation. Evaluation
  gaps for emerging capabilities. The gap between published
  policy and deployed behaviour. Liability ambiguity in agentic
  systems.

### Chapter 12 — How You Talk to a Model Today

- **Anchor.** What is on the other end when you call an "API",
  use an IDE assistant, or run an "agent"?
- **Owns.** REST APIs and SDKs as the consumer-facing surface.
  Streaming responses. Token-based pricing. The agent loop
  (plan → call tool → observe → revise). The Model Context
  Protocol (MCP, Anthropic 2024) as a way of standardising
  tool access. IDE assistants as an interaction modality
  (Copilot, Cursor, Claude Code).
- **Central analogies.** A telephone exchange that bills by
  the syllable; a junior employee with access to the company
  systems but no judgement about which to use.
- **Failure modes.** Prompt injection. Confused-deputy attacks
  via tool results. Cost runaways. Latency surprises in agent
  loops. The trust boundary between model and tool.

### Chapter 13 — A Map of How LLMs Go Wrong

- **Anchor.** When the answer in front of you smells wrong,
  what do you actually look at?
- **Owns.** The five-axis ladder from the parent reader's
  Chapter 13: structure, meaning, context, grounding, environment.
  The translation table from the engineer's vocabulary to the
  user's experience. Bender & Koller (2020, *Climbing Towards
  NLU*). Marcus's critique (2020). Chomsky's competence /
  performance distinction (1965). Grice (1975). Searle (1969).
- **Central analogies.** A doctor's differential diagnosis;
  the layered failure analysis used in aviation incident reports.
- **Failure modes.** The model itself: temptation to use the
  ladder mechanically, treating the axes as orthogonal,
  treating diagnosis as a checklist. The deeper mistake of
  treating the framework as a fix rather than a vocabulary.

---

## Cross-chapter promises

This is the running ledger of *forward promises*: claims a chapter
makes that a later chapter must redeem. Update it whenever a
chapter introduces a forward-pointing promise.

| Promise | Made in | Redeemed in |
|---|---|---|
| "We will define hallucination precisely later." | Preface | Ch.1 §What goes wrong, and Ch.13 (grounding axis) |
| "We will see why some prompts produce qualitatively different answers from near-identical ones." | Preface | Ch.5 (attention), Ch.13 (structure axis) |
| "We will see why a model that is fluent is not, by default, a model that is helpful." | Preface | Ch.9 (alignment) |
| "We will see how a tool call can carry an attack." | Preface | Ch.12 (prompt injection) |
| "We will see why the model is *miscalibrated*." | Ch.1 | Ch.6 (sampling), Ch.9 (RLHF effects on calibration) |
| "We will see why bigger sometimes stops helping." | Ch.2 | Ch.7 (Chinchilla, MoE) |
| "We will see how a small adapter can change a giant model." | Ch.7 | Ch.8 (LoRA) |
| "We will see how 'helpful' was learned." | Ch.6 | Ch.9 (RLHF, instruction tuning) |
| "We will see how the model 'looks things up'." | Ch.6 | Ch.10 (RAG) |
| "We will see how the engineering vocabulary maps to user experience." | Throughout | Ch.13 |

---

## Cohesion checklist (run before each chapter draft is committed)

- [ ] All four narrative beats are present in *Setting the Scene*.
- [ ] No equations, no Greek letters, no LaTeX math mode used.
- [ ] Every named historical figure has a date and an attributable
      contribution.
- [ ] Every claim that is empirical or uncertain is flagged as such.
- [ ] The chapter introduces no jargon without an immediate plain-
      English equivalent.
- [ ] The chapter's failure modes are tied by name to the user-
      visible misbehaviour they cause.
- [ ] The chapter respects the forward / backward promises in this
      ledger.
- [ ] The closing *Bridges* paragraph names the chapters that
      depend on this one and the chapters this one depended on.
- [ ] Length is in the 12–16 page band (or has a documented reason
      to deviate).
- [ ] Voice passes the `../VOICE.md` checklist (no exclamation
      marks, no cosmic overreach, no emojis, no italicised awe, no
      invented quotations).
- [ ] Feynman Standard met: the "plain language" section contains
      at least one subsection explaining *why* the mechanism
      behaves as it does, not only *what* it produces. A reader
      who finishes the chapter can reason directionally forward
      from the mechanism without formulas.
