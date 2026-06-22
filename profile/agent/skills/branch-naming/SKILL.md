---
name: branch-naming
description: "Use when the user asks to generate, refine, choose, or review a Git branch name using repository conventions, work evidence, or task context, or when a broader branch workflow needs a branch-name decision. Do not use for Git branch operations themselves; in a broader branch workflow, use it only to decide the branch name."
---

# Branch Naming

Treat a branch name as a coordination label: it should make the work easy to recognize in branch lists, reviews, automation, and handoffs. This skill is responsible for selecting or evaluating that label, grounding it in evidence, and validating it as a branch name; branch lifecycle operations belong to the surrounding workflow.

## Intent Questions

- What branch-name decision is needed, and what output shape did the user request?
- What explicit naming constraints must shape the candidate, such as format, work-item identifiers, separators, length, language, or repository policy?
- Which missing details can be inferred from repository conventions, work evidence, and local vocabulary instead of asking the user?
- Which missing answer would materially change the required format, work identity, or local convention enough to require user clarification?

## Information Sources

- User constraints are authoritative for required format, work-item identifier placement, output shape, and repository policy.
- Local branch history supplies grammar. Inspect recent local and remote branch names with `git for-each-ref refs/heads refs/remotes --sort=-committerdate --format='%(refname:short)'` when available.
- Work evidence supplies meaning. Prefer the user's task description and available work evidence, such as an issue or PR title, staged or unstaged changes, or a target diff, over the current branch name.
- Repository context supplies vocabulary and possible scopes. Inspect the README, project metadata, nearby files, and ownership boundaries only as much as needed to understand the domain.
- When sources disagree, use local branch convention for grammar, work evidence for meaning, and the fallback shape only where local convention is absent.

## Name Shape

- Match local branch conventions before using a fallback shape.
- When no local convention is visible, prefer `<type>/<scope>/<subject>` if a non-speculative scope exists; otherwise use `<type>/<subject>`.
- Use a small, honest `type` such as `feat`, `fix`, `docs`, `style`, `refactor`, `test`, or `chore`, unless the repository uses another type set.
- Use lowercase ASCII and hyphen-separated slugs by default. Preserve ticket identifiers as written when their case or hyphenation is meaningful, unless local branch history normalizes them.
- If a ticket identifier is required and no local placement exists, put it at the start of the `subject` segment: `<type>/<scope>/<ticket>-<subject>` or `<type>/<ticket>-<subject>`.
- Keep the full branch name short enough to scan, usually under about 60 characters when no local convention suggests otherwise.

## Element Responsibilities

- `type` routes the work category; it should not repeat the whole slug.
- `scope` names the subsystem, package, command, profile, feature area, or other ownership boundary. Omit it when it would be guessed.
- `subject` describes the intended outcome or user-facing work. It should not list files, repeat the type or scope, or describe the editing action instead of the result.
- `ticket` is an external work item identifier such as `PROJ-123`, `LIN-456`, or an issue number. It provides traceability, should not displace `subject`, and its position should follow local convention when one exists.

## Review Questions

- Does the name satisfy local convention or an intentionally justified `<type>/<scope>/<subject>` or `<type>/<subject>` fallback?
- Do `type`, `scope`, `subject`, and `ticket` each carry separate information without overlap?
- Does the name reflect the work evidence, repository background, and repository vocabulary without making unsupported claims?
- Does the candidate satisfy Git ref rules? Validate an exact candidate with `git check-ref-format --branch <candidate>` when a repository shell is available.
- Does the candidate collide with an existing local or remote branch name?
- If this is part of a broader branch workflow, can the naming recommendation stand on its own without implying an operation?

## Handoff Questions

- What branch name should the user be able to use directly? Put the best candidate first.
- If multiple names are useful, what distinct convention or emphasis makes each option different?
- What evidence shaped the recommendation, and was it enough to support the chosen name?
- Was the exact candidate validated against Git ref rules and existing branch names, or was validation unavailable?
