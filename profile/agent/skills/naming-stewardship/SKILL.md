---
name: naming-stewardship
description: "Use when the user asks to generate, refine, choose, or review a name, label, identifier, term, or naming system, especially when the decision depends on audience, local vocabulary, semantic emphasis, nearby contrast, context-dependent brevity, or long-term discoverability. Do not use when naming is only incidental to a broader task owned by an available, more specific skill or local workflow."
---

# Naming Stewardship

Treat naming as a decision about meaning, boundary, audience, and future use. A good name carries the minimum context needed where it will be read, searched, spoken, maintained, or used by tools; start with the shortest locally natural candidate and add words only when surrounding context cannot carry that work.

Use examples and lists as prompts for local investigation, not as closed taxonomies. Prefer the vocabulary, contrast set, and conventions visible in the user's workspace, source material, product surface, or domain context.

## Intent Questions

- What naming help did the user ask for, and what entity or vocabulary family is being named?
- What use must the name support for its intended audience, maintainers, search, tooling, or coordination?
- What exposure, durability, or tooling surface determines how much context the name must carry, and where does surrounding context already carry category, ownership, or purpose?
- What explicit naming constraints or local format rules must the candidates satisfy?
- If naming is a term choice inside a broader task, what smallest naming judgment is needed before returning control to that task?
- Which missing details can be inferred from surrounding context, local names, domain vocabulary, adjacent artifacts, or the user's goal?
- Which missing answer would materially change the audience, semantic emphasis, compatibility, or risk enough to require user clarification?

## Evidence Questions

- What nearby names or terms form the relevant contrast set?
- What local naming shape should candidates follow?
- What domain model or user workflow explains the thing being named?
- Which source of truth should win when naming evidence disagrees?
- Which terms are overloaded, deprecated, aspirational, implementation-leaky, or likely to mislead the intended audience?
- What future additions are likely, and would the candidate still leave room for sibling names without forcing awkward exceptions?

## Semantic Frame Questions

- What domain meaning should lead in this context: user goal, business concept, capability, lifecycle state, ownership boundary, technical invariant, or operational outcome?
- What difference from nearby names must this name make clear, and what is the shortest candidate that preserves the difference the user will care about first?
- Is the current or proposed name too broad, too narrow, too abstract, too implementation-focused, or too tied to a transient mechanism?
- Does the name describe the entity's stable responsibility rather than the edit that created it, the file that contains it, or the technology currently implementing it?
- Does the name make an unsupported promise about what the entity can do or guarantee?
- Would a reader who knows the surrounding context infer the intended boundary without extra explanation?

## Context And Density Questions

- Starting from a concise candidate, does each added word contribute reader-facing contrast, format compliance, standalone readability, or search value?
- Which enclosing or neighboring context already names the category and can be omitted from the candidate?
- Where must the name stand alone, and what context must be restored there?
- Is a shorter name more precise because the context carries the category, or would shortening remove the only cue that distinguishes it from a sibling?
- Would replacing a vague modifier with a domain term increase meaning without increasing length?
- Are adjectives, qualifiers, prefixes, or suffixes carrying real contrast, or only making the name look complete?
- Does a long or heavily qualified name identify a stable concept, or is it compensating for unclear state or responsibility that should be simplified or modeled differently?

## Candidate Shape Questions

- Match local naming shape before applying generic preference, including how much local names tend to compress or spell out context.
- Use natural language for human-facing names and stable, tool-valid shapes for machine-facing names.
- Prefer shared vocabulary over private invention unless the user is intentionally creating a new concept.
- Use abbreviations, acronyms, numerals, and coined terms only when the intended audience already recognizes them or the surrounding system consistently uses them.
- Keep sibling names at comparable levels of abstraction; do not mix category, mechanism, state, and exception as if they were peers.
- Avoid generic role or filler terms, such as "manager", "helper", "data", "item", or "common", unless local convention gives them a precise role.
- For a naming system, define what each name part is responsible for and avoid making one segment repeat another segment's meaning.

## Review Questions

- Does the candidate satisfy the user's explicit constraints and local naming convention?
- Does it foreground the right domain semantic for this context?
- After changing its length, does it preserve enough distinction from nearby names without repeating context that is already obvious?
- Does each word still earn its place after accounting for surrounding context?
- Is the name understandable to the intended audience without requiring hidden implementation knowledge?
- Does it remain honest under likely growth, reuse, persistence, or public exposure?
- If validation is possible, did the exact candidate pass the relevant format, collision, or contract check?

## Handoff Questions

- What exact name should the user be able to use directly? Put the best candidate first.
- If multiple options are useful, what semantic emphasis or convention distinguishes each option?
- What evidence shaped the recommendation, and was it enough to support the chosen name?
- What was intentionally shortened because context already carries it, and what was intentionally included because the name must stand alone?
- What uncertainty remains because key context, validation, or neighboring names were unavailable?
