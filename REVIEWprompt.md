You are conducting a rigorous editorial and technical review of a LaTeX-based reader on Large Language Models aimed at engineers with strong mathematical training.

Goal
Produce a complete review plan and review framework for the entire text so that mathematically trained readers can follow derivations without needing to recall omitted intermediate steps from memory. Write this into REVIEW.md

Primary Review Criteria
1) Mathematical continuity
- Detect inferential jumps where equations move too quickly.
- Require intermediate derivation steps for all core identities and transformations.
- Verify definitions, assumptions, and conclusions are explicitly separated.

2) Notation discipline
- Ensure symbols are introduced before use and reintroduced when reused after long gaps.
- Enforce consistent notation across chapters (e.g., random variable vs realization, empirical vs population expectation, log base, units: bits/nats).
- Flag overloaded symbols and propose disambiguation.

3) Assumption visibility
- Require explicit statements of modeling assumptions (i.i.d., conditioning context, tokenization dependency, calibration setup).
- Mark where claims are theorem-level facts vs empirical observations vs engineering heuristics.

4) Proof/derivation sufficiency
- For each key equation, assess whether a mathematically trained reader can reconstruct the result from text alone.
- If not, specify exactly which intermediate lines are missing.
- Prioritize high-value expansions (MLE→NLL→cross-entropy, CE↔KL, softmax invariances, calibration metrics, perplexity properties).

5) Cognitive-load management
- Evaluate chapter structure for memory burden.
- Propose local “Notation & Assumptions” prefaces, “Derivation” blocks, and “What was proved vs assumed” summaries.
- Recommend where to add worked numeric examples and recap checkpoints.

Scope
- Review the entire reader, not just introductory files.
- Use chapter-by-chapter analysis plus cross-chapter consistency checks.
- Include references, figures, labs, and stated learning objectives where relevant to mathematical clarity.

Deliverables
Provide all output in this exact structure:

A) Executive Diagnosis (max 12 bullets)
- Most critical clarity risks in current manuscript.
- Top structural weaknesses affecting mathematical followability.

B) Review Plan (phased)
- Phase 1: Global inventory (notation map, assumptions map, derivation map).
- Phase 2: Chapter-level audit (per chapter checklist and severity scoring).
- Phase 3: Cross-chapter harmonization.
- Phase 4: Final pass for pedagogical coherence.
For each phase, include:
- Inputs
- Method
- Output artifact
- Estimated effort

C) Chapter Review Rubric (reusable)
- Scoring rubric (0–3 scale) for:
  - Derivation completeness
  - Notation consistency
  - Assumption transparency
  - Theorem/empirical/heuristic separation
  - Example sufficiency
  - Bridge quality to next chapters
- Define concrete pass/fail thresholds.

D) Priority Backlog
- Ranked list of edits by impact:
  - P0: Must-fix for mathematical correctness/followability
  - P1: Should-fix for continuity and reduced cognitive load
  - P2: Nice-to-have for polish
For each item: rationale, target section type, expected reader benefit, estimated edit effort.

E) Standardized Edit Patterns
- Provide reusable templates to apply across the manuscript:
  - “Notation and Assumptions” box template
  - “Derivation” block template
  - “Claim type” label template (Definition/Identity/Assumption/Empirical/Consequence)
  - “Worked Example” template
  - “Proved vs Assumed” recap template

F) Sample Application
- Demonstrate the rubric on one representative chapter.
- Identify at least 8 concrete improvement points with exact before/after editorial intent (no need to rewrite full chapter).
- Show how to convert one fast derivation into a stepwise version.

G) Consistency Checklist for Final QA
- A concise checklist an editor can run before publishing each chapter.

Constraints
- Do not rewrite the full manuscript.
- Focus on planning and review architecture first.
- Be precise, technical, and concrete; avoid generic writing advice.
- Keep recommendations actionable and auditable.

Style
- Formal, concise, mathematically literate.
- Use explicit criteria and operational definitions.
- Prefer checklists, scoring tables, and decision rules over prose.

Start now by producing section A through G.