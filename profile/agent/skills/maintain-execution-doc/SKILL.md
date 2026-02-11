---
name: maintain-execution-doc
description: "Use when the user asks to create or update a project’s Execution Doc during active development. Goal: keep the Execution Doc aligned with the current iteration state and the design baseline as implementation evolves."
---

# Maintain Execution Doc

Create or update a snapshot **Execution Doc** so it reflects the current iteration state during coding.

## Response Contract

* Deliverable: return the updated Execution Doc.
* Chat output: no additional output beyond the deliverable.

## Execution Doc Model

### Execution Doc

An **Execution Doc** is a snapshot document used during active development to reflect the current iteration state and coordination context.

It is rewritten as work evolves.

### Phase

A **Phase** is a label for the dominant objective of the current work.

When multiple objectives are present, choose the phase that best matches the current dominant constraint.

* **Build — Make it work**
  Dominant objective is to implement the core behavior and make the main functional path exist end-to-end in code.
  Typical constraint is implementation completeness and basic interface shape.

* **Prove — Make it correct**
  Dominant objective is to reduce uncertainty about behavior correctness through verification and fixes.
  Typical constraint is correctness confidence and reproducibility.

* **Operate — Make it operational**
  Dominant objective is to make the change run across real system boundaries, including integration and environment execution.
  Typical constraint is end-to-end interoperability and operational readiness for a test environment.

* **Ship — Make it shippable**
  Dominant objective is to converge to merge and delivery readiness with minimal remaining risk.
  Typical constraint is review readiness and delivery closure.

## Editing Standards

Apply these standards throughout the update. Each standard is single-sourced here and referenced elsewhere by its ID.

* **phase.locality — Stay within the current phase**
  Keep the Execution Doc focused on the current phase. Avoid detailing execution steps for later phases.

* **reality.evidence — Anchor key claims**
  Treat the Execution Doc as a statement of current reality. When asserting key completion or readiness claims, include a verifiable pointer to the supporting artifact. If no artifact is available, label the claim as unverified.

* **design.delta — Record deltas from design**
  Do not restate the design baseline. Record only changes relative to it, including deviations, new constraints, and newly discovered facts, and indicate their impact.

## Workflow

1. Create a new Execution Doc or rewrite the existing one as a snapshot of the current iteration state.
2. Set the current Phase and update content so it reflects the dominant objective. Apply `phase.locality`.
3. Update current-state claims and attach evidence to key assertions. Apply `reality.evidence`.
4. Update deltas relative to the design baseline and remove obsolete items. Apply `design.delta`.
5. Run acceptance checks.

## Acceptance Criteria

A revision is complete only if all checks pass.

* **Response**: Output satisfies the Response Contract.
* **Standards satisfied**: `phase.locality`, `reality.evidence`, `design.delta`.
