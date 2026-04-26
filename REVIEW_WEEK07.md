<!-- markdownlint-disable MD022 MD032 -->
# REVIEW_WEEK07 — Detailed Chapter Audit

## Scorecard (0-3)
- Math continuity: 2
- Derivation sufficiency: 2
- Notation discipline: 2
- Assumption/claim typing: 2
- Writing clarity/unambiguity: 2
- VOICE `Setting the Scene` compliance: 2

## Detailed Issues
1. **P1** LoRA memory byte-accounting mixes tensor roles; provide canonical optimizer-state tensor table.
2. **P1** FLOPs discussion over-flattens LoRA vs full FT differences; split forward/backward/update costs.
3. **P1** NF4 quantile formula presented as exact implementation; add didactic-vs-implementation distinction.
4. **P1** “single GPU fine-tune 65B” claim lacks config constraints.
5. **P2** Prompt tuning performance claims over-absolute; scope by cited setup.
6. **P2** “adapters compose linearly” needs interference/non-commutativity caveat.
7. **P2** Quantization error described as roughly uniform; replace with layer/channel-sensitive framing.
8. **P2** A7.2 outside-support statement too unconstrained; add practical monitoring bounds.
9. **P2** “near-parity” repeated without fixed acceptance metric.
10. **P2** Adapt-vs-retrieve bridge lacks formal decision rule.
11. **P2** Regulatory/deployment policy phrasing over-assertive without source.

## VOICE.md Audit (`Setting the Scene`)
- Pass: four beats in order and lineage present.
- Pass: uncertainty language present.
- Pass: no style guardrail violations.
- Fail: opening beat lacks concrete human-scale scene.
- Fail: forward transition into math is weak.

## Ambiguity Audit
1. “default within eighteen months” -> default for what scope.
2. “error roughly uniform” -> axis unspecified.
3. “compute savings are small” -> relative baseline not defined.
4. “tractable on single 48GB GPU” -> configuration unstated.
5. “adapters compose linearly” -> math vs behavior conflation.
6. “near-parity” -> no threshold.

## Cross-Week Dependency Checks
### Incoming
- Week 2 memory accounting equations.
- Week 5 compute scaling framing.
- Week 6 systems arithmetic assumptions.

### Outgoing
- Week 8 adapter-based alignment stages.
- Week 9 adapt-vs-retrieve tradeoff framing.
- Week 10 adapter registry/version governance controls.

### Symbols/Equations to regression-check after edits
- `Delta W=(alpha/r)BA`, `eq:week7-lora-mem`, NF4 quantization formulas and parity claims.

## Undergraduate Learning-Curve Risk Addendum

### Learning Objective -> Math Exposition Gaps
- **LO: derive LoRA parameter/memory/FLOPs vs full FT**; **risk point:** rapid move to multi-term memory accounting; **fix:** add stepwise `r(d+k)/dk` and symbol refresher.
- **LO: intrinsic dimensionality intuition**; **risk point:** conceptual claim lacks concrete linear algebra demonstration; **fix:** add `d=k=8, r=2` representability toy.
- **LO: compare PEFT families**; **risk point:** methods listed without unified mathematical template; **fix:** add one-line update equation table per method.
- **LO: number formats and quantization tradeoffs**; **risk point:** floating-point basics assumed; **fix:** add exponent/mantissa refresher and overflow toy.
- **LO: distinguish GPTQ/AWQ/SmoothQuant/NF4**; **risk point:** optimization targets not normalized; **fix:** add objective-centered comparison matrix.
- **LO: understand NF4 quantile construction**; **risk point:** inverse-CDF appears without stats recap; **fix:** add quantile computation mini-example.
- **LO: rollout/rollback from drift metrics**; **risk point:** math-to-operations bridge is weak; **fix:** add threshold-to-decision derivation.

### Body-of-Work Reminder Insertions
- Before LoRA memory budget, remind Week 2 memory accounting framework.
- Before intrinsic-dimension argument, restate intrinsic-dimension literature context.
- Before PTQ methods, remind compression lineage into LLM PTQ.
- Before NF4 equations, re-anchor to QLoRA assumptions as empirical.

### Prerequisite Recap Boxes To Add
- Rank and low-rank factorization essentials.
- Training memory/FLOPs accounting refresher.
- Quantization fundamentals (uniform vs non-uniform, calibration, error propagation).
