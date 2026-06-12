---
name: pull-request-authoring
description: "Use when the user asks to draft, refine, choose, or review pull request or merge request text, including title, body, summary, description, or complete PR/MR content, based on a diff, branch, issue, commit list, existing draft, review context, or described code change, or when a broader PR/MR workflow needs PR/MR wording. Do not use for code review, PR creation, or PR metadata changes that do not require drafting or evaluating PR/MR text."
---

# Pull Request Authoring

## Intent Questions

- What PR artifact did the user ask for: title, body, complete PR/MR text, options, refinement, or review of an existing draft?
- What expression constraint matters: local format, required references or sections, validation detail, length, language, tone, title style, or reviewer role?
- Who is the likely reader: immediate reviewer, owning maintainer, cross-team reviewer, release-oriented reader, external contributor, or future maintainer?
- Which missing details can be inferred from repository context, diff evidence, branch name, commits, linked issues, or the existing draft instead of asking the user?

## Evidence Questions

- What change is being proposed? Treat the user-provided diff, branch comparison, PR patch, staged changes, unstaged changes, commit range, or prose description as the source of truth.
- What context explains the change? Use linked issues, branch names, commit messages, review comments, or product notes as intent hints, but do not let them override the actual diff.
- What repository is this? Inspect the README, project metadata, nearby files, and ownership boundaries only as much as needed to understand the product or domain, local vocabulary, and likely reviewer expectations.
- What local PR expression already exists? When available, inspect visible templates and a small sample of recent, relevant, representative PR/MR titles or bodies to infer title grammar, body length, section names, audience assumptions, and validation detail.
- What visible template or formatting requirement exists? Respect it when it is supplied or discoverable, but do not investigate hosting platform details merely to guess where the PR/MR will be published.
- Which changed details are obvious from the diff view, and which consequences are not visible from file names or hunks alone?

## Title Responsibilities

- Make the title answer what changed and where it matters, not which files were edited.
- Prefer the repository's PR title convention. If none is visible, use a concise imperative or noun phrase that a reviewer can scan in a PR list.
- Include an issue or ticket identifier only when the user, branch, template, or local convention supports it.
- Avoid vague editing verbs such as "update", "fix stuff", or "changes" unless that is the repository's explicit style.
- Do not force commit-message grammar into the PR title unless local PRs consistently use it.

## Body Responsibilities

- The PR body should orient a reviewer, not duplicate the diff.
- Write for the likely reviewer first and the future reader second.
- Put the reader-facing reason early: problem, intent, user-visible behavior, operational need, or maintenance outcome.
- Summarize the meaningful change at the level a reviewer needs to evaluate scope, risk, and correctness.
- Call out non-obvious design choices, compatibility concerns, migrations, configuration changes, data effects, security or privacy implications, performance impact, and follow-up work when supported by evidence.
- Include validation that was run or should be run only when known from the user, logs, local commands, CI, or repository convention.
- Scale detail with review risk: small obvious changes can be short; risky behavior, migration, compatibility, data, security, or operational changes need clearer context and validation.
- Preserve required template sections when a template is visible. If no template is available, use portable Markdown with simple headings and bullets.
- Keep the body limited to reviewer-facing prose, required template content, and supported validation or risk context.

## Diff Duplication Boundary

- Do not repeat diff-view facts that are self-evident: file lists, renamed files, one bullet per touched module, or line-by-line implementation narration.
- Repeat a visible change only when it explains review intent, risk, migration, behavior, or a decision the diff cannot make obvious on its own.
- Prefer grouping related edits by outcome over listing every changed file.
- Mention implementation details when they are the review surface, not merely because they appear in the diff.
- If the body would only restate the title and file list, keep it short and focus on motivation plus validation.

## Review Questions

- Does the title identify the change without leaking implementation trivia or overstating scope?
- Does the body explain why the change exists, what matters for review, and how it was validated?
- Did repository vocabulary, audience expectations, template conventions, and recent similar PRs shape the draft without adding unsupported claims or stale habits?
- Are obvious diff details omitted unless they carry consequence, risk, or reviewer guidance?
- Would a reviewer know where to focus after reading the body?

## Handoff Questions

- What exact title and body should the user be able to paste directly?
- If multiple options are proposed, what emphasis or convention distinguishes each one?
- What evidence was used: repository background, audience, PR template, recent PRs, diff, branch, issue, commits, CI, local commands, or only the user's prose?
- What uncertainty remains because the change evidence, template, validation, or linked context was unavailable?
