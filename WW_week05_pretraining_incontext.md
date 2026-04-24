# Why & what: Week 5 — Pretraining, GPT-style models, in-context learning

**Maps to:** `weeks/week05_pretraining_incontext.tex`

## Gap

The chapter connects autoregressive objective, data cleaning at scale, sampling, and ICL. The *human* anchor is: **pretraining is unsupervised *next step* prediction; everything “task-like” is an emergent handle**, not a curriculum. “Emergent capabilities” debate risks drowning the simpler operational truth: **the prompt selects behaviors from a single engine**.

## What this chapter is for

- **What:** How a *decoder-only* model is created from web-scale text, how **prompting** steers the same object, and how **sampling** turns logits into an utterance.
- **Why:** So readers stop asking “did we teach it to summarize?” and ask “**does the pretraining+prompt distribution put mass on good summaries, and have we *measured* that?**”

## Suggested “one engine, many uses” blurb (after conceptual core)

> A pretrained autoregressive model is **one** conditional distribution. Instruction following, few-shot ICL, and “persona” are all ways of **choosing a slice** of that distribution with context and decoding knobs. The training objective is **not** “be helpful”—helpfulness in products comes later (Week 8). The systems lesson is: **treat the prompt as a program that partially specifies a conditional**; treat **evaluation** as the source of truth for whether that conditional is acceptable.

## Why / what anchors

| Topic | **What** | **Why** |
|--------|----------|---------|
| Autoregressive pretraining | Maximize product of $P(x_t \mid x_{<t})$. | **What** is learned: **broadly compositional text statistics**, including syntax, some facts, and tone—**because the data contain them**, not because the loss names them. |
| Data pipeline | Filter, dedupe, license, toxicity filters. | **What** the model is *really* fit to: **your** cleaned web, not “the web.” Shifts in pipeline = shifts in model. |
| Pack / length scheduling | How examples sit in a context window. | **Affects** what long-range structure the model sees; **a systems lever** for efficiency. |
| ICL | Improve at a task *from examples in the prompt* without weight updates. | **What** is surprising: the forward pass *approximates* learning-like behavior. **Why** it matters: you can “program” with examples—**but** format sensitivity is huge. |
| Decoding (greedy, beam, top-k, top-p, temp) | Map logits → discrete choices with different diversity/exploitation. | **What** changes is **not** the model but the **sampling process**; same weights, very different product behavior. |
| “Emergence” | Jump in metrics with scale. | **Why** caution: can be **metric and threshold effects**; still, scaling changes behavior—**always plot metrics**, not vibes. |
| Memorization / extraction | Training can store snippets. | **Why** IP/privacy: **governance and eval** must catch regurgitation; *not* fixed by a clever prompt alone. |

## Suggested “plain” definition of in-context learning

> If you put labeled examples in the context, the model’s predictions can change as if it inferred a task—**without** updating parameters. The **practical** meaning: *you can sometimes get a new behavior by changing text on the input side*, but the behavior is **not guaranteed** and **fails** under rewording, ordering, or out-of-distribution task structure.

## Undergrad “minimum” story

- **Pretrain = read the internet and learn to predict the next “word” (token).**  
- **Use = show it a few examples in the prompt and ask it to continue “as if it learned the pattern.”**  
- **Sample = how creatively it completes when multiple continuations are plausible.**

## Wording to keep expectations honest

> Good **log-likelihood** on held-out text does not imply **ethical** behavior or **factual** reliability on a closed-world question; it means **it compresses the test set as well as the training recipe intended**.

## Revision suggestions

- A short **comic-book** panel: *same model weights; three different prompts; three different personalities* → underscores **contingency** of behavior.
- A **concrete** warning: **temperature 0** vs **top-p 0.9** in user-facing products—*what* each does to *support tickets*.
