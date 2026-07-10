---
name: commit-authoring
description: "Use when the user asks to draft, refine, choose, or review Git commit-message text, including a substantive message decision within a broader commit task. Do not use for Git commit operations that do not require drafting or evaluating the message."
---

# Commit Authoring

## Message Boundary

Produce paste-ready history text for one selected change source. That source
defines the change being described; supported user and repository context may
explain its intent without expanding the change. Repository convention and user
constraints define how the message should be expressed.

## Change Source Questions

- What exact diff, commit, range, description, or other change target did the
  user select?
- When the message belongs to a broader commit task, what target does that task
  define, such as the index for a new commit or a selected commit for rewording?
- When the user refers generally to "these changes," which plausible targets
  does repository status reveal, and would they produce materially different
  messages?
- Which branch, issue, PR, or repository context explains intent without
  expanding the selected change source?
- Does the selected source contain changes that do not form one defensible
  history entry, and would separate messages represent them more accurately?
- For a wording-only review without change evidence, what can be judged from the
  supplied message, and which factual coverage remains unverified?
- Which unresolved source choice would materially change the message enough to
  require clarification?

Treat the index, worktree, untracked files, branch comparison, commit range, and
PR patch as distinct sources. Combine them only when the user or defined task
selects that combination. Staged content is authoritative only when the request
or commit task makes it the target.

## Convention And Evidence Questions

- What output shape, language, exact wording, issue reference, or message format
  did the user require?
- Which documented or enforced repository rules govern the message, including a
  template, commit-message linter, hook, or contribution policy?
- Which facts and repository vocabulary from the selected change should appear
  in the message?
- Which patterns in recent, relevant complete commit messages are stable enough
  to count as an unstated local convention?
- Which supplied words are binding terms, and which communicate intent to
  translate into repository vocabulary?
- When an explicit request conflicts with an enforced rule, what conflict must
  be surfaced and which valid choices remain?

When body convention matters, inspect complete messages rather than subjects
alone; a bounded sample such as `git log -n 20 --format='%B%x00'` preserves body
structure.

## Message Questions

- What outcome should the selected change preserve in history?
- Which elements does the governing grammar require, and what separate
  information should each carry?
- What wording describes the change's effect without reducing it to files,
  editing activity, or every implementation step?
- What motivation, constraint, decision, compatibility effect, or consequence
  will remain useful after the diff is no longer at hand?
- Would a body preserve that durable, non-obvious information, or merely narrate
  the diff, list files, add boilerplate, or compensate for a vague subject?
- Does every factual claim, issue reference, and breaking-change marker have
  support in the selected change, reliable context, an explicit requirement, or
  a governing rule?
- If multiple candidates are requested, what semantic emphasis, information
  tradeoff, or valid grammar makes each option genuinely distinct?
- For a review request, what concrete inaccuracy, convention failure, or loss of
  historical value determines the verdict rather than stylistic taste?

## Fallback Grammar

Use these rules only when no repository message grammar controls the decision:

- Use `<type>(<scope>): <subject>`, with a lowercase type and an optional,
  evidence-backed scope.
- Let `type` classify the change effect, `scope` identify a stable local area,
  and `subject` state the outcome without repeating the other elements.
- Choose an honest type from a small set such as `feat`, `fix`, `docs`, `style`,
  `refactor`, `test`, or `chore`.
- Separate a body from the subject with a blank line. Use it for durable,
  non-obvious motivation, constraints, decisions, or consequences, not to repair
  a vague header.
- When a supported breaking change requires a marker, place `!` before the colon
  as in `<type>(<scope>)!: <subject>`, add a `BREAKING CHANGE:` footer after a
  blank line following the subject or body, or use both when the chosen grammar
  permits it.
- Keep the subject concise enough to scan; remove vague or repetitive wording
  before sacrificing meaningful information to an arbitrary limit.

## Validate The Text

Check required grammar, issue syntax, line limits, and breaking-change syntax
against the governing repository policy, explicit requirement, or fallback
grammar. Run a repository-provided commit-message linter when it is available
and applicable to the exact draft. These checks validate message text, not the
implementation or its tests.

## Result

Return the requested subject, complete message, distinct options, review verdict,
or revision with paste-ready text first. State the selected change source only
when it prevents ambiguity, report message validation according to what was
actually checked, and do not imply that a Git operation was performed.
