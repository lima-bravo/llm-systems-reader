# A One-Page Diagnostic for AI Errors in Legal Work

*Five questions to ask when an AI-assisted draft looks plausible but is not quite right.*

**Lodewijk Bonebakker** · April 2026

> *Drafting assistance: Claude Opus 4.7 (Anthropic). The author is not a practicing attorney; this is framework, not legal advice.*

---

After *Mata v. Avianca* [1] and the Stanford RegLab finding of 17–33% hallucination rates even in retrieval-grounded legal AI tools [2], firms have learned to fear hallucination. But "the AI hallucinated" is a catch-all that covers at least five distinguishable failures, each with a different cause and a different remedy. Catching only fabricated cases leaves four other failure modes unchecked. Walk the ladder bottom-up:

**1. Structure — is the output well-formed?** Bluebooked citations, consistent defined terms, correct filing format. Easy to catch with linters, citation checkers, and contract validators. Necessary, not sufficient: a correctly formatted document can still be wrong about everything else.

**2. Meaning — is it internally coherent?** A contract whose recitals contradict its covenants; a redlined clause that inverts the risk allocation; a memo whose conclusion does not follow from the analysis. Detectable by careful reading without recourse to outside sources. Domain expertise unmasks the subtle ones.

**3. Context — is it appropriate for the situation?** A demand letter in aggressive tone when the client wants to preserve the commercial relationship; a research memo surveying federal law for a state-court matter; a brief written for the wrong audience. The reviewer can usually name what is wrong; the fix is to give the model more of the situation, in writing.

**4. Groundedness — do the legal claims connect to actual law?** Fabricated cases, misquoted holdings, overruled authority cited as good law. The post-*Mata* danger zone, and the one the profession has learned hardest. Verify any cited authority that matters; treat AI claims as hypotheses; mandate KeyCite or Shepard's verification. Verification of groundedness is now table stakes.

**5. Environment — did the prompt encode what you know?** The model does not know the partner's strategic posture, the local court's standing orders, the client's risk tolerance, or the matter's history. The output can be fluent, internally coherent, properly grounded, and still wrong because the question itself was underspecified. The lawyer's job is to write the situation into the prompt; no automated tool can do this for the lawyer.

**Bottom line.** Structure and groundedness are largely tooling problems. Meaning, context, and environment are where the lawyer's judgment is most clearly indispensable, and where the continuing duty of competence and supervision under ABA Formal Opinion 512 [3] most clearly applies. A firm that wants to reduce groundedness errors should invest in retrieval and citation auditing. A firm that wants to reduce environment errors should invest in training, templates, and reviewer practice. Knowing which rung you are on tells you which budget line to charge.

---

[1] *Mata v. Avianca, Inc.*, No. 22-cv-1461, 2023 WL 4114965 (S.D.N.Y. June 22, 2023). [2] V. Magesh, F. Surani, M. Dahl, M. Suzgun, C. D. Manning, D. E. Ho, "Hallucination-Free? Assessing the Reliability of Leading AI Legal Research Tools," Stanford RegLab / HAI, 2024. [3] ABA Formal Opinion 512, *Generative Artificial Intelligence Tools*, July 29, 2024.
