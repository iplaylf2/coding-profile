---
name: auxiliary-constraint-stewardship
description: "Use when the user needs to decide or change how a supporting constraint in code or prose should serve an artifact's primary responsibility, including whether it is needed, what invariant or audience need it protects, its disposition, or its owning boundary. Do not use to implement an already-decided protection or to make a purely structural placement decision after responsibilities are settled."
---

# Auxiliary Constraint Stewardship

## Constraint Boundary

This skill determines a constraint's validity, protected invariant or audience
need, disposition, and the responsibility its owning or target boundary must
satisfy. For prose, it also determines what claim the qualification limits,
where the reader needs it, and what consequence it expresses while preserving
required terminology.

## Context And Evidence Questions

Use authoritative contracts, observed behavior, tests, schemas, requirements,
and local conventions as evidence. Distinguish them from copied assumptions and
defensive habit.

- When evidence conflicts, which source governs the constraint, and what makes
  it authoritative for this boundary?
- What primary path does the artifact serve, how does the constraint modify it,
  and does that modification govern code behavior, prose expression, or both?
- Which constraint and outcome did the user put in question, and which validity,
  protected invariant or audience need, disposition, or boundary-responsibility
  decision must the result resolve?
- What invariant, contract, or audience need is claimed to justify the
  constraint, and which boundary owns it?
- Does this artifact have an independent obligation or observable failure mode,
  such as validating a trust boundary, containing a failure, or preserving a
  local invariant, even when another layer checks the same condition?
- Does the local rule instead mirror mutable behavior owned elsewhere without a
  stable contract or drift signal, and should it follow that owner or preserve a
  narrower local contract?
- What can be inferred from the evidence, and which remaining answer would
  materially change validity, disposition, boundary responsibility, scope, or
  risk enough to require user clarification?

## Disposition Questions

- Which disposition—keep, clarify or narrow, move, remove, or add—best follows
  from the evidence?
- When both forms are available, should the responsibility be enforced through
  behavior, expressed as a prose qualification, or carried by both?
- Is the defended case reachable and consequential enough to justify its
  complexity or attention cost?
- Does the constraint surface failure and uncertainty honestly, or turn an
  unknown, partial, or unsupported state into apparent success?
- Does the responsibility belong at the current boundary, and if so are its
  trigger, behavior, wording, and scope precise; if not, what must the target
  boundary satisfy?
- Does the constraint protect a stable boundary or carry a temporary transition,
  and what observable exit condition should end that responsibility?
- What material protection would removal lose, what existing failure or
  uncertainty would it expose, and what duplicated or shadow behavior would it
  eliminate?
- Is any real invariant, trust boundary, failure-containment duty, or audience
  need currently unprotected?
- Which current or proposed branches, wrappers, caveats, or validation paths
  carry a distinct boundary responsibility, and which, if any, can be removed,
  inlined, or rewritten without losing it?

## Code Constraint Questions

- Which input, state, timing window, dependency failure, or trust transition
  triggers the constraint?
- Should the result reject, recover, degrade, retry, delegate, or surface the
  failure, and can callers distinguish those states?
- Does a fallback preserve valid work or silently broaden what counts as success?
- If the defended case changes, would the constraint fail open, fail closed, or
  silently misclassify a state, and would it broaden the time or state window
  treated as valid?
- Within the settled owning boundary, can an existing model, type, or contract
  express the rule without duplicated state or shadow logic?

Run applicable existing checks for the primary path, constraint trigger, and
resulting failure or recovery behavior. Add or adjust a focused check only when
the requested implementation changes an otherwise uncovered contract.

## Prose Constraint Questions

- What reader decision or action changes because of the qualification?
- Which supplied wording or terminology is an exact requirement, and which is
  evidence of the intended boundary or consequence to express in local prose?
- Is the caveat attached to the statement it limits and visible before the reader
  can act on a false generalization?
- Can the primary responsibility or positive rule carry the meaning more
  directly, leaving only the genuine exception?
- Does the wording state the owning boundary and consequence without narrating
  speculative defenses?
- What reader-relevant qualification would removal lose, and what repetition or
  unsupported caution would it eliminate?

Validate prose by rereading the primary path with and without the constraint,
checking terminology and nearby claims for contradiction, and using existing
documentation checks when they cover the affected text.

## Result

Lead with the disposition: keep, clarify or narrow, move, remove, or add. State
the protected invariant or audience need, effect on the primary path, owning or
required target-boundary responsibility, and decisive evidence.

Report the exact validation performed and its result. Distinguish static or
conceptual review from executed checks, and identify residual risk only when
evidence, authority, or an external contract remains uncertain.
