---
name: commit-message
description: "Use when a task calls for drafting, revising, choosing, or reviewing Git commit message text."
---

# Commit Message

## The change being recorded

- Which change will the message describe? A reword takes its scope from the
  selected commit. When “these changes” could mean staged or unstaged work,
  which claims or required markers would differ?
- What outcome does the selected change establish? What supports the stated
  reason for it or connects it to a referenced issue?
- In a wording-only review, what can be judged from the message itself, and
  which claims would need the change as evidence?

A plain commit records the index. A commit limited to selected paths can
record their working-tree contents while leaving other changes staged. If the
requested scope includes untracked files, read them before describing the
change.

## The history entry

- Read the header as a single log entry, with the branch and PR out of view.
  What outcome can the reader identify? Would that wording hide an independent
  change? Which words add meaning beyond the type, scope, and context already
  apparent in that history?
- Given that header and the recorded patch, what decision or consequence
  would a future reader still need explained? Would it justify a body?

When inferring body conventions from local history, read complete messages
from comparable commits.

## Fallback grammar

These defaults fill format choices left open by the request and the repository.

- Use `<type>: <subject>`. A lowercase type such as `fix` or `docs` classifies
  the change. When a stable local area helps identify the effect, use
  `<type>(<scope>): <subject>`.
- Separate an optional body from the subject with a blank line.
- When a breaking-change marker is required, this grammar allows `!` before
  the colon, a `BREAKING CHANGE: <description>` footer, or both. Separate the
  footer from the subject or body with a blank line.

If the repository supplies a commit-message linter, check the exact draft with
it.
