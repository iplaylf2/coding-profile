---
name: pull-request-authoring
description: "Use when the user asks to draft, refine, choose, or review pull request or merge request text, including a title, body, summary, description, complete draft, or a substantive wording decision within a broader task. Do not use for code review or PR/MR operations and metadata changes that do not require drafting or evaluating the text."
---

# Pull Request Authoring

## Text Boundary

Produce or evaluate reviewer-facing text for one defined proposed change. The
result may be a title, body, complete draft, summary, revision, options, or a
review verdict.

## Intent Questions

- What PR/MR text did the user request, and are they asking for generation,
  refinement, options, or review of an existing draft?
- Who is the immediate reviewer, what context can they assume, and what should a
  future reader still understand?
- What language, tone, length, title style, required sections, references, or
  exact terms constrain the result?
- Which missing detail can be inferred from the repository and proposed change,
  and which would materially change the text enough to require clarification?

## Change Evidence Questions

- Which task-selected PR/MR patch, base-to-head comparison, diff, commit range,
  or prose scope defines the proposed change, and what base and head belong to
  that source?
- Which issues, branch names, commits, reviews, or product notes explain intent
  without expanding the selected proposal?
- When candidate sources disagree, which one did the user or task select, and
  would the difference materially affect the draft?
- For a wording-only review without a change source, what can be evaluated from
  the supplied text, and which factual claims remain unverified?

Once the proposed-change source is selected, do not add ambient index, worktree,
untracked, or unrelated commit content unless the user includes it in scope.

## Expression Questions

- Which current template, contribution rule, automation check, title rule, or
  reference format governs the text?
- Which product, API, issue, or user-facing terms must remain exact?
- Which recent, relevant PRs/MRs provide stable expression evidence rather than
  incidental historical style?
- When no local expression convention exists, what concise portable Markdown
  structure best serves the reviewer?

Current normative requirements govern structure and validation; historical
examples only inform choices those requirements leave open.

## Title Questions

- What outcome and affected area must a reviewer recognize while scanning a PR
  or MR list?
- Which repository title rule, required identifier, or prefix applies?
- What scope, user impact, compatibility effect, or completion claim is
  supported, and what would overstate the proposed change?
- Which implementation detail would distract from the review-level result?
- If no local title rule exists, what concise outcome-and-area phrase will scan
  well without automatically importing commit-message grammar?
- For a title review, what concrete accuracy, convention, or reviewer-navigation
  issue determines the verdict?

## Body Questions

The body should orient the reviewer rather than narrate the patch. Repeat a
visible change only when it explains motivation, consequence, risk, migration,
review focus, or a decision that the diff does not make clear.

- Why does the proposal exist, and what should the immediate reviewer understand
  or examine before reading individual hunks?
- Which related edits should be grouped by reviewer-relevant outcome rather than
  listed by file or module?
- Which non-obvious design choice, compatibility or migration concern,
  configuration or data effect, security or privacy implication, performance or
  operational impact, or follow-up is supported and relevant to review?
- Which patch facts are self-evident, and which need explanation because they
  change review focus or interpretation?
- How should the amount and structure of prose scale with review risk while
  satisfying required template sections?
- For a body review, which claim, omission, structure, or emphasis materially
  affects correctness or reviewer usefulness rather than stylistic preference?

## Validation Questions

- Which validation information belongs in the text because a template, user
  requirement, or review risk makes it relevant?
- For each claimed check, was it performed locally, observed in CI, planned or
  recommended, not run, or left unknown?
- Which checks validate the PR/MR text or references, and which provide evidence
  about the code or behavior?
- When missing or unavailable validation is relevant, how should it be expressed?

Do not present a planned check, inference, or text-format check as completed code
validation.

## Result

Return the requested result first. For drafting or revision, put paste-ready
PR/MR text first. Make alternatives genuinely distinct, disclose only
uncertainty that affects accurate use, and do not imply that a platform
operation was performed.
