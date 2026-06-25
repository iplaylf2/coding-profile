---
name: naming-stewardship
description: "Use when the user asks to generate, refine, choose, or review a name, label, identifier, term, or naming system, especially when the decision depends on audience, local vocabulary, semantic emphasis, nearby contrast, context-dependent brevity, or long-term discoverability. Do not use when naming is only incidental to a broader task owned by an available, more specific skill or local workflow."
---

# Naming Stewardship

Treat naming as a decision about meaning, boundary, audience, and future use. Length is a recurring cost: every added word adds surface area to reading, maintenance, speech, search, and tooling. Default to the shortest locally natural candidate that preserves the necessary distinction; prefer higher-density domain terms over extra qualifiers, and add words only when surrounding context cannot carry that work.

Set a length budget before expanding a name. Local, internal, or adjacent-context names should stay compressed unless local contrast, format, or real ambiguity requires more context. Public API, persisted, search-facing, cross-team, or standalone names may carry extra context; each added word must be justified by that exposure.

Use examples and lists as prompts for local investigation, not as closed taxonomies. Prefer the vocabulary, contrast set, and conventions visible in the user's workspace, source material, product surface, or domain context when they help the intended audience.

Treat user-provided words by role. Preserve exact wording when it is an explicit required term, local or domain term, exact label, or candidate that earns its place in the local contrast set; otherwise translate its semantic intent into that contrast set.

## Intent Questions

- What naming help did the user ask for, and what entity or vocabulary family is being named?
- What use must the name support for its intended audience, maintainers, search, tooling, or coordination?
- What exposure, durability, or tooling surface determines the minimum context the name must carry, and where does surrounding context already carry category, ownership, or purpose?
- What explicit naming constraints, supplied terms, candidate words, or local format rules must the candidates satisfy?
- If the user prefers or rejects a word, what meaning, contrast, audience concern, or local convention explains that preference?
- If naming is a term choice inside a broader task, what smallest naming judgment is needed before returning control to that task?
- Which missing details can be inferred from surrounding context, local names, domain vocabulary, adjacent artifacts, or the user's goal?
- Which missing answer would materially change the audience, semantic emphasis, compatibility, or risk enough to require user clarification?

## Naming Context Questions

- What nearby names or terms form the relevant contrast set?
- What local naming shape should candidates follow?
- What domain model or user workflow explains the thing being named?
- Which source should win when naming inputs disagree?
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

- What information must the name carry itself, and what can surrounding context, sibling names, or the domain model carry instead?
- What is the length budget for this surface, such as local/internal, adjacent-context, public/API, persisted, search-facing, spoken, or standalone?
- Starting from the shortest locally natural candidate, does each added word increase reader-facing contrast, standalone readability, search value, or format compliance enough to justify its ongoing cost?
- Where must the name stand alone, and what context must be restored there without repeating context that is already visible nearby?
- Would replacing a vague modifier or stack of qualifiers with a denser domain term preserve meaning while shortening the name?
- Are adjectives, qualifiers, prefixes, or suffixes carrying real contrast, or only making the name look complete?
- If a candidate needs multiple modifiers, is it identifying a stable concept, or compensating for unclear state, responsibility, or contrast that should be simplified or modeled differently?

## Candidate Shape Questions

- Match local naming shape before applying generic preference, including how much local names tend to compress or spell out context.
- Use natural language for human-facing names and stable, tool-valid shapes for machine-facing names.
- Prefer shared vocabulary over private invention unless the user is intentionally creating a new concept.
- Test supplied words against the relevant contrast set and local shape before preserving, replacing, or avoiding them.
- Use abbreviations, acronyms, numerals, and coined terms only when the intended audience already recognizes them or the surrounding system consistently uses them.
- Prefer the short form when local context already supplies category or ownership, such as through the audience, file path, type, namespace, heading, sibling group, or surrounding sentence.
- Keep a longer variant only when the name will be detached from that context or must remain clear during search, serialization, API exposure, reuse across contexts, or cross-team coordination.
- Keep sibling names at comparable levels of abstraction; do not mix category, mechanism, state, and exception as if they were peers.
- Avoid generic role or filler terms, such as "manager", "helper", "data", "item", or "common", unless local convention gives them a precise role.
- For a naming system, define what each name part is responsible for and avoid making one segment repeat another segment's meaning.

## Review Questions

- Does the candidate satisfy the user's explicit constraints and local naming convention?
- Does it foreground the right domain semantic for this context?
- After changing its length, does it preserve enough distinction from nearby names without repeating context that is already obvious?
- Does each word still earn its place after accounting for surrounding context, or should it be removed, replaced with a denser domain term, or moved into that context?
- If the best candidate is longer than the shortest viable option, what specific exposure, ambiguity, collision, local convention, or format rule justifies the extra words?
- Which words, if any, were deliberately removed because the context already supplies them?
- Did the recommendation translate user phrasing into a durable name grounded in local contrast and future use?
- Is the name understandable to the intended audience without requiring hidden implementation knowledge?
- Does it remain honest under likely growth, reuse, persistence, or public exposure?
- If validation is possible, did the exact candidate pass the relevant format, collision, or contract check?

## Handoff Questions

- What exact name should the user be able to use directly? Put the shortest viable candidate first unless exposure, ambiguity, collision, convention, or format requires extra context.
- If multiple options are useful, what semantic emphasis or convention distinguishes each option?
- What, if anything, was intentionally shortened because context already carries it, and what was intentionally included because the name must stand alone or cross a boundary?
- What uncertainty remains because key context, validation, or neighboring names were unavailable?
