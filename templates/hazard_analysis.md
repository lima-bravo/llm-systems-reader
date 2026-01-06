# Hazard Analysis (LLM System)

| Hazard | Cause | Impact | Likelihood | Controls | Residual Risk |
|------|------|--------|------------|----------|---------------|
| Hallucinated answer | Missing retrieval | Incorrect decision | Medium | RAG + citations | Medium |
| Overtrust | Polite fluent output | User misuse | High | UI warnings | Medium |
| Prompt injection | Retrieved content | Policy bypass | Medium | Sanitization | Low |
| Tool misuse | Incorrect call | External damage | Low | Permissioning | Low |

