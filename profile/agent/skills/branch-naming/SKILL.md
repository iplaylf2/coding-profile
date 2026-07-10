---
name: branch-naming
description: "Use when the user asks to generate, refine, choose, or review a Git branch name, including a substantive branch-name decision within a broader task. Do not use for Git branch operations that do not require deciding or evaluating the name."
---

# Branch Naming

## Naming Boundary

Produce a branch name or review verdict for one defined branch purpose or unit
of work. Treat the name as a coordination label for recognition, traceability,
and automation.

## Context Questions

- What branch purpose or unit of work did the user identify, and which task,
  issue, diff, or proposed name defines it?
- What output did the user request, and which identifiers, wording, language,
  separators, prefixes, or format rules must remain exact?
- Which repository policy or tooling governs valid branch grammar?
- When an explicit output constraint conflicts with governing branch grammar,
  what incompatibility must be surfaced and which valid choices remain?
- Which work facts and repository vocabulary should supply the name's meaning?
- Which recent, relevant branch names provide consistent evidence of current
  practice rather than stale or incidental history?
- Which missing detail can be inferred from authoritative context, and which
  would materially change the purpose or required grammar enough to require
  clarification?

Use explicit user choices for the target and output, governing repository rules
for required grammar, work facts and vocabulary for meaning, and relevant branch
history only for otherwise unstated convention. Use the fallback grammar only
when no local grammar controls the decision.

When branch history is relevant, inspect recent local and remote refs with
`git for-each-ref`. Exclude symbolic refs, remove `refs/heads/` and
`refs/remotes/<remote>/` prefixes, and deduplicate normalized names before
inferring grammar.

## Branch Name Questions

- What purpose, outcome, or stable identifier will make the branch recognizable
  in lists and coordination?
- Which segments does the governing grammar require, and does each carry
  distinct information?
- If the grammar uses a type, what work effect does it classify?
- If it uses a scope, what meaningful product, domain, component, or stable
  boundary supports that scope?
- Which supplied token must remain exact for traceability or automation, and
  which task wording should be translated into concise outcome language?
- Which context must travel with the branch name, and which will reliably
  accompany it on the intended viewing or coordination surfaces?
- For a review request, what concrete convention, accuracy, syntax, collision,
  or recognition issue determines the verdict, and would a replacement help?

## Fallback Grammar

Use these rules only when no repository grammar controls the decision:

- For a bounded change, use `<type>/<scope>/<subject>` when the work supports a
  real scope; otherwise use `<type>/<subject>`.
- For a release, maintenance line, experiment, or another purpose-oriented
  branch, use the clear purpose and stable identifier instead of forcing the
  bounded-change grammar.
- Choose the type that best reflects the work effect from a small set such as
  `feat`, `fix`, `docs`, `style`, `refactor`, `test`, or `chore`. Omit a
  speculative scope, and make the subject identify the intended outcome rather
  than files or editing activity.
- Put a required ticket at the start of the subject segment when no other
  placement rule exists.
- When neither an explicit nor local format controls generated slug text, use
  lowercase ASCII and hyphen-separated words. Preserve the required spelling and
  case of identifiers.

## Validate The Candidate

Validate each exact candidate with
`git check-ref-format --branch <candidate>` when the command is available. This
establishes Git ref syntax only and does not require a repository.

When availability affects the recommendation, inspect exact and namespace
collisions in the relevant local refs. Treat remote-tracking refs as local
observations; query current remote state only when the requested decision
depends on current publication or tracking availability.

## Result

Return the best name first, distinct alternatives when requested, or a concise
review verdict. Report syntax and collision results according to what was
actually checked, and do not imply that a branch operation was performed.
