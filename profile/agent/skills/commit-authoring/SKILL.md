---
name: commit-authoring
description: "Use when the user asks to generate, refine, choose, or review a Git commit message based on a diff, staged changes, branch, pull request, or described code change, including semantic or Conventional Commit styles. Do not use for actually creating commits unless the task is primarily about drafting the commit text."
---

# Commit Authoring

## Intent Questions

- What output constraints did the user specify: strict `<type>(<scope>): <subject>` header, local variant, body, language, number of options, or review criteria?
- Which missing details can be inferred from the diff, repository context, branch, and local conventions instead of asking the user?

## Evidence Questions

- What repository is this? Inspect the README, project metadata, nearby configuration, and recent commits only as much as needed to understand the domain, vocabulary, ownership boundaries, and commit style.
- What branch is active? Read `git branch --show-current` or PR head/base refs when available. Use branch names as intent hints, not as proof of what changed.
- What exact change is being committed? Treat the diff or supplied change description as the source of truth for the message.
- Which evidence source is authoritative for this request: user-provided diff, staged changes, unstaged changes, branch comparison, PR patch, or prose description?
- Is the commit target staged? In a local repository, inspect `git status --short`; prefer `git diff --cached --stat`, `git diff --cached --name-status`, and targeted cached diffs when staged changes exist.
- If nothing is staged, read unstaged status and diffs before drafting, and make clear that the message is based on unstaged changes.
- What local grammar already exists? Read recent subjects with `git log -n 20 --pretty=format:%s` to infer type set, scope style, subject style, language, capitalization, and body usage.
- Do the changes belong together? When changes appear unrelated, propose separate commit messages instead of forcing them into one vague subject.

## Header Shape

- Use the user's requested format first; otherwise follow the repository's recent commit grammar when it is consistent enough to infer.
- When local grammar is absent or compatible with semantic style, prefer a first line shaped as `<type>(<scope>): <subject>`.
- Use lowercase `type`, an honest parenthesized `scope`, a colon followed by one space, and a concise `subject` when using semantic header grammar.
- Omit the scope when no non-speculative scope exists, the repository's local style consistently omits it, or the inferred local grammar does not use scopes.
- Keep the first line to one change summary. Put motivation, migration notes, or consequences in a body after a blank line only when the subject cannot carry them.

## Element Responsibilities

- `type` answers what kind of change this is, not where it happened. Use the repository's type set first; otherwise prefer the small semantic set: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, or `chore`.
- `scope` answers where the change belongs: subsystem, package, command, profile, feature area, or other local ownership boundary. It should not repeat the type or summarize the outcome.
- `subject` answers what changed in that scope. It should not restate the type or scope, list filenames, or describe the editing action instead of the result.
- `body` answers why the change was made, what consequences matter, or what migration detail cannot fit in the subject. It should not compensate for a vague header.
- When a change seems to fit multiple types, choose by effect: behavior addition is `feat`, behavior correction is `fix`, docs-only is `docs`, formatting-only is `style`, internal restructuring without behavior change is `refactor`, tests-only is `test`, and maintenance without production behavior is `chore`.
- Match explicit user-requested language or format first; otherwise match the repository's recent commit style without forcing semantic header shape when local grammar clearly differs.
- Keep the subject concise enough for commit history scanning, usually under 72 characters unless local style is longer.

## Context Responsibilities

- Repository context supplies vocabulary, valid scopes, and house style.
- Branch context supplies intent hints and possible issue or feature context.
- Change evidence supplies the facts the message must accurately describe.
- Include issue references, breaking-change markers, validation notes, performance impact, or user-facing impact only when supported by change evidence, user context, or local convention.
- When these sources disagree, prefer change evidence over branch names and prefer repository conventions over generic commit-message advice.

## Review Questions

- Does the first line satisfy the explicit user format, inferred local grammar, or an intentionally justified semantic fallback?
- When using semantic header grammar, do `type`, `scope`, and `subject` each carry separate information without overlap?
- Does the message reflect the repository background and vocabulary without making unsupported claims?
- Did branch context inform the draft without overriding the diff?
- Does the message cover the actual committed change rather than listing files or implementation trivia?
- Would a future maintainer understand why the change belongs together?
- Are unrelated changes being hidden behind a broad verb such as "update" or "fix"?

## Handoff Questions

- What exact commit message should the user be able to use directly, preferably shown before supporting notes?
- If multiple messages are proposed, what distinction makes each option useful?
- What uncertainty remains because the repository background, branch, diff, staging state, or project convention was incomplete?
- Should the user be told whether the message was based on staged changes, unstaged changes, a branch comparison, PR patch, or supplied text?
