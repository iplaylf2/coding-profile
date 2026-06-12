---
name: auxiliary-constraint-stewardship
description: "Use when the user asks to review, revise, refactor, or diagnose whether supporting constraints in a code or prose artifact still serve its primary path. Do not use for ordinary protective or recovery work unless the user's concern is the constraint's role or placement."
---

# Auxiliary Constraint Stewardship

Treat an auxiliary constraint as any supporting instruction or branch that modifies the primary path in response to a boundary, exception, or failure mode. Its form matters less than its relationship to the artifact's main responsibility.

Use examples and lists only as prompts for finding local evidence. Do not let them become closed taxonomies.

## Intent Questions

- What should the artifact help its intended consumer do?
- What is the primary path before auxiliary constraints qualify it?
- Which constraint is under question, and what decision or failure path does it affect?
- Which local facts or invariants must be preserved?
- Which missing answers can be inferred from nearby evidence instead of asking the user?
- Which missing answer would materially change the target, risk, or edit scope enough to require user clarification?

## Scope Questions

- Is this skill the center of the request, or only supplying a constraint judgment for another task-family skill?
- If another task is primary, what is the smallest constraint judgment needed before that work can proceed?

## Justification Questions

- What local evidence explains why the constraint exists?
- Is the defended-against case reachable, likely enough to matter, and inside this artifact's responsibility?
- What boundary should own this responsibility?
- Is the constraint duplicating an existing guarantee, compensating for an absent contract, or masking an unresolved ownership boundary?
- Is the source of truth authoritative, or is this copied from stale knowledge, defensive habit, or earlier patching?
- Does the constraint have observable behavior that can be tested, reviewed, or explained without relying on intention alone?

## Value Questions

- What cost does the constraint impose?
- What material loss would removing it cause?
- Does the constraint reveal a non-obvious boundary, exception, decision, or invariant, or only restate a convention the intended consumer or surrounding system should already follow?
- Does it create surface completeness while suppressing a more important error, missing contract, unresolved decision, or ownership gap?
- Does it let vague, stale, partial, or misleading output look successful?
- Is the benefit proportionate to the cost?

## Revision Questions

- Does the existing structure already express the right relationship between the constraint and the primary path?
- Can the constraint be replaced by a positive responsibility, invariant, precondition, or decision boundary?
- What is the smallest change that restores the right relationship without stripping legitimate protection?
- When keeping a constraint, can its trigger, owner, behavior, and validation be named without adding more defensive prose?
- Would a broader rewrite or boundary change make the artifact read as originally designed rather than incrementally patched?
- What legitimate constraint must remain because it protects a real boundary or documented contract?

## Handoff Questions

- What intent translation should be reported to the user, and what edit level was used?
- Which constraints were changed, validated, or intentionally left unchanged?
- Why is the result better than merely making the artifact shorter, stricter, more complete-looking, or more cautious?
- What evidence shaped the judgment, and what was intentionally preserved?
- What validation was performed, and what residual risk remains?
