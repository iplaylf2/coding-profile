---
name: pull-request-authoring
description: "Use when the user asks to draft, refine, choose, or review pull request or merge request text, including a title, body, summary, description, complete draft, or a substantive wording decision within a broader task. Do not use for code review or PR/MR operations and metadata changes that do not require drafting or evaluating the text."
---

# Pull Request Authoring

## Text Boundary

Produce or evaluate reviewer-facing text for one defined proposed change. The
selected change source sets its factual scope; supported context may explain
intent without expanding that scope.

## Intent Questions

- What PR/MR text did the user request, and are they asking for generation,
  refinement, options, or review of an existing draft?
- Who is the immediate reviewer, what context can they assume, and what should a
  future reader still understand?
- What language, tone, length, title style, output shape, references, or exact
  wording did the user require?
- Which missing detail can be inferred from the repository and proposed change,
  and which would materially change the text enough to require clarification?

## Change Evidence Questions

- Which task-selected PR/MR patch, base-to-head comparison, diff, commit range,
  or prose scope defines the proposed change, and when the source is
  comparison-based, what are its base and head?
- Which issues, branch names, commits, reviews, or product notes explain intent
  without expanding the selected proposal?
- When candidate sources disagree, which one did the user or task select, and
  would the difference materially affect the draft?
- For a wording-only review without a change source, what can be evaluated from
  the supplied text, and which factual claims remain unverified?

Once the proposed-change source is selected, do not add ambient index, worktree,
untracked, or unrelated commit content unless the user includes it in scope.

## Expression Questions

- Which current template, contribution rule, automated text check, or reference
  format governs the text?
- Which product, API, issue, or user-facing terms must remain exact?
- When an explicit user request conflicts with a governing requirement, what
  conflict must be surfaced and which valid choices remain?
- Which recent, relevant PRs/MRs provide stable expression evidence rather than
  incidental historical style?
- When no local expression convention exists, what concise portable Markdown
  structure best serves the reviewer?

Current requirements govern structure and content; historical examples inform
only choices those requirements leave open.

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
- For a complete draft, do the title and body present the same proposal without
  contradiction, misleading emphasis, or unnecessary repetition?

## Validation Boundary

Routine automated validation and its results belong in CI by default rather than
being repeated in PR/MR text.

- Does a governing repository requirement or explicit user request require
  validation text, and what minimum accurate content does it require?
- Which change-specific validation evidence or coverage limitation would
  materially affect review but is not adequately represented by CI results?

When either exception applies, state only the required or reviewer-relevant
outcome, coverage, or limitation. Include commands or job names only when
required or when they materially aid review. Describe any included result
according to available evidence; do not present planned or otherwise unobserved
validation as completed. Keep checks of the authored PR/MR text outside the
paste-ready draft; they do not validate the implementation.

## Result

Return the requested result first. Make any authored or revised PR/MR text
paste-ready. When authoring supports a broader task, preserve the selected text
as that task's PR/MR input without displacing its primary result. Make
alternatives genuinely distinct, disclose only uncertainty that affects
accurate use, and do not claim that a platform operation was performed without
evidence.
