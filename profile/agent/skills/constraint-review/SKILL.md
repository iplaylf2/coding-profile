---
name: constraint-review
description: "Use when the user needs to evaluate or change the justification, scope, behavior, disposition, or ownership of a supporting constraint or defensive measure in code, tests, or prose as it serves an artifact's primary responsibility. Do not use when those decisions are settled and the request only implements or edits the constraint or chooses its structural placement."
---

# Constraint Review

## Review Boundary

Decide whether and how an in-scope constraint in code, tests, or prose should
serve the artifact's primary responsibility. Identify the obligation, owning
boundary and lifecycle phase, disposition, and appropriate validation.

Treat settled requirements and contracts as inputs and review only decisions
left open. Use **contract** for a governing source, **obligation** for the outcome
a boundary owes, **guarantee** for assurance actually established, and
**constraint** for the supporting measure under review.

Do not default to retaining or removing a constraint. Its existence, past value,
low cost, apparent duplication, or promise of extra safety does not settle the
decision.

## Evidence Rules

Start from the current obligation and supported path. A constraint and its
branch, test, comment, rationale, or history are not self-authenticating
authority and cannot justify one another in a circle.

Classify evidence by its role rather than its artifact type:

- Use governing requirements, policies, contracts, protocols, schemas, and
  established threat models to establish obligations and ownership.
- Use current control, data, state, trust, and reader paths, actual failures, and
  faithful reproductions to establish reachability and material consequences.
- Count a mechanism as a guarantee only where it is actually enforced. Inspect
  its covered domain, configuration, bypasses, lifecycle phase, and expiry.
- Use comments, conventions, and history to locate intent or compatibility
  needs, then re-establish their authority and current applicability.

A test may demonstrate an execution path or provide evidence about a guarantee,
and it may gate a build or release when the project gives it that role. Its
existence alone does not establish a production obligation, boundary, or
reachable state.

Check evidence against the current version, input domain, boundary, lifecycle,
and time window. If missing authority or material uncertainty prevents a safe
disposition, ask a focused question when the user can resolve it; otherwise
report the governing conflict.

## Decision Procedure

Follow all six steps in order. Before step 4 establishes an obligation and owner,
create only focused investigative checks. Do not prescribe lasting code or prose
behavior or durable validation until steps 5–6 falsify the rationales and choose
a disposition.

1. **Define the primary contract.** Name the result or reader effect owed, its
   consumer, the supported path or claim, the exact constraint, and the open
   decisions. Separate binding outcomes from candidate mechanisms and stated
   preferences.
2. **Establish the trigger.** Trace a supported input, reader inference, or
   established fault or threat to the constrained state and material
   consequence. A state manufactured only through a test escape, impossible
   mock, or disabled enforcement does not establish production reachability
   unless an equivalent in-scope path exists. For time-sensitive facts, identify
   the authority, observation time, invalidating events, and action time.
3. **Map the guarantee chain.** For each guarantee, record its source,
   covered domain, lifecycle phase, outcome, bypasses, and expiry. For prose, map
   the primary claim, qualification, and reader inference each controls. When a
   local rule mirrors an external owner, ask which stable local contract permits
   the mirror and how drift would be detected or managed.
4. **Locate the uncovered obligation and owner.** Name what the current
   guarantees do not cover, which boundary and phase have enough authority and
   information to cover each gap, and the local outcome or reader effect owed
   there. Multiple layers are justified when they cover an independent guarantee
   domain, failure-containment duty, or observable outcome. A repeated condition
   alone proves neither independence nor redundancy.
5. **Falsify the competing rationales.** Ask:
   - Would governing evidence establish the obligation, and would current paths,
     an actual failure, or a faithful reproduction establish its trigger and
     consequence, without relying on the constraint's own branch, comment, or
     self-referential test?
   - If the constraint were removed, which evidenced outcome would be lost, and
     does another guarantee cover the same domain, phase, and failure path?
   - Does a proposed test exercise a supported or explicitly adversarial path,
     or manufacture the state only to justify a branch?
   - Would runtime handling weaken a stronger static or build-time failure? Would
     a static declaration leave an untrusted runtime boundary uncovered?
   - Does a negative example prove only one sample while claiming to exclude an
     open set that should be closed by construction, an allowlist, a schema, or
     a type?
   - What complexity, drift, attention, performance, or false-confidence cost
     follows with and without the constraint?

   Reject only the rationale a question disproves. Do not infer the opposite
   disposition without its own evidence; unresolved material evidence still
   requires a conflict or focused question.
6. **Choose the disposition and mechanism.** Keep, clarify, narrow, move,
   replace, consolidate, remove, decline to add, or add according to the
   evidenced obligation. A retained or introduced constraint must materially
   serve that obligation. For every disposition, evaluate the resulting coverage
   and behavior; if an obligation remains uncovered, address it at the owning
   boundary when authorized or report the gap. Among valid candidates, use
   stated goals and preferences to choose proportionately.

   Place a retained or introduced constraint at the owning phase. Within a
   controlled domain, prefer representations that prevent invalid construction;
   validate external or dynamic values where they enter that domain; enforce
   time-sensitive state where observation and action can be authoritative.
   Downstream code may rely on an established guarantee only within its covered
   domain. Give a transitional constraint an observable exit condition.

## Implementation And Validation

When implementation is requested, make the coherent code, prose, and test
changes implied by the disposition.

For runtime behavior, choose rejecting input, recovery, degradation, retry,
delegation, or surfaced failure or uncertainty according to the governing
contract. Preserve caller-visible failure and recovery distinctions; do not let
a fallback broaden success or hide an invariant violation.

Derive validation from the governing contract and the lifecycle phase where
each guarantee operates, covering the supported path or claim, established
trigger, and owner-level outcome or reader effect:

- Validate each guarantee where it operates. Use the applicable checker,
  compiler, or contract fixture for static or build gates; exercise runtime
  boundaries with inputs they can receive; test state or concurrency guarantees
  where observation and action are authoritative.
- Test owner-level outcomes rather than branch presence or an implementation
  snapshot. Treat a test-only escape as relevant only when it represents an
  established in-scope fault or threat. When moving or removing a constraint,
  preserve tests of the affected contract and remove or migrate tests that pin
  only the obsolete mechanism.
- Add or adjust a focused test when needed to validate an affected owner-level
  outcome or close an evidenced validation gap. Do not modify production
  behavior solely to give a test something to assert.

For prose, identify the claim a qualification limits and the reader inference,
decision, or action it changes. An unsupported warning can manufacture the
ambiguity it appears to clarify. Place a necessary qualification before the
reader relies on the claim, preserve required terminology, and prefer a direct
primary rule so only a genuine exception remains.

Confirm that each retained or introduced constraint maps to an evidenced
obligation.

## Result

Lead with the disposition and decisive current evidence, or with the governing
conflict when no valid disposition is available. Explain the supported trigger,
uncovered gap, owning boundary and phase, and before-and-after outcome or reader
effect only when they materially justify the decision. Identify stale or
circular evidence only when it affected the disposition.

Report implementation and exact validation performed. Distinguish executed
checks from static reasoning, and report only residual uncertainty that still
affects the decision or risk.
