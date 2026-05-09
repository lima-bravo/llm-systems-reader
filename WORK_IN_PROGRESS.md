# Work in Progress — Private Corpus / Vocabulary Gap Additions

*Started: 2026-05-09. Restart from here if session is interrupted.*

---

## What we are adding and why

The "missing information problem": deploying an LLM on a private corpus
(internal communications, research notes, proprietary documentation) that
it has never seen during training. The text currently has only 8 lines on
this in ch08. Four distinct failure layers need coverage:

1. **Tokenization fragmentation** — BPE vocabulary built on public data
   fragments private terms (project codes, product names, abbreviations)
   into sub-tokens whose composition doesn't encode the intended meaning.

2. **Embedding retrieval gap** — Dense retrieval maps private terms to
   wrong or near-zero regions of the semantic space. BM25 handles
   exact-match but not synonym/paraphrase retrieval across internal naming
   variations.

3. **Semantic collision (false-familiar)** — Common words with private
   meanings (`approval`, `sprint`, `platform`) are interpreted via their
   public-domain meanings. Wrong knowledge confidently applied; harder to
   detect than a gap.

4. **Confident confabulation of private entities** — Unknown project names,
   person names, and product codes are pattern-completed from public training
   distribution. No uncertainty signal is emitted.

---

## Three planned additions (in order)

### Step 1 — ch10: Primary treatment ← **DO THIS FIRST**

**File:** `weeks/ch10_llm_systems_rag_tools_evaluation.tex`

**Where:** After `\subsection{RAG-specific evaluation}` section
(currently ends around line 900), before the V-model / failure-modes
section. Alternatively, as a new subsection within the existing
`\subsection{RAG-specific evaluation}` block — check the surrounding
structure at runtime.

**Content to draft:**
- `\subsection{Private Corpus Deployment: The Vocabulary Gap}`
- Opening: why private corpora are structurally different from public ones
- Four failure layers (tokenization, embedding, semantic collision,
  confabulation) — each as a `\textbf{...}` paragraph
- Vocabulary overlap audit: how to measure fragmentation rate and
  OOV percentage before deployment
- Mitigations in priority order:
  1. Hybrid retrieval (BM25 + dense): BM25 handles exact-match on
     known private terms; dense handles semantic; reciprocal rank
     fusion combines them
  2. Glossary injection: structured term → definition table in the
     system prompt for the top-N private terms
  3. Domain embedding fine-tuning: fine-tune the bi-encoder on
     (query, relevant chunk) pairs from the private corpus
  4. Continued pretraining / vocabulary expansion: see ch08
- Cross-references: ch04 (tokenization), ch08 (adaptation)
- `\Emp` block: domain-specific models (BioBERT, LegalBERT) as evidence
  that public embeddings are insufficient for specialist corpora

### Step 2 — ch08: Adaptation strategies ← DO AFTER STEP 1

**File:** `weeks/ch08_adaptation_lora_quantization.tex`

**Where:** After the existing `\paragraph{Continued pretraining on
in-domain text.}` block (around line 788–796). Extend or follow it.

**Content to draft:**
- `\paragraph{Vocabulary expansion for private corpora.}` — adding new
  token entries to the tokenizer vocabulary, initialising their embedding
  rows (mean of sub-token embeddings or random), then fine-tuning only the
  embedding matrix on in-domain text
- `\paragraph{Domain embedding model fine-tuning.}` — fine-tuning the
  bi-encoder used for RAG (not the generative model) on
  (query, positive chunk, negative chunk) triplets from the private corpus;
  this directly fixes the retrieval gap at lower cost than full LLM
  fine-tuning
- Extend the existing data-quality warning: for private corpora the data
  is often noisy (communications, informal notes), and cleaning strategy
  matters more than volume
- Privacy note: fine-tuning encodes private vocabulary into weights;
  model access controls become data-access controls

### Step 3 — ch04: Tokenization diagnostic note ← DO AFTER STEP 2

**File:** `weeks/ch04_tokenization_embeddings.tex`

**Where:** Near the existing failure-modes or practical-consequences
discussion — search for "out-of-distribution" near lines 200–275, or
find the chapter's failure-modes section.

**Content to draft:**
- A `\Cons` or `\Emp` paragraph: before deploying on a private corpus,
  measure the **fragmentation rate** — the mean number of BPE tokens per
  word-type in the private vocabulary
- A word that tokenizes as a single token has a representation; one that
  fragments into 4+ sub-tokens probably doesn't
- Practical threshold: if >15% of unique word-types in the private corpus
  fragment into 3+ tokens, treat vocabulary gap as a deployment risk
- Forward references to ch08 (vocabulary expansion) and ch10
  (hybrid retrieval, glossary injection)

---

## Status

| Step | Status |
|------|--------|
| Step 1: ch10 primary treatment | ⬜ pending |
| Step 2: ch08 adaptation strategies | ⬜ pending |
| Step 3: ch04 tokenization note | ⬜ pending |
| editor.md update + commit | ⬜ pending |

---

## Key cross-references to use

- `\S\ref{sec:verification-cost-erosion}` — ch10 verification cost section
  (already exists)
- ch04 tokenization label: check with `grep -n "\\label" ch04_*.tex`
- ch08 adaptation section label: check at runtime
- Reference to add to `references.bib`:
  - Lee et al. 2020, BioBERT: `biobertlee2020` (check if already present)
  - Chalkidis et al. 2020, LegalBERT: `legalbert2020` (check if present)

---

*This file can be deleted once all steps are committed.*
