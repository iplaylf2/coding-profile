---
name: branch-naming
description: "Use when the user asks to generate, refine, choose, or review a Git branch name from repository or work-item context such as an issue, pull request, diff, staged changes, or task description. Do not use for branch operations unless the task is primarily about choosing the name."
---

# Branch Naming

## Intent Questions

- What branch-name task did the user ask for: one recommended name, options, a review, a rename suggestion, or a command containing the name?
- What output constraints did the user specify: strict format, required work-item identifier, separator, maximum length, language, or repository policy?
- Which missing details can be inferred from repository conventions, work evidence, and local vocabulary instead of asking the user?

## Information Sources

- User constraints are authoritative for required format, work-item identifier placement, and command output.
- Local branch history supplies grammar. Inspect recent local and remote branch names with `git for-each-ref refs/heads refs/remotes --sort=-committerdate --format='%(refname:short)'` when available.
- Work evidence supplies meaning. Prefer the user's task description, issue or PR title, staged changes, unstaged changes, or target diff over the current branch name.
- What repository is this? Inspect the README, project metadata, nearby files, and ownership boundaries only as much as needed to understand the domain, local vocabulary, and possible branch scopes.
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
- Does the candidate satisfy Git ref rules? Validate the exact candidate with `git check-ref-format --branch <candidate>` when recommending a command.
- Does the candidate collide with an existing local or remote branch before recommending creation or rename?

## Handoff Questions

- What branch name should the user be able to use directly? Put the best candidate first.
- If multiple names are useful, what distinct convention or emphasis makes each option different?
- What evidence was used: local branch history, work item, diff, staged changes, unstaged changes, repository background, repository vocabulary, or only the user's prose?
- If a command is requested, should it be `git switch -c <name>`, `git branch -m <name>`, or another explicit operation, and was the name validated first?
