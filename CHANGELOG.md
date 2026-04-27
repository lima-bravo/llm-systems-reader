# Changelog

This file records the wave-level revision history of the reader. Each
wave is a self-contained editorial pass committed as one or more git
commits. Earlier waves built the chapters; later waves polished them.

## Wave 10 — Review-driven revisions (April 2026)

A 12-chapter detailed audit (see `REVIEW_WEEK01.md` through
`REVIEW_WEEK12.md`) flagged 5 P0 factual errors, ~55 P1 substantive
issues, and ~50 P2 stylistic / scoping items, plus pedagogical
suggestions. Wave 10 implemented the items with strong evidentiary
support and deferred those that duplicated existing material or
exceeded the book's stated audience scope.

### Wave 10.1 — Five P0 factual corrections

- **CH2** `eq:week2-sgd`: missing token index in conditional —
  `p_θ(x^(i) | x^(i)_<)` → `p_θ(x^(i)_{t_i} | x^(i)_{<t_i})`.
- **CH3** Tokenizer worked example mis-counted `Let's tokenize this!` as
  nine characters; corrected to twenty.
- **CH4** Causal-masking direction reversed in prose: "future tokens
  cannot attend to the past" → "each token can attend only to earlier
  positions and to itself, never to future tokens."
- **CH5** `C = 6ND` numeric example inconsistent: 70B / 1.4T at "10²⁵
  FLOPs" → 70B / 1.4T at the actual Chinchilla budget of ~5.9 × 10²³
  FLOPs.
- **CH6** Mixtral 8×7B claimed at 47B active / 93B total → corrected to
  the published numbers ~13B active / ~47B total (Jiang et al. 2024),
  with the explicit counting convention (top-2 of 8 FFN experts; shared
  attention/embedding; 8 FFN expert blocks per layer).

### Wave 10.2 — Per-chapter substantive fixes (10.2.1 through 10.2.12)

For every chapter, the P1 items, well-supported P2 items, ambiguity
audit fixes, and VOICE-fail prologue anchors were applied. Highlights:

- **CH1**: split A1.1 sequence-level i.i.d. from token-pair averaging
  (A1.1a/A1.1b); empty-bin handling for ECE; calibration-function form
  for the population ECE.
- **CH2**: `1/N → 1/N_tok`; SGD assumptions made explicit; Adam
  bias-correction "is unbiased" → "approximately unbiased."
- **CH3**: "lossless" scoped to byte-level + pinned normalization;
  SentencePiece default rewritten (Unicode code points, not raw bytes);
  embedding `i → ι` to fix index-role collision.
- **CH4**: variance-derivation uncorrelatedness assumption made
  explicit; FLOP convention drift fixed (MAC=2 throughout); FlashAttention
  scope limited to attention-intermediate memory.
- **CH5**: memorization probability bounded `min(1, ...)`; long-context
  historical claim corrected; concrete-scene prologue.
- **CH6**: composite world-size formula made explicit; load-balancing
  fixed-point downgraded to "stationary point + minimiser, convergence
  empirical"; arithmetic-intensity formula dimensionally fixed; serving
  vs training memory regimes separated.
- **CH7**: QLoRA 65B-on-48GB scoped to Dettmers config; "adapters
  compose linearly" corrected (linearity is on parameters, not
  behaviour); concrete-scene prologue.
- **CH8**: KL "strict upper bound" hedged; "DPO displaced RLHF"
  qualified by audience; concrete-scene prologue.
- **CH9**: trust invariant operationally testable; "most failures are
  system failures" scoped to RAG / agentic deployments; concrete-scene
  prologue.
- **CH10**: risk arithmetic R = S·L framed as policy index, not ratio
  quantity; independence assumptions split (failure independence vs
  efficacy independence); jurisdictional scope tightened.
- **CH11**: cost equation gains the missing `/10⁶` factor; ledger
  retry expectation matches body's truncated-geometric form;
  "termination invariants" → "termination conditions."
- **CH12**: A12.3 softened from impossibility to "training alone
  insufficient"; multi-axis failure rule made explicit (label set F,
  address in ladder order); reasoning-model and inference-time
  mitigations acknowledged in the Meaning section.

### Wave 10.3 — Cross-chapter notation discipline pass

- **Chapter vs Week naming**: 35 `Chapter~N` cross-references in CH12
  normalised to `Week~N`, matching the convention used by the other 11
  chapters.
- **Dataset symbol**: three remaining `\sim D` in CH8 equations
  (eq:rm-loss, eq:rlhf, eq:dpo) replaced with `\sim \mathcal{D}`.
- **Reward symbol typing**: explicit one-line bridge before the DPO
  derivation distinguishing `r_φ` (parametric reward model) from the
  abstract `r(x,y)` in the RL objective.
- **Expert count `N_e`**: CH6 body equation `eq:week6-load-balance` and
  its ledger entry harmonised to use `N_e` consistently.
- **CH9 retrieval set vs tuple**: `R_{k_R}(q)` reframed from set to
  ordered tuple, with explicit nod to lost-in-the-middle.

### Wave 10.4 — Selected pedagogical additions

- **CH1**: end-to-end ECE worked example (`K=3`, `N=12`, with empty
  middle bin) that operationalises the empty-bin convention from
  Wave 10.2.1 and demonstrates the small-sample caveat numerically.
- **Body-of-work reminders** added inline where the existing prologue
  lineage didn't already cover the territory:
  - **CH6**: Jacobs/Jordan/Nowlan/Hinton 1991 on gated mixtures of
    experts and the broader conditional-computation tradition before
    the modern MoE machinery.
  - **CH8**: Thurstone's 1927 law of comparative judgment and the Elo
    rating system before the Bradley-Terry model.
  - **CH9**: classical IR lineage (TF in the 1950s, Spärck Jones IDF
    in 1972, Robertson-Walker in the 1990s) before BM25.
  - **CH10**: Leveson's STPA, FMEA in aerospace, and ISO 12100 before
    the hazard taxonomy.
  - **CH11**: Erlang's 1909 telephone-exchange paper, Kendall's
    notation, and Kleinrock 1975 before the M/M/1 derivation.

### Items deferred from Wave 10

The following review items were considered and not implemented:

- Most prerequisite recap boxes from the reviewer's pedagogical
  addenda (log/exp, softmax saturation, indicator predicates, etc.).
  Rationale: the Preface explicitly assumes undergraduate quantitative
  background, so these duplicate the stated baseline.
- Standalone numerical toys that did not simultaneously fix a P1.
- Body-of-work reminders for chapters whose existing prologue already
  covers the lineage adequately.

## Earlier waves (summary)

- **Waves 1–4** (early 2026): expanded each week from outline to
  ~20-page deep-dive; built notation index; added TikZ figures;
  strengthened FAIL chapters (CH1 Foundations, CH9 RAG/Tools/Eval,
  CH10 Governance, CH11 APIs/Agents/MCP); polished marginal-FAIL and
  PASS chapters; harmonisation pass.
- **Wave 5** (April 2026): added Sagan-voiced *Setting the Scene*
  prologues to all 11 chapters with a four-beat narrative structure
  (problem → lineage → current practice → failure modes).
- **Wave 6** (April 2026): added Chapter 12 (a human-centric model for
  understanding LLM errors), a synthesis chapter that maps the five
  axes (structure, meaning, context, groundedness, environment) onto
  every prior chapter's technical mechanisms.
- **Waves 7–9** (April 2026): produced standalone articles in the
  `article/` directory derived from CH12: an IEEE Spectrum-style
  engineering long-form, a legal long-form, and a legal one-page
  brief. The articles received their own hedging and tightening
  passes; some hedges were back-ported to CH12.
