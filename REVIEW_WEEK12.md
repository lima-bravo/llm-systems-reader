<!-- markdownlint-disable MD022 MD032 -->
# REVIEW_WEEK12 — Detailed Chapter Audit

## Scorecard (0-3)
- Math continuity: 1
- Derivation sufficiency: 1
- Notation discipline: 2
- Assumption/claim typing: 2
- Writing clarity/unambiguity: 2
- VOICE `Setting the Scene` compliance: 3

## Detailed Issues
1. **P1** Five predicates are binary but not operationalized with measurable tests; add diagnostics and thresholds.
2. **P1** A12.3 contains over-absolute impossibility wording; reframe as insufficiency of training alone.
3. **P1** Ladder ordering is asserted empirical without anchored evidence.
4. **P1** Non-orthogonal axes are acknowledged but procedure remains mostly single-axis; add multi-label handling rule.
5. **P1** Environment sufficiency definition is non-identifiable; define minimum task-conditioned information set.
6. **P2** “Chapter” vs “Week” naming drifts.
7. **P2** Remedy suggestions lack explicit “works-when/fails-when” bounds.
8. **P2** Ground-truth assumptions ignore partial observability in real settings.
9. **P2** User-facing clarity goal conflicts with dense prose in some sections.
10. **P2** Normative “correct vs right” claims need direct governance metric links.
11. **P2** Only one worked example; add non-code high-stakes example.
12. **P2** Cross-week references lack explicit equation anchors.

## VOICE.md Audit (`Setting the Scene`)
- Pass: full four-beat structure.
- Pass: concrete opening with human-scale context.
- Pass: strong lineage and transition to framework/math.
- Pass: tone guardrails respected.
- Fail: some generalizations need explicit uncertainty qualifiers.

## Ambiguity Audit
1. “five axes form a ladder” -> may imply strict causality hierarchy.
2. “failures inevitable unless human compensates” -> over-absolute.
3. “no native grounding” -> should scope to base model without tools.
4. “fix is rarely ask again” -> frequency claim without context.
5. “held loosely” -> metaphor lacking operational instruction.

## Cross-Week Dependency Checks
### Incoming
- Week 1/5 objective semantics for meaning/grounding claims.
- Week 9 retrieval/tool mechanisms for grounding/environment remedies.
- Week 10 hazard/incident governance framing.
- Week 11 structured I/O and trust boundary mechanisms.

### Outgoing
- Week 10 incident taxonomy and assurance-case evidence classes should map to ladder categories.
- Week 11 runbooks should encode context-vs-environment distinction explicitly.

### Symbols/Equations to regression-check after edits
- `eq:week12-structure`, `eq:week12-meaning`, `eq:week12-context`, `eq:week12-grounding`, `eq:week12-environment`, assumptions A12.1-A12.3.

## Undergraduate Learning-Curve Risk Addendum

### Learning Objective -> Math Exposition Gaps
- **LO: apply five-axis model reliably**; **risk point:** binary predicate notation arrives before operational examples; **fix:** add plain-language checklist before formal predicates.
- **LO: perform ladder-based diagnosis**; **risk point:** assumptions appear before full diagnosis trace; **fix:** add one end-to-end axis-by-axis case walkthrough.
- **LO: connect axes to prior technical mechanisms**; **risk point:** many prior-week concepts are recalled simultaneously; **fix:** add axis -> prior mechanism mini-table.
- **LO: reason about axis overlap and limits**; **risk point:** non-orthogonality stated but not demonstrated; **fix:** add dual-failure example (context + grounding).
- **LO: communicate diagnosis to non-specialists**; **risk point:** framework-to-action language bridge is weak; **fix:** add engineer phrasing -> user phrasing -> action templates.

### Body-of-Work Reminder Insertions
- Before grounding/meaning split, re-anchor symbol-grounding and form-vs-meaning debate.
- Before context/pragmatics axis, restate cooperative-communication tradition briefly.
- Before structure remedies, remind Week 11 structured-output/contract mechanisms.
- Before grounding remedies, remind Week 9 retrieval/tool verification pathways.

### Prerequisite Recap Boxes To Add
- Indicator predicate logic for diagnostic gates.
- Plausibility vs truth under cross-entropy objectives.
- Retrieval/verification fundamentals for grounded correction.
