---
name: constraint-review
description: "Use when the user needs to evaluate or change the justification, scope, behavior, disposition, or ownership of a supporting constraint or defensive measure in code, tests, or prose as it serves an artifact's primary responsibility. Do not use when those decisions are settled and the request only implements or edits the constraint or chooses its structural placement."
---

# Constraint Review

## Review Boundary

Review whether and how an in-scope constraint in code, tests, or prose should
serve the artifact's primary responsibility. Treat settled requirements and
contracts as inputs; resolve only the justification, scope, ownership, lifecycle,
disposition, or validation decisions still open.

Use **contract** for a governing source, **obligation** for the outcome a boundary
owes, **guarantee** for assurance actually established, and **constraint** for
the supporting measure under review. Do not default to retention or removal:
existence, past value, low cost, apparent duplication, and promised extra safety
do not settle the decision.

## Evidence Invariants

- A constraint and its branch, test, comment, rationale, or history cannot prove
  one another necessary in a circle. A test may evidence a path or gate a build
  when the project assigns it that role, but its existence does not create a
  production obligation or reachability. A test-only escape represents a
  production fault or threat only when that fault or threat is independently in
  scope.
- Evidence and guarantees support conclusions only within the current version,
  input domain, boundary, lifecycle phase, configuration, and time window to
  which they actually apply. Downstream reliance cannot exceed that coverage.
- Reject only the rationale the evidence disproves. That does not establish the
  opposite disposition, and removing a mechanism does not discharge an
  obligation that survives it. Missing evidence does not prove that a state is
  unreachable, but uncertainty alone does not prove that the current mechanism
  is valuable.

## Review Questions

Use only questions that could change the disposition, and answer them first from
the request and available evidence. Move among the groups as findings change;
they are not a mandatory worksheet.

### Obligation And Trigger

- What primary result or reader effect is owed, to whom, on which supported path
  or claim? Which supplied inputs govern that outcome, and which merely propose
  a mechanism or express a preference?
- Without relying on the constraint or its own explanation, what independent and
  current authority establishes the obligation and owner? What supported path,
  actual failure, faithful reproduction, or explicitly in-scope fault or threat
  establishes the trigger and material consequence?
- Which unresolved fact would materially change the disposition? Can inspection
  resolve it, or does it require a focused user question or a reported governing
  conflict? For time-sensitive evidence, what authority, observation time,
  invalidating event, and action time limit the conclusion?

### Coverage And Ownership

- What assurance is actually established now, over which inputs and lifecycle
  phase, with what outcome, bypasses, and expiry? What obligation, if any,
  remains uncovered, and which boundary has the authority and information to own
  it?
- Where layers appear to overlap, what owner-level outcome or failure domain does
  each uniquely cover? For a runtime measure following a static or build-time
  guarantee, which admitted runtime conditions fall outside the earlier
  guarantee, and which earlier failure semantics could runtime handling change?
- Does any coverage claim reach beyond its evidence—for example, from a local
  mirror of external truth, one example to a larger set, or a qualification to a
  presumed reader effect? What bounds that inference, and how are source drift,
  uncovered cases, or actual reader needs handled when they matter?

### Disposition And Mechanism

- Which credible dispositions materially change the owning outcome or coverage?
  What would be gained, lost, or left uncovered under the serious alternatives?
- Which boundary and phase have enough authority and information to establish the
  needed guarantee? Which available mechanism adds that guarantee without merely
  duplicating another mechanism's effective domain?
- What failure result and visible distinctions does the governing contract
  require? Which strategy can produce them, and what may legitimately be
  normalized or hidden?
- Are the independent benefit and remaining risk proportionate to complexity,
  drift, attention, performance, and compatibility costs? If the constraint is
  transitional, what observable event and owner authorize its removal?

A retained or introduced constraint must materially serve an evidenced
obligation. If the chosen disposition leaves such an obligation uncovered,
address it at the owning boundary when authorized or report the gap; removing
the old mechanism alone is not a complete resolution.

## Implementation And Validation

When implementation is requested and the disposition is settled, make the
coherent code, prose, and test changes it implies.

- Which owner-level result or reader effect needs validation at the phase where
  the guarantee operates? What existing check covers it, and what is the
  smallest evidenced gap if coverage is incomplete?
- Does a proposed test protect the owning contract or only preserve a branch,
  snapshot, or test escape? When a mechanism moves or disappears, which contract
  tests should remain and which mechanism-specific tests should move or
  disappear with it?
- For prose, what supported reader inference must the wording produce, where
  must it appear before the reader relies on the claim, and how will the review
  confirm that effect without inventing an ambiguity?

Do not modify production behavior solely to give a test something to assert.
Run the applicable existing checks, add focused validation only for an affected
owner-level outcome or evidenced gap, and report only checks actually performed.

## Result

Lead with the disposition and decisive current evidence, or with the governing
conflict when no valid disposition is available. Include the material trigger,
coverage gap, owner and phase, changed outcome or reader effect, implementation,
and residual uncertainty only when they affect the decision. Distinguish
executed validation from static reasoning.
