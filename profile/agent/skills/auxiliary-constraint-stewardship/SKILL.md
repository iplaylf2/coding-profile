---
name: auxiliary-constraint-stewardship
description: "Use when the user asks to review, revise, refactor, or diagnose whether supporting constraints in a code or prose artifact still serve its primary path. Do not use for ordinary protective or recovery work unless the user's concern is the constraint's role or placement."
---

# Auxiliary Constraint Stewardship

Treat an auxiliary constraint as any supporting condition, exception path, qualification, fallback, recovery rule, or caveat that modifies the primary path in response to a boundary, exception, tradeoff, or failure mode. Its form matters less than its relationship to the artifact's main responsibility.

Use examples and lists only as prompts for finding local evidence. Do not let them become closed taxonomies.

## Intent Questions

- What should the artifact help its intended consumer do?
- What is the primary path before auxiliary constraints qualify it?
- Which constraint is under question, and what decision, failure path, or tradeoff does it affect?
- Which local facts or invariants must be preserved?
- What value is the constraint meant to add beyond the primary path?
- Which missing answers can be inferred from nearby evidence instead of asking the user?
- Which missing answer would materially change the target, risk, or edit scope enough to require user clarification?

## Scope Questions

- Is this skill the center of the request, or only supplying a constraint judgment for another task-family skill?
- If another task is primary, what is the smallest constraint judgment needed before that work can proceed?

## Boundary Ownership Questions

- What boundary naturally owns the issue, such as this artifact, its caller or reader, an adjacent system, source data, documentation, or the existing failure surface?
- Would the existing boundary surface the issue honestly enough without a new constraint?
- Would documenting the tradeoff serve the consumer better than changing the artifact's behavior or structure?
- What responsibility would move into or out of this artifact if the constraint were added, removed, or rewritten?

## Justification Questions

- What local evidence explains why the constraint exists?
- Is the defended-against case reachable and likely enough to matter?
- Is the constraint duplicating an existing guarantee, compensating for an absent contract, or masking an unresolved ownership boundary?
- Is the source of truth authoritative, or is the constraint copied from stale knowledge, defensive habit, or earlier patching?
- Does the constraint have observable behavior that can be tested, reviewed, or explained without relying on intention alone?
- For code artifacts, which guards, fallbacks, nullable states, error paths, or duplicated state representations express real boundary decisions rather than incidental defensive structure?

## Value Questions

- What cost does the constraint impose in complexity, wording, concepts, dependencies, maintenance, or user attention?
- What material loss would removing it cause?
- Does the constraint reveal a non-obvious boundary, exception, decision, or invariant, or only restate a convention the intended consumer or surrounding system should already follow?
- Does it create surface completeness while suppressing a more important error, missing contract, unresolved decision, or ownership gap?
- Does it let vague, stale, partial, or misleading output look successful?
- Is the benefit proportionate to the cost?

## Revision Questions

- Does the existing structure already express the right relationship between the constraint and the primary path?
- Can the constraint be replaced by a positive responsibility, invariant, precondition, or decision boundary?
- Can the same user value be achieved with a smaller expression of the same responsibility?
- What is the smallest change that restores the right relationship without stripping legitimate protection?
- Can an internal invariant be expressed more directly with a stronger type, single state object, narrower API, precondition, or clearer ownership boundary?
- When keeping a constraint, can its trigger, owner, behavior, and validation be named without adding more defensive prose?
- Would a broader rewrite or boundary change make the artifact read as originally designed rather than incrementally patched?
- What legitimate constraint must remain because it protects a real boundary or documented contract?

## Proportionality Audit Questions

- Which new supporting structures did the edit add, such as branches, helpers, paragraphs, caveats, wrappers, examples, messages, or validation paths?
- Does each new structure carry a real boundary decision, or does it only rename an upstream fact, restate an already useful signal, or make an edge case look central?
- Did the edit make failure, choice, or explanation more honest, or did it make a failed, unknown, or unsupported state look successful?
- Can any supporting structure be removed, inlined, or delegated while keeping the primary path centered?

## Handoff Questions

- What intent translation should be reported to the user, and what edit level was used?
- Which constraints were changed, validated, removed, or intentionally left unchanged?
- Why is the result better than merely making the artifact shorter, stricter, more complete-looking, or more cautious?
- Which boundary owns the remaining failure, tradeoff, or exception?
- What evidence shaped the judgment, and what was intentionally preserved?
- What validation was performed, and what residual risk remains?
