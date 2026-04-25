# Voice and Style Guide — Narrative Prologues

This document anchors the Carl-Sagan-inspired voice used in the
book-level introduction and the per-chapter prologues. Every prologue
is checked against this guide before commit. The goal is consistency
of tone across eleven chapters and a substantial preface, so that the
reader never feels they have wandered into a different book.

## What we are imitating, and what we are not

We are imitating the **voice** Carl Sagan used in *Cosmos*, *The
Demon-Haunted World*, and *The Pale Blue Dot*: a careful,
intellectually honest, faintly awed narrator who explains hard ideas
in plain language while honouring the people who came before.

We are **not** imitating his subject matter, his metaphors of stars
and sand, or his cadence at full lyrical pitch. The audience is
undergraduate engineers; the goal is that they put the book down with
sturdier intuition, not that they put it down dazzled.

If a sentence would not survive being read aloud in a quiet seminar
room, it does not belong here.

## The four-beat structure for every chapter prologue

Every chapter prologue follows the same four beats, in this order, so
that readers know what to expect by the second chapter.

1. **The problem.** What were we trying to do? Why did it matter?
   What made it hard? Anchor with one concrete human-scale image
   (a researcher at a desk, a user typing a query, a punched card,
   a server room).
2. **How we got here.** A short history. Two or three named
   predecessors and what they tried. What worked partially. What
   failed. The lineage of the current best practice. Dates and
   names where possible; verify before publishing.
3. **Where we stand.** The current best practice in plain language,
   and a short statement of *why the math in the rest of the chapter
   is the right math for this problem*. This is the bridge from
   narrative to derivation.
4. **What goes wrong.** The error modes. Tied wherever possible to
   visible LLM misbehaviour the reader has already encountered:
   hallucination, overconfidence, refusal, brittleness, cost
   overruns, jailbreaks. Plain English; the formal failure-mode
   discussion comes later in the chapter.

A short forward beat — a one- or two-sentence transition into the
math — closes each prologue.

## Voice guardrails

- **Use "we" inclusively.** We are walking the reader through the
  problem together, not lecturing at them.
- **Open concretely.** A scene, a question, a number. Not an
  abstraction.
- **Acknowledge predecessors.** Name the people who got us here.
  Shannon, Bengio, Mikolov, Vaswani, Hinton, Schmidhuber, Pearl,
  whoever fits. Get the dates right.
- **Acknowledge uncertainty.** When something is empirical, say so.
  When something is conventional, say so.
- **Plain language first, jargon when accurate.** Define a term the
  first time it appears, then use it freely. Do not bury the reader
  in synonyms.
- **Avoid cosmic overreach.** No "stars within a grain of sand",
  no "billions and billions". The Sagan we are imitating wrote at
  many registers and chose the modest one for engineering audiences.
- **No exclamation marks.** No italicised awe. No "magic". No
  "miraculous". Wonder is conveyed by accuracy, not by emphasis.
- **No emojis. No present-tense breathlessness.** "We trained a
  network" is fine; "we BLEW UP the loss" is not.
- **Verify every historical claim.** If a date or a quotation is
  unsure, drop it rather than guess.
- **Errors are human.** When discussing failure modes, frame them
  as honest engineering consequences, not as flaws of stupid
  practitioners. Predecessors who got things wrong are still owed
  respect.

## Voice guardrails — phrasing patterns to prefer

- "Consider for a moment …"
- "It is worth pausing to remember that …"
- "The honest answer is that we do not know."
- "What follows is the simplest version of an old idea."
- "This was not the first attempt; it was not even the second."
- "The mathematics in the next section is the bookkeeping for what
  we have just described."
- "The model is doing what we asked. The trouble is what we asked."

## Voice guardrails — phrasing patterns to avoid

- "Imagine a vast cosmic ocean of tokens" — too much.
- "Tokens are the atoms of language" — slogan, not insight.
- "The transformer is a miracle of modern computing" — empty
  praise.
- "We humans" — pretentious.
- "It turns out that …" repeated more than once per page.
- "Surprisingly, …" used as a tic.

## Structural conventions

- Each chapter prologue is one new top-level subsection, titled
  **"Setting the Scene"**. It replaces the existing
  **"Introduction"** subsection. The chapter's notation block,
  Learning Objectives, and Bridges remain in place.
- The book-level prologue replaces the existing one-page Preface and
  is structured as numbered subsections that mirror the four-beat
  structure (problem, lineage, current practice, error modes), plus
  a short closing on how to read the book.
- New prose runs to roughly 2--3 pages per chapter prologue, and
  4--6 pages for the book-level introduction. Length is adjusted
  per chapter according to material density, not padded for
  uniformity.
- All math, derivations, worked examples, and figures continue to
  live in the existing chapter sections, after the prologue.
- Every prologue is written so it could stand alone and still leave
  the reader with three useful intuitions, even if they read no
  further.

## Fact-check checklist (run before each commit)

- [ ] Every named person attributable to the work cited.
- [ ] Every date within ±1 year of the published canonical source.
- [ ] No invented quotations.
- [ ] No claims that conflict with what the rest of the chapter
      says or proves later.
- [ ] No invented or exaggerated empirical numbers.
- [ ] No emojis, no exclamation marks, no italicised awe.
- [ ] Length within target band (2--3 pages chapter, 4--6 pages
      preface).
- [ ] All four narrative beats present.
- [ ] Closing sentence transitions cleanly to the math that follows.
