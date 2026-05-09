<!-- markdownlint-disable MD022 MD032 -->
# REVIEW_WEEK08 — Detailed Chapter Audit

## Scorecard (0-3)
- Math continuity: 2
- Derivation sufficiency: 3
- Notation discipline: 2
- Assumption/claim typing: 2
- Writing clarity/unambiguity: 2
- VOICE `Setting the Scene` compliance: 2

## Detailed Issues
1. **P1** RLHF objective presentation mixes sequence-level formalism and token-level implementation without bridge text.
2. **P1** KL “strict upper bound” phrasing is too strong without proof assumptions.
3. **P1** Reward notation shifts (`r_phi`, `r`, implicit reward) are under-typed in transitions.
4. **P1** Support assumptions are too idealized; add effective support floor/clipping caveat.
5. **P2** Alignment-tax ranges are benchmark-dependent but framed generally.
6. **P2** PPO cost multiplier range lacks workload envelope.
7. **P2** Stage decomposition may be mistaken as fixed pipeline order.
8. **P2** Variant table implies stronger guarantees than evidence supports.
9. **P2** Governance responsibility claims need explicit Week 10 artifact links.
10. **P2** “DPO displaced RLHF” trend claim lacks domain qualifiers.
11. **P2** Dataset symbol drift (`D` vs `\mathcal{D}`) across sections.

## VOICE.md Audit (`Setting the Scene`)
- Pass: four-beat structure, lineage, and failure modes present.
- Pass: bridge to chapter mathematics exists.
- Fail: opening beat lacks concrete scene anchor.
- Fail: portions become manifesto-like instead of engineering-concrete.

## Ambiguity Audit
1. “DPO is simpler, more stable” -> stability regime unspecified.
2. “Most production teams mix approaches” -> “most” undefined.
3. “Alignment costs capability” -> capability metric unspecified.
4. “KL term does double duty” -> mechanism boundary unclear.
5. “mild under-regularization tendency” -> non-operational adjective.
6. “red teaming cost of doing business” -> no minimum control threshold.

## Cross-Week Dependency Checks
### Incoming
- Week 5 pretrained distribution and base-objective framing.
- Week 7 LoRA/adapter mechanics for alignment stages.
- Week 9 evaluation limits for alignment claims.

### Outgoing
- Week 9 must operationalize alignment outcomes via metrics/harnesses.
- Week 10 assurance and value documentation relies on Week 8 claim scoping.

### Symbols/Equations to regression-check after edits
- `eq:bt`, `eq:rm-loss`, `eq:rlhf`, `eq:dpo-optimum`, `eq:implicit-reward`, `eq:dpo`, assumptions A8.1-A8.3.

## Undergraduate Learning-Curve Risk Addendum

### Learning Objective -> Math Exposition Gaps
- **LO: derive RM objective from Bradley-Terry**; **risk point:** likelihood-to-loss conversion is compressed; **fix:** add one-triple likelihood expansion.
- **LO: interpret KL regularization in RLHF**; **risk point:** geometric intuition for drift control is missing; **fix:** add tiny distribution KL example across `beta` values.
- **LO: derive DPO chain cleanly**; **risk point:** partition-function cancellation is dense; **fix:** add numbered 5-step algebra block.
- **LO: support assumption implications**; **risk point:** measure-theoretic phrasing is abstract; **fix:** add toy zero-probability log-ratio failure case.
- **LO: compare preference objectives (DPO/IPO/KTO/ORPO/SimPO)**; **risk point:** no common template; **fix:** add unified objective-template table.
- **LO: connect objective misspecification to failure modes**; **risk point:** weak quantitative bridge; **fix:** add reward-hacking numeric toy where policy score rises but preference metric drops.

### Body-of-Work Reminder Insertions
- Before BT model, recap paired-comparison modeling tradition.
- Before PPO objective, re-anchor trust-region policy-optimization lineage.
- Before DPO derivation, remind max-entropy RL soft-optimum connection.
- Before constitutional/RLAIF content, restate normative-source shift.

### Prerequisite Recap Boxes To Add
- Logistic likelihood and gradient sign refresher.
- KL divergence asymmetry and regularization interpretation.
- Probability support and absolute continuity basics.
