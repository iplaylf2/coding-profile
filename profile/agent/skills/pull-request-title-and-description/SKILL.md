---
name: pull-request-title-and-description
description: "Use when drafting, revising, or reviewing the title or body of a pull request or merge request."
---

# Pull Request Title and Description

## Scope of the proposal

- Which version of the proposal will the text accompany? The displayed
  patch shows what the current PR or MR contains. For a draft or forthcoming
  update, which patch or description establishes its scope?
- If the scope comes from a branch comparison, which base and head are
  intended? Does the comparison start at the merge base or at the base tip?
- Which claims are supported by that change? What context would explain why
  it is being proposed?
- In a wording-only review, which claims can be checked against each other?
  Does the title promise more than the body describes? Which implementation
  claims would require the patch to verify?

## Title and body

- What outcome should a reviewer recognize from the title in a list? Which
  identifier or prefix does the PR or MR title format require?
- Which edits together produce a single outcome? How much of the visible
  change does the body need to mention to explain a decision or consequence
  a reviewer would miss from the diff?
- Where would a reviewer benefit from a closer look, and what in the patch
  makes that worth calling out?
- If the title and patch already explain the proposal, does the reviewer or
  template need any further text?

## Validation in the body

Routine automated results already visible in CI can stay there. Which results
does the request or template require in the text? What additional evidence
or gap in coverage would affect the reviewer's judgment?

For each result included, state what the check actually established.
Distinguish a pending run from a completed check.
