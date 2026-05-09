<!-- markdownlint-disable MD022 MD032 -->
# REVIEW_WEEK04 — Detailed Chapter Audit

## Scorecard (0-3)
- Math continuity: 2
- Derivation sufficiency: 3
- Notation discipline: 2
- Assumption/claim typing: 2
- Writing clarity/unambiguity: 2
- VOICE `Setting the Scene` compliance: 2

## Detailed Issues
1. **P0** Causal masking direction is reversed in prose; correct future/past attention statement.
2. **P1** Variance derivation assumptions incomplete; add independence/uncorrelatedness condition across summands.
3. **P1** FLOP convention drifts (MAC=1 vs 2); declare and enforce one convention.
4. **P1** FlashAttention memory claim over-scoped; limit to attention-intermediate memory.
5. **P1** Pre-norm stability statement too absolute; make recipe-conditional.
6. **P1** RoPE extrapolation matrix cell is overly binary; add caveat wording.
7. **P1** Derivation ledger omits mask term while main equation includes it; sync.
8. **P2** Notation aliases (`d`, `d_model`) are not fully stabilized.
9. **P2** Citation placement for induction-head claim can be tightened.
10. **P2** “interpretable-ish” phrasing is informal for chapter tone.
11. **P2** Hardware tractability conclusion should include serving assumptions.

## VOICE.md Audit (`Setting the Scene`)
- Pass: four-beat sequence present.
- Pass: concrete framing and lineage included.
- Pass: transition to math included.
- Pass: failure modes are user-visible and concrete.
- Fail: some sentence density harms seminar-readability.

## Ambiguity Audit
1. “effective memory equal to full context length” -> clarify addressability vs reliable recall.
2. “no gradient-decay over distance” -> over-absolute.
3. “weak extrapolation” -> specify metric/task.
4. “GQA almost always better default” -> condition by workload.
5. “I/O-optimal up to constant” -> specify model/hardware assumptions.

## Cross-Week Dependency Checks
### Incoming
- Week 1 objective semantics and masking interpretation.
- Week 2 compute framing conventions.

### Outgoing
- Week 5 induction/ICL narrative dependency.
- Week 6 bandwidth and kernel discussion alignment.
- Week 7/9 KV-cache formulas and serving assumptions.

### Symbols/Equations to regression-check after edits
- Attention core equation and mask term, KV-cache memory equation, positional-encoding table wording.

## Undergraduate Learning-Curve Risk Addendum

### Learning Objective -> Math Exposition Gaps
- **LO: derive scaled dot-product attention**; **risk point:** variance argument assumptions are implicit; **fix:** add `Var(sum)=sum Var` derivation with `d_k=64` numeric check.
- **LO: shape/FLOP tracking**; **risk point:** large-scale FLOP totals appear before small example; **fix:** add toy `T=8,d=16,H=4` shape+FLOP walkthrough.
- **LO: causal masking with packing**; **risk point:** packed block-diagonal mask shown abstractly; **fix:** add two-document mask matrix example.
- **LO: pre-norm vs post-norm intuition**; **risk point:** Jacobian/identity-path logic is terse; **fix:** add short residual Jacobian derivation.
- **LO: RoPE relative property**; **risk point:** rotation algebra is dense; **fix:** add `d_k=4` numeric toy before formal result.
- **LO: KV cache and FlashAttention regime**; **risk point:** byte accounting appears abruptly; **fix:** add 8k/32k/128k memory table before kernel claims.

### Body-of-Work Reminder Insertions
- Before attention equation, restate Vaswani motivation (short path length vs recurrence).
- Before variance scaling, remind Week 2 variance scaling intuition.
- Before RoPE derivation, remind rotation/complex-number interpretation lineage.
- Before KV-cache formulas, restate autoregressive decode reuse principle.

### Prerequisite Recap Boxes To Add
- Matrix-shape sanity for attention (`QK^T` dimensions).
- Softmax saturation and gradient stability basics.
- Byte/unit conversion for systems memory math.
