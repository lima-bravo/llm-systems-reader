# REVIEW_CH1 — Full-Manuscript Editorial and Technical Review Framework

## A) Executive Diagnosis (max 12 bullets)

- P0 mathematical followability risk: multiple chapters still assert key identities without enough intermediate derivation lines for a mathematically trained reader to reconstruct results locally.
- P0 notation collision risk remains high for shared symbols (`alpha`, `beta`, `N`, `D`, `k`, `r`, `C`) across scaling, optimization, MoE, LoRA, DPO, and RAG contexts.
- P0 assumption opacity: modeling assumptions are often implicit (distributional assumptions, calibration regime, routing independence, retrieval freshness, queueing approximations).
- P0 claim-type mixing: theorem-level identities, empirical findings, engineering heuristics, and operational caveats are often co-located without explicit labels.
- P0 chapter bridge fragility: prerequisites are not always reactivated before advanced sections, forcing readers to retrieve prior chapter content from memory.
- P1 acronym load is high in system chapters; acronym-first use is inconsistent, increasing cognitive switching cost.
- P1 worked numeric examples are unevenly distributed; chapters with heavy systems math (Weeks 6, 9, 11) need more concrete computations.
- P1 derivation granularity is inconsistent within chapters; some sections use derivation blocks while adjacent sections revert to assertion style.
- P1 narrative setup quality is uneven; some chapter openings establish motivation and scope well, others transition into notation too abruptly.
- P2 references and figures are generally strong but not always tied back to explicit mathematical checkpoints.
- P2 learning objectives are present but are not always mapped to auditable proof/derivation outcomes.
- P2 final “proved vs assumed” recaps are not yet systematic, limiting retention and final-stage QA.

## B) Review Plan (phased)

### Phase 1: Global inventory

- Inputs
  - `weeks/week01_*.tex` through `weeks/week12_*.tex`
  - Existing inventory artifact: `phase1_inventory.md`
  - `preamble.tex` macros for notation/derivation/claim labels
- Method
  - Build and validate global maps: notation, assumptions, derivations, claim types, acronym first-use table.
  - Confirm naming-collision resolutions and canonical symbol policy.
  - Tag each chapter with prerequisite dependencies and bridge obligations.
- Output artifact
  - Updated `phase1_inventory.md` with resolved collision list and chapter-local symbol dictionaries.
  - `global_review_register.md` with P0/P1/P2 defect ledger.
- Estimated effort
  - 0.75-1.0 editorial days.

### Phase 2: Chapter-level audit

- Inputs
  - Phase 1 maps + each `weeks/weekNN_*.tex`
  - Learning objectives and section-level structure per chapter
- Method
  - Run reusable rubric (Section C) chapter by chapter.
  - Score each criterion on 0-3 scale; assign defect severity and explicit fix ticket.
  - For every failed criterion, record exact missing step type (definition, transition identity, algebraic rearrangement, conditioning move, approximation caveat).
- Output artifact
  - `chapter_audit/weekNN_audit.md` for each chapter with scorecard and fix backlog.
- Estimated effort
  - 0.5 day per chapter x 12 chapters = 6 editorial days.

### Phase 3: Cross-chapter harmonization

- Inputs
  - All chapter audits + global defect ledger
  - Dependency graph and notation policy
- Method
  - Resolve symbol and acronym drift globally.
  - Enforce shared templates for notation boxes, derivation blocks, claim labels, and recap blocks.
  - Verify each chapter’s opening narrative and closing bridge align with dependency graph.
- Output artifact
  - `harmonization_report.md` with resolved issues and residual exceptions.
- Estimated effort
  - 1.5-2.0 editorial days.

### Phase 4: Final pedagogical coherence pass

- Inputs
  - Harmonized manuscript + final compiled PDF
  - QA checklist (Section G)
- Method
  - Perform strict “cold read” pass per chapter for memory burden and reconstructability.
  - Validate each learning objective has at least one explicit derivation/proof checkpoint.
  - Confirm no unresolved P0 items remain.
- Output artifact
  - `final_editorial_signoff.md` with pass/fail gate.
- Estimated effort
  - 1.0-1.5 editorial days.

## C) Chapter Review Rubric (reusable)

Scoring scale:
- `0` = missing / unusable
- `1` = present but insufficient
- `2` = mostly adequate with localized gaps
- `3` = complete and auditable

| Criterion | 0 | 1 | 2 | 3 |
|---|---|---|---|---|
| Derivation completeness | Key equations asserted only | Some intermediate lines, major jumps remain | Most key equations reconstructable, minor omissions | All core identities reconstructable from local text |
| Notation consistency | Symbol chaos or undefined symbols | Frequent redefinition/collision | Mostly consistent, occasional collisions | Fully consistent, all symbols introduced/reintroduced |
| Assumption transparency | Assumptions absent | Implicit assumptions dominate | Assumptions mostly stated, some hidden dependencies | Explicit assumptions with IDs and local scope |
| Theorem/empirical/heuristic separation | No labeling | Labels sporadic/inconsistent | Labels mostly present | Every substantive claim typed and auditable |
| Example sufficiency | No worked examples | Examples too sparse/shallow | Adequate examples in key sections | Strong numeric examples at every difficult transition |
| Bridge quality to next chapters | No prerequisite or forward bridge | Weak bridge statements | Clear but incomplete bridge map | Explicit prerequisite refresh + forward dependency guidance |

Pass/fail thresholds:
- Chapter pass condition: each criterion `>= 2` and total score `>= 14/18`.
- Manuscript pass condition: no chapter criterion below `2`; no unresolved P0 item; cross-chapter notation collision count = `0`.
- Automatic fail triggers:
  - Any core objective equation with derivation score `0-1`.
  - Any unresolved CRITICAL symbol collision (`alpha`, `beta`, etc.).
  - Any chapter with missing “proved vs assumed” recap.

## D) Priority Backlog

### P0 — Must-fix for mathematical correctness/followability

1. Enforce stepwise derivations for designated core identities.
- Rationale: direct determinant of reconstructability.
- Target section type: derivation-heavy subsections (Weeks 1, 2, 4, 5, 7, 8, 9, 11).
- Expected reader benefit: removes inferential jumps.
- Estimated edit effort: high.

2. Resolve all CRITICAL symbol collisions globally.
- Rationale: ambiguity creates hidden logical errors.
- Target section type: notation blocks + equation environments.
- Expected reader benefit: unambiguous semantic tracking.
- Estimated edit effort: medium-high.

3. Add explicit assumption IDs at first use in each chapter.
- Rationale: separates model assumptions from derivable consequences.
- Target section type: chapter preface + first formal subsection.
- Expected reader benefit: cleaner inferential boundaries.
- Estimated edit effort: medium.

4. Label all substantive claims (Definition/Identity/Assumption/Empirical/Consequence).
- Rationale: prevents claim-type conflation.
- Target section type: concept and derivation prose.
- Expected reader benefit: faster trust calibration.
- Estimated edit effort: medium.

### P1 — Should-fix for continuity/cognitive load

5. Standardize chapter-local “Notation and Assumptions” preface.
- Rationale: reduces memory retrieval burden.
- Target section type: early chapter sections.
- Expected reader benefit: lower context-switch cost.
- Estimated edit effort: medium.

6. Add one worked numeric example per technically dense subsection.
- Rationale: grounds abstractions operationally.
- Target section type: systems math and resource-budget sections.
- Expected reader benefit: improved transfer to engineering practice.
- Estimated edit effort: medium.

7. Add “What was proved vs assumed” recap before chapter close.
- Rationale: consolidates inferential structure.
- Target section type: chapter end.
- Expected reader benefit: stronger retention and exam-like review utility.
- Estimated edit effort: low-medium.

### P2 — Nice-to-have polish

8. Harmonize narrative opening style across chapters.
- Rationale: consistency in reader onboarding.
- Target section type: `Setting the Scene`.
- Expected reader benefit: smoother progression chapter to chapter.
- Estimated edit effort: low.

9. Ensure every acronym has first-use expansion in chapter scope.
- Rationale: local readability without global scanning.
- Target section type: prose around tooling/systems sections.
- Expected reader benefit: reduced decoding friction.
- Estimated edit effort: low.

## E) Standardized Edit Patterns

### 1) “Notation and Assumptions” box template

```
\begin{notationbox}[Notation and Assumptions]
\textbf{Objects.} ...
\textbf{Symbols.} ...
\textbf{Assumptions.} [A#.1] ..., [A#.2] ...
\textbf{Scope.} Assumptions hold for Sections X-Y unless overridden.
\end{notationbox}
```

### 2) “Derivation” block template

```
\begin{derivation}[Title]
Start from ...
\[
  ... = ... \quad (\text{by Definition ...})
\]
\[
  ... = ... \quad (\text{by algebra / identity ...})
\]
Therefore, ...
\end{derivation}
```

### 3) “Claim type” label template

```
\Defn\ ...
\Ident\ ...
\Asm\ [A#.k] ...
\Emp\ ...
\Cons\ ...
```

### 4) “Worked Example” template

```
\begin{example}[Worked numeric check]
Given ..., compute ...
Step 1: ...
Step 2: ...
Result: ...
Interpretation: ...
\end{example}
```

### 5) “Proved vs Assumed” recap template

```
\begin{recapbox}[Proved vs Assumed]
\textbf{Proved in this chapter:} ...
\textbf{Assumed in this chapter:} ...
\textbf{Empirical claims used:} ...
\textbf{Dependencies for next chapter:} ...
\end{recapbox}
```

## F) Sample Application (Representative Chapter: Week 7)

Representative target: `weeks/week07_adaptation_lora_quantization.tex`.

### Week 7 rubric snapshot

| Criterion | Score (0-3) | Reason |
|---|---:|---|
| Derivation completeness | 2 | Strong LoRA compression derivation exists; QLoRA/NF4 and some memory-cost transitions remain partly asserted. |
| Notation consistency | 2 | Good local notation block, but shared global collisions (`alpha`, `beta`, `r`) still require harmonized policy linkage. |
| Assumption transparency | 2 | A7 assumptions are introduced, but several empirical caveats are prose-only and not tagged consistently. |
| Theorem/empirical/heuristic separation | 2 | Labels are present, but not uniform across all key claims. |
| Example sufficiency | 3 | Includes concrete 7B/70B memory and FLOP examples. |
| Bridge quality to next chapters | 2 | Links to deployment reality are present; explicit bridge obligations to Week 8/11 can be sharper. |

Current total: `13/18` (fails threshold by one point, needs targeted edits).

### At least 8 concrete improvement points (editorial intent)

1. Add explicit statement that LoRA’s `alpha/r` is a scaling convention, not a theorem-level optimality result.
- Before intent: practical convention stated as design fact.
- After intent: classify as engineering heuristic with citation scope.

2. In the low-rank adequacy discussion, convert prose caveat to explicit assumption/counterexample structure.
- Before intent: warning embedded in narrative.
- After intent: `[A7.1]` and “failure mode” consequence block.

3. For the adapter memory budget equation, add a one-line dimensional/unit check.
- Before intent: formula presented without audit check.
- After intent: bytes accounting made auditable.

4. Expand QLoRA paragraph to separate three claim types: quantization mechanism, gradient flow path, benchmark-contingent quality claim.
- Before intent: mixed mechanism + empirical claim.
- After intent: clean split into `Identity`, `Assumption`, `Empirical`.

5. Add explicit definition of NF4 block-scale overhead term used in memory estimates.
- Before intent: overhead term appears in prose.
- After intent: variable definition and scope made formal.

6. Add bridge sentence linking Week 7 adapter/quantization choices to Week 11 serving metrics (latency/cost).
- Before intent: implied deployment connection.
- After intent: explicit dependency mapping.

7. Add mini example showing how rank sweep (`r={4,8,16,32,64}`) changes trainable parameter ratio for one layer shape.
- Before intent: rank sweep recommended qualitatively.
- After intent: quantitative decision aid.

8. Normalize acronym first-use sequence in chapter (PEFT, QLoRA, NF4, GPTQ, AWQ, DoRA, AdaLoRA).
- Before intent: mostly expanded but sequence not systematically enforced.
- After intent: first-use expansions guaranteed locally.

### One fast derivation converted to stepwise version

Target identity: LoRA trainable fraction
\[
\rho_{\mathrm{LoRA}} = \frac{r(d+k)}{dk}
\]

Stepwise intent:
1. Full fine-tuned layer parameters: `|W| = d k`.
2. LoRA trainables: `|A| + |B| = rk + dr = r(d+k)`.
3. Ratio by definition: `rho = |LoRA| / |full-FT|`.
4. Substitute counts: `rho = r(d+k)/(dk)`.
5. Regime note for `d \approx k`: `rho \approx 2r/d`.

This converts a compact statement into an auditable derivation with explicit counting assumptions.

## G) Consistency Checklist for Final QA

- Every chapter begins with a local notation+assumptions box.
- Every symbol is introduced before first use; reused symbols are reintroduced after long gaps.
- No unresolved CRITICAL/HIGH collision from the global notation map.
- Every core objective equation appears in a derivation block with intermediate lines.
- Every substantive claim is typed as Definition/Identity/Assumption/Empirical/Consequence.
- Assumptions are indexed (`A#.k`) and referenced at use sites.
- Worked numeric examples exist for each technically dense subsection.
- Chapter has explicit “proved vs assumed” recap before closing.
- Chapter end includes dependency bridge to next chapter(s).
- Acronyms are expanded at first local use.
- Figures/tables are referenced from text and tied to specific mathematical claims.
- Final build passes and chapter score satisfies pass threshold (`>=14/18`, no criterion below `2`).
