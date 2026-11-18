---
name: branch-naming
description: "Use when a Git branch name needs to be proposed, revised, chosen, or reviewed."
---

# Branch Naming

## Choosing the name

- What outcome or purpose distinguishes this branch from nearby refs?
  Where will the name be read, and which repository context will reliably
  accompany it there?
- Read the segments together. What distinction would be lost by dropping an
  optional word or scope? Which identifier must keep its exact spelling for
  a link or naming rule to work?
- When the format includes a scope, which area actually changes? If the
  problem surfaced at one interface, is the fix confined to that interface?
- If the branch format is unstated, what pattern do recent branches with a
  similar purpose share?

When sampling branch names, use `git for-each-ref refs/heads refs/remotes`.
Omit symbolic refs, strip `refs/heads/` or `refs/remotes/<remote>/`, and
count each resulting name once.

## Fallback grammar

These defaults fill format choices left open by the request and the repository.

- For a bounded change, use `<type>/<subject>` or `<type>/<scope>/<subject>`
  when a scope identifies a distinct component. The type describes the effect
  of the work, such as `fix` or `feat`. The subject names its outcome.
- For a branch defined by its purpose, such as a release line, use that purpose
  and a distinguishing identifier.
- Use lowercase ASCII words separated by hyphens for generated slug text.
  Place a required ticket at the start of the subject when its position is open,
  retaining its spelling and case.

## Checking a candidate

Pass the candidate as a single argument to `git check-ref-format --branch`.
A literal name passes when Git succeeds and prints that same name. Git can
expand previous-checkout shorthand such as `@{-1}` before checking it.

If a new name must be available, check the intended branch namespace for the
exact name and for conflicts at slash boundaries. Remote-tracking refs show
the last locally observed state. For current remote availability, inspect
the remote's branch refs directly.
