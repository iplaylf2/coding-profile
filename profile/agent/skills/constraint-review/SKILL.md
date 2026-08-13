---
name: constraint-review
description: "Use when the user needs to evaluate or change the justification, behavior, scope, disposition, ownership, or lifecycle of an existing or proposed supporting constraint or defensive measure in code, tests, or prose, including when that judgment remains open within a broader task. Do not use when those decisions are settled and the request only implements, optimizes, edits, or structurally places the measure."
---

# Constraint Review

## Review Boundary

Review whether and how an in-scope constraint should serve its artifact. A
constraint here is a supporting measure that limits, qualifies, checks, or
handles an input or state, behavior, failure or recovery path, compatibility
case, validation condition, or reader inference. An ordinary quality improvement
is outside this domain unless its constraint role is itself under judgment.

Produce the requested disposition and, when requested, the coherent
implementation and validation it implies. Treat settled requirements and
decisions outside this domain as inputs.

Use **contract** for a governing source, **obligation** for a required outcome,
**objective** for a quality or evolution outcome, and **guarantee** for assurance
actually established by a measure.

## Decision Principles

- Explicit user requirements, normative project policies, and tool-enforced
  contracts govern the choices they cover. Use current artifact and domain
  evidence for the choices they leave open.
- Do not derive an obligation, objective, or reachable condition solely from the
  candidate measure or its own branch, test, comment, or rationale. A faithful
  test can evidence a path or outcome without creating a production obligation.
- Evaluate evidence in proportion to the claim, consequences if wrong,
  complexity, compatibility effect, and reversibility. No single provenance,
  usage, or cost signal settles the disposition; missing or stale rationale
  changes confidence rather than deciding value.
- Evidence and guarantees support conclusions only within the version, input
  domain, boundary, lifecycle phase, configuration, and time window they cover.
  Downstream reliance cannot exceed that coverage.
- Reject only the rationale that the evidence disproves. That does not establish
  the opposite disposition or discharge an obligation that survives the
  measure.

## Review Questions

Use only questions that could change the disposition, and answer them first from
the request and available evidence. Move among the groups as findings change;
they are not a mandatory worksheet.

### Purpose And Effect

- What result did the user request, which exact constraint is under review, and
  which decisions remain open?
- Which supplied inputs are contracts, objectives, preferences, candidate
  mechanisms, rationales, or rejections, and what does each settle?
- Compared with the credible alternatives, what does the measure change about
  accepted states, behavior, failure or recovery, compatibility, validation, or
  reader understanding?
- What obligation or objective, if any, would those effects serve? Which
  consumer, supported path, lifecycle phase, or claim would be affected?

### Evidence And Uncertainty

- What do governing sources and current artifact or domain evidence support or
  weaken about the claimed condition, effect, reliance, or opportunity?
- When current evidence leaves a material question about intent, prior reliance,
  compatibility, or evolution unresolved, what bounded inference does relevant
  history support, and what remains unknown?
- What supports the claimed effect, what remains inferred, anticipated, or
  unmeasured, and how much confidence does the decision require given its
  consequences?
- Which unresolved answer would materially change the disposition? Can available
  inspection or a focused measurement resolve it, can the disposition remain
  sound with the uncertainty bounded, or is a user decision needed?

### Coverage Ownership And Lifecycle

- What outcome or assurance exists now, over which inputs and lifecycle phase,
  with what bypasses or expiry? What gap, improvement opportunity, or material
  uncertainty remains?
- Which boundary and phase have enough authority and information to produce the
  intended effect?
- Where layers overlap, does each have a distinct or reinforcing role, or are
  they redundant once failure independence, observability, and cost are
  considered? Would moving or consolidating the measure change behavior or only
  location?
- If the measure mirrors an external or changing source, what does the local
  measure gain, what drift can occur, and how would that drift be detected or
  contained?
- What current reliance or changing condition affects the measure's lifetime?
  What observation, migration, review point, or exit condition should govern
  reevaluation?

### Disposition And Mechanism

- Which credible dispositions materially change fulfillment of an obligation,
  contribution to an objective, coverage, compatibility, reliance, cost, or
  uncertainty? What would each gain, lose, or leave uncovered?
- Which option best fits the expected effects and uncertainty after complexity,
  drift, performance, compatibility, risk asymmetry, and reversibility are
  considered?
- Which success, failure, recovery, and uncertainty distinctions are fixed by a
  contract, and which may change? Which mechanism and boundary can produce the
  intended effect without claiming a broader guarantee?

## Implementation And Validation

When implementation is requested and the disposition is settled, change the
coherent code, prose, and tests implied by it.

- Which affected outcome needs validation at the boundary and phase where the
  measure operates, and what existing check covers it?
- Which semantics must remain fixed, which may change under the chosen
  disposition, and which effectiveness claims require measurement rather than
  static reasoning?
- For compatibility or transition behavior, which inputs, states, versions, or
  consumer outcomes need characterization? When the mechanism changes, which
  outcome tests should remain and which mechanism-specific tests should change?
- For prose, what reader inference should the constraint produce, where must it
  appear before reliance, and how will review confirm that effect?

Do not modify production behavior solely to give a test something to assert.
Run applicable existing checks, add focused validation only for an affected
outcome or material evidence gap, and report only checks actually performed.

## Result

Lead with the disposition or governing conflict. State the basis, material
tradeoff, owner and lifecycle, and changed outcome or reader effect only when
they affect the decision. Distinguish governing facts and direct observations
from historical inference, prospective reasoning, and unmeasured effects.
Report implementation and executed validation separately from static reasoning,
with only the uncertainty that still affects use.
