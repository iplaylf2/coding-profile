---
name: constraint-review
description: "Use when the user needs to evaluate, decide, or change how a supporting constraint or defensive measure in code or prose serves an artifact's primary responsibility, including its validity, scope, disposition, or owning boundary. Do not use when the relevant constraint decisions—including validity, scope, behavior, disposition, required outcome or reader effect, and owning boundary—are settled and the request only implements or edits the constraint, or when the request only makes a structural placement decision after responsibilities are settled."
---

# Constraint Review

## Review Boundary

This skill determines whether and how an in-scope constraint should serve an
artifact's primary responsibility and which boundary should own the
responsibility for the required outcome.

Treat decisions settled by authoritative requirements or contracts as inputs;
evaluate only the validity, scope, behavior, disposition, and ownership left
open.

For prose, treat qualifications, caveats, exceptions, and warnings as
constraints on what the reader may infer or do.

## Context And Responsibility Questions

Use requirements, schemas, public contracts, threat models, observed behavior,
tests, and local conventions as evidence. Distinguish a governing contract from
a current observation or copied assumption.

- What primary result does the artifact owe, to whom, and through what primary
  path?
- Which exact constraint and named scope are under review?
- Which request inputs are binding requirements, which are goals, preferences,
  rationales, or candidates, and which validity, scope, behavior, disposition,
  or ownership decisions remain open?
- Which evidence governs the open decisions, how authoritative and stable is it,
  and how confidently does it support the claimed responsibility?
- What material invariant, trust boundary, failure-containment duty, resource
  need, or audience need establishes a responsibility, which boundary owns it,
  and what outcome must that boundary provide?
- What trigger makes that responsibility relevant, and what structural,
  contractual, observed, or adversarial evidence establishes its reachability
  and material consequence?
- What observable outcome, reader conclusion, valid behavior, and cost follow
  with and without the constraint?
- Which responsibility does another mechanism already fulfill, and what outcome
  does it provide? What independent obligation remains at this boundary, and
  what local outcome does it require?
- Does the constraint fit the responsibility in trigger, behavior, scope,
  wording, duration, and cost? If the responsibility is transitional, what
  observable exit or reevaluation condition applies?
- What unresolved input or missing authority could materially change an open
  decision or risk, and can it be inferred or obtained before asking a focused
  question?

## Code Questions

- Which input, state, timing window, dependency failure, or trust transition
  triggers the responsibility, and what success, failure, recovery, or
  uncertainty outcome does the boundary owe?
- Which response strategy—for example, rejection, recovery, degradation, retry,
  delegation, or surfacing failure or uncertainty—produces that outcome, and
  which resulting states must callers distinguish?
- When behavior is controlled or enforced at multiple boundaries, what
  independent obligation does each boundary own, and what local outcome does
  that obligation require from the enforcement?
- When a local rule mirrors behavior owned elsewhere, should it follow that
  owner or preserve a distinct local contract? What governs that relationship,
  and how would drift become observable?
- Would a fallback, retry, or degradation preserve valid work, keep success
  within its governing contract, and preserve each required failure, recovery,
  or uncertainty distinction?
- As assumptions, resources, or timing change, would the rule fail open or
  closed, misclassify a state, or change the valid state or time window, and
  what capacity or lifecycle does that behavior protect?
- Can the existing model, type, contract, or source of truth express the
  responsibility and its distinct outcomes without duplicated state or logic?

## Prose Questions

- Which claim does the qualification limit, and what reader inference,
  decision, or action changes with and without it?
- Where must the qualification appear so it shapes the reader's understanding
  before a decision or action relies on the claim?
- Which supplied wording or terminology is an exact requirement, and which
  instead indicates the intended boundary or consequence to express in local
  prose?
- Can the primary rule express the responsibility more directly while keeping
  the owning boundary and concrete consequence clear?

## Disposition Questions

Use the relationship among evidence, responsibility, owner, required outcome,
and constraint expression to consider:

- **Keep** when the current constraint, responsibility, and owner fit.
- **Clarify** when the responsibility and owner fit but the expression is
  imprecise.
- **Narrow** when the constraint exceeds the responsibility.
- **Move** when the responsibility is valid but another boundary owns the
  responsibility for the required outcome.
- **Remove** when no independent obligation at the current boundary requires the
  constraint's local outcome, or when the constraint is disproportionate to
  that obligation and outcome.
- **Add** when governing evidence establishes an unprotected, in-scope
  responsibility at a boundary that can produce the required outcome.

Then decide:

- Which disposition or combination most directly and proportionately satisfies
  the evidenced responsibility?
- Should the responsibility be carried by behavior, a prose qualification, or
  both?
- Which candidates satisfy the governing inputs and responsibilities? If none
  do, which conflict must be resolved before implementation?
- Among valid candidates, how should stated goals and preferences determine the
  choice?

## Implementation And Validation

When implementation is requested, make the coherent code, prose, and test
changes implied by the settled disposition. Within the owning boundary, prefer
one explicit source of truth; retain enforcement at multiple boundaries only
when each boundary owns an independent obligation that requires a local outcome
from that enforcement.

Run applicable existing checks for the primary path, constraint trigger, and
required outcome or reader effect. Test observable contracts rather than the
mere presence of a branch or phrase. Add or adjust a focused check only when the
implementation changes an otherwise uncovered contract.

For prose, reread the primary path with and without the constraint, check
required terminology and nearby claims for contradiction, and run existing
documentation checks when they cover the affected text.

Confirm that each retained or introduced constraint maps to an evidenced
responsibility, and each added validation maps to a changed or otherwise
uncovered contract.

## Result

Lead with the disposition and decisive evidence. If no valid disposition is
available, lead instead with the governing conflict and the decision needed
before implementation. State how the constraint fits the evidenced
responsibility, the material outcome or reader conclusion with and without it,
and which current or target boundary owns the responsibility and must produce
the required outcome. Identify the governing requirement or responsibility that
controlled any material tradeoff.

Report any implementation, the exact validation performed, and its result.
Distinguish executed checks from conceptual review, and report residual
uncertainty only when it still affects the decision or risk.
