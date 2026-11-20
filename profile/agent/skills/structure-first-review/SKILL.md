---
name: structure-first-review
description: "Use when interfaces, records, or rules can give a reviewer a starting point for understanding a design or judging what a change affects."
---

# Structure-First Review

## Evidence for a Review Question

Use the reviewer's question to choose which signature, record, or rule
to examine first. For a broad review, choose a task the design supports
or an outcome the change promises. Which distinction matters to a caller
or reader in that case? In a large change, look for a definition that
connects the parts under review.

Show the relevant part, explain what it means in use, and point to its
source. If the structure leaves the outcome open, use the evidence that
decides the case, such as the order of two operations.

Put the facts needed for one judgment together. If a report promises to
count teams, show the membership key `(team_id, person_id)` beside
`SELECT COUNT(*) FROM memberships`. With two members on the only team,
the expected count is one and the query returns two. When a rule draws on
several clauses, show the conditions that decide the case and identify
the source of each.

## Test What the Structure Tells You

Choose a case that exercises the distinction under review. Can the design
represent it? Could two situations that call for different responses look
identical to the caller or reader? In code, consider which field values a
product type can hold together or what data each alternative of a sum type
carries. When a structure changes, show the relevant parts of its old and
new forms together and trace the same case through both.

Compare the predicted outcome with a documented promise or a use that
depends on it. If the evidence needed to establish actual behavior is
unavailable, say what follows from the structure and which source could
settle the question. If the intended outcome itself is unclear, identify
the case that needs a decision.
