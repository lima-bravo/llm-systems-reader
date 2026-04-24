

# Review Framework for LLM Systems Reader

## A) Executive Diagnosis

- Mathematical rigor is high, but derivational pacing is uneven; key transitions often skip intermediate algebra that a reader would otherwise reconstruct mentally.
- Notation is mostly coherent locally, but global symbol reuse across chapters risks overload without a manuscript-wide notation index.
- Definitions, assumptions, and engineering implications are frequently adjacent in prose, which can blur epistemic status.
- Several core identities are asserted correctly but not operationally unpacked (insufficient “how this follows” scaffolding).
- Log base and unit conventions (nats vs bits) are present in places but should be enforced globally and repeatedly.
- Empirical claims (e.g., typical calibration behavior) need explicit tagging as distribution-dependent observations, not universal theorems.
- Chapter bridges exist, but prerequisite dependency tracking is implicit rather than explicit; this increases memory burden.
- Worked numeric examples are strong where present, but coverage is inconsistent across concept classes (loss, calibration, decoding, scaling).
- Figures support intuition, but figure-to-equation linkage can be tightened with explicit “this equation predicts this curve” references.
- Labs are well-aligned conceptually, but audit should verify one-to-one mapping between theorem-level claims and testable lab artifacts.
- Cross-chapter terminology drift is the most likely source of confusion for mathematically trained readers moving sequentially through all weeks.
- The highest-value improvement is a standardized “Notation & Assumptions + Derivation Ledger + Proved vs Assumed” pattern in every chapter.

---

## B) Review Plan (Phased)

### Phase 1: Global Inventory

- **Inputs**
  - `main.tex`, `preamble.tex`, all `weeks/*.tex`, `figures/*.tex`, `labs/**`, `references.bib`
- **Method**
  - Build 3 inventories:
    1. Notation map (symbol, meaning, first introduction, later reuse)
    2. Assumptions map (statistical, optimization, data, evaluation, deployment)
    3. Derivation map (key equation chains and omitted intermediate steps)
  - Tag each claim as: Definition / Identity / Assumption / Empirical / Consequence.
- **Output Artifact**
  - `phase1_inventory.md` with normalized tables and conflict flags.
- **Estimated Effort**
  - 1.5–2.5 reviewer-days.

### Phase 2: Chapter-Level Audit

- **Inputs**
  - Phase 1 outputs + each chapter file
- **Method**
  - Apply reusable rubric (Section C) chapter-by-chapter.
  - For each key equation, mark reconstructability:
    - R0 fully reconstructable
    - R1 minor missing step
    - R2 significant inferential gap
    - R3 not reconstructable from local context
  - Produce severity-scored findings and concrete edit intents.
- **Output Artifact**
  - `phase2_chapter_audit.md` with per-chapter scorecards and issue lists.
- **Estimated Effort**
  - 3–5 reviewer-days.

### Phase 3: Cross-Chapter Harmonization

- **Inputs**
  - Phase 1/2 outputs
- **Method**
  - Resolve notation collisions and inconsistent assumptions.
  - Enforce uniform claim labeling and derivation-block conventions.
  - Standardize recap structures and bridge paragraphs.
- **Output Artifact**
  - `phase3_harmonization_matrix.md` + chapter patch list.
- **Estimated Effort**
  - 1.5–3 reviewer-days.

### Phase 4: Final Pedagogical Coherence Pass

- **Inputs**
  - Harmonized chapters + figures/labs alignment checks
- **Method**
  - Validate cognitive flow, prerequisite refresh frequency, and example coverage.
  - Run final QA checklist (Section G) per chapter.
- **Output Artifact**
  - `phase4_release_readiness.md` with pass/fail by chapter.
- **Estimated Effort**
  - 1–2 reviewer-days.

---

## C) Chapter Review Rubric (Reusable)

Scoring scale for each dimension:  
- `0` = unacceptable / missing  
- `1` = partial / fragile  
- `2` = acceptable with moderate gaps  
- `3` = strong / publication-ready

| Dimension | 0 | 1 | 2 | 3 |
|---|---|---|---|---|
| Derivation completeness | Core equations asserted without path | Frequent omitted steps | Most key paths shown, some jumps | All key paths have traceable intermediate steps |
| Notation consistency | Untracked symbol drift | Multiple overload conflicts | Mostly consistent with minor collisions | Globally consistent, indexed, reintroduced after long gaps |
| Assumption transparency | Assumptions implicit | Some assumptions stated ad hoc | Assumptions mostly explicit | Assumptions explicit, localized, and cross-referenced |
| Claim-type separation | Definitions/theorems/observations mixed | Inconsistent labeling | Mostly separated | Fully labeled and epistemically clean |
| Example sufficiency | No/weak examples | Sparse examples not aligned to hardest concepts | Adequate examples with partial coverage | Worked examples cover all high-load concepts |
| Bridge quality to next chapters | No dependency guidance | Vague bridges | Useful bridges with some missing prerequisites | Explicit dependency map and recall anchors |

### Pass/Fail Thresholds

- **Chapter pass**: no dimension below `2`, and average score `>= 2.3`.
- **Manuscript pass**: all chapters pass, and cross-chapter notation/assumption conflicts = `0` unresolved.
- **Critical fail trigger**: any chapter with Derivation completeness `<=1` on foundational sections.

---

## D) Priority Backlog

### P0 (Must-Fix)

1. **Add chapter-open “Notation & Assumptions” block**
   - **Rationale**: eliminates implicit prerequisite recall.
   - **Target**: opening subsection of every week.
   - **Benefit**: immediate context grounding.
   - **Effort**: M (2–4 hours/chapter).

2. **Expand all core equation chains with intermediate lines**
   - **Rationale**: reconstructability is central requirement.
   - **Target**: objective derivations, information-theory identities, calibration formulas.
   - **Benefit**: removes inferential jumps.
   - **Effort**: M–L (3–6 hours/chapter).

3. **Introduce strict claim-type labels**
   - **Rationale**: prevents theorem/empirical conflation.
   - **Target**: all mathematically substantive subsections.
   - **Benefit**: epistemic clarity and auditability.
   - **Effort**: M.

4. **Resolve global notation collisions**
   - **Rationale**: symbol overload degrades followability.
   - **Target**: cross-chapter symbol map.
   - **Benefit**: lower cognitive load.
   - **Effort**: L (1–2 days).

### P1 (Should-Fix)

5. **Add “Proved vs Assumed” recap at end of each major section**
   - **Rationale**: supports retention and review loops.
   - **Target**: section endings.
   - **Benefit**: memory offloading.
   - **Effort**: S–M.

6. **Standardize unit/log conventions at first and repeated use**
   - **Rationale**: avoids silent bits/nats ambiguity.
   - **Target**: entropy/perplexity/calibration sections.
   - **Benefit**: numerical interpretability.
   - **Effort**: S.

7. **Ensure each high-load concept has one worked numeric example**
   - **Rationale**: bridges symbolic and operational understanding.
   - **Target**: loss, sampling, calibration, adaptation metrics.
   - **Benefit**: stronger conceptual lock-in.
   - **Effort**: M.

8. **Tie each key figure to governing equation explicitly**
   - **Rationale**: improves model-to-visual mapping.
   - **Target**: caption and nearby text.
   - **Benefit**: clearer interpretation path.
   - **Effort**: S–M.

### P2 (Nice-to-Have)

9. **Add cross-chapter dependency graph**
   - **Rationale**: supports non-linear reading.
   - **Target**: front matter or appendix.
   - **Benefit**: navigation and prerequisite management.
   - **Effort**: M.

10. **Add mini “derivation ledger” appendix per chapter**
   - **Rationale**: quick reference for review.
   - **Target**: chapter end.
   - **Benefit**: revision efficiency.
   - **Effort**: M.

---

## E) Standardized Edit Patterns

### 1) “Notation and Assumptions” Box Template

```latex
\paragraph{Notation and Assumptions.}
We write random variables in uppercase (e.g., $X$) and realizations in lowercase (e.g., $x$).
Expectations $\E[\cdot]$ are with respect to [distribution].
Logs are natural unless stated otherwise; entropy is in [nats/bits].
Assumptions used in this section: [A1], [A2], [A3].
```

### 2) “Derivation” Block Template

```latex
\paragraph{Derivation (Stepwise).}
Starting from [Eq. label]:
\begin{align}
\text{(1)}\quad & ... \\
\text{(2)}\quad & ... \quad \text{(by [identity/assumption])} \\
\text{(3)}\quad & ... \\
\text{(4)}\quad & ... = \text{target expression}.
\end{align}
```

### 3) Claim-Type Label Template

```latex
\paragraph{Definition.} ...
\paragraph{Identity.} ...
\paragraph{Assumption.} ...
\paragraph{Empirical Observation.} ...
\paragraph{Engineering Consequence.} ...
```

### 4) Worked Example Template

```latex
\paragraph{Worked Example.}
Given [numerical setup], compute:
1) ...
2) ...
3) ...
Interpretation: [what this number means operationally].
```

### 5) “Proved vs Assumed” Recap Template

```latex
\paragraph{Proved vs Assumed (Recap).}
\textbf{Proved here:} [P1], [P2].
\textbf{Assumed here:} [A1], [A2].
\textbf{Empirically observed:} [E1].
\textbf{Used later in Week N:} [bridge].
```

---

## F) Sample Application (Representative Chapter: Week 1)

### Rubric Snapshot (Week 1)

- Derivation completeness: `2`
- Notation consistency: `2`
- Assumption transparency: `2`
- Claim-type separation: `1`
- Example sufficiency: `2`
- Bridge quality: `3`

### Concrete Improvement Points (8)

1. **MLE objective transition**
   - **Before intent**: jumps from product likelihood to summed log-likelihood quickly.
   - **After intent**: insert explicit log-product expansion and token-count normalization line.

2. **NLL to empirical expectation**
   - **Before**: expectation form appears with minimal setup.
   - **After**: define empirical measure over token-context pairs before expectation notation.

3. **Cross-entropy/KL identity**
   - **Before**: identity stated as known fact.
   - **After**: add 3-line algebraic decomposition with term grouping.

4. **Softmax shift invariance**
   - **Before**: stated with implementation implication.
   - **After**: show explicit cancellation of `exp(c)` in numerator and denominator.

5. **Perplexity equivalence**
   - **Before**: monotonicity implication described verbally.
   - **After**: one-line formal implication: `argmin H = argmin exp(H)`.

6. **Calibration definition**
   - **Before**: formal condition given, then prose.
   - **After**: add finite-bin estimator derivation and small-sample caveat.

7. **ECE limitations**
   - **Before**: limitations listed.
   - **After**: provide two-bin numerical counterexample illustrating same ECE, different risk profile.

8. **Claim status marking**
   - **Before**: theorem-level and empirical statements mixed in paragraphs.
   - **After**: tag each as Identity vs Empirical Observation vs Consequence.

### Fast Derivation → Stepwise Derivation Example

**Target**: \(H(p,q)=H(p)+\mathrm{KL}(p\|q)\)

```latex
\paragraph{Derivation (Stepwise).}
\begin{align}
H(p,q)
&= -\sum_x p(x)\log q(x) \\
&= -\sum_x p(x)\log p(x) + \sum_x p(x)\log \frac{p(x)}{q(x)} \\
&= H(p) + \KL(p\|q).
\end{align}
```

---

## G) Consistency Checklist for Final QA

- [ ] Chapter starts with explicit notation and assumptions.
- [ ] Every key equation has a locally reconstructable derivation.
- [ ] No symbol appears without prior definition in chapter scope.
- [ ] Reused symbols after long gaps are reintroduced.
- [ ] Log base and units are explicit and consistent.
- [ ] Claims are tagged by epistemic type (Definition/Identity/Assumption/Empirical/Consequence).
- [ ] At least one worked numeric example exists for each high-load concept.
- [ ] Figures are explicitly tied to governing equations in text/captions.
- [ ] Section ends include “Proved vs Assumed” recap.
- [ ] Chapter bridge states prerequisites and exported results.
- [ ] Lab tasks map to mathematical claims being taught.
- [ ] References used for empirical claims are explicitly cited near the claim.
