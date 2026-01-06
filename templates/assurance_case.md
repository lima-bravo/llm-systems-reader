i# AI Assurance Case

## System Description
- System name:
- Intended use:
- Users:
- Operational context:
- Out-of-scope uses:

---

## Top-Level Claim (C0)
The system is acceptably safe and fit for purpose in its intended context.

---

## Subclaims

### C1: The system provides reliable outputs within defined constraints
**Evidence:**
- Offline evaluation results
- Regression tests
- RAG grounding checks

**Assumptions:**
- Input distribution remains within expected bounds

---

### C2: The system fails safely under error conditions
**Evidence:**
- Fallback behavior tests
- Human override paths
- Logging and alerting

---

### C3: Human users are supported in appropriate trust calibration
**Evidence:**
- UI affordances
- Uncertainty signaling
- User training material

---

## Residual Risks
- Known hallucination modes
- Distribution shift
- Overtrust under time pressure

---

## Review & Ownership
- Responsible owner:
- Review cadence:
- Incident response owner:

