---
name: structure-first-review
description: "Use when reviewing a design or change through its interfaces, records, or rules, including when their structure is implicit in a description."
---

# Structure-First Review

## Evidence for a Review Question

Use the reviewer's question to identify the distinction that matters to
a caller or reader. For a broad review, start from a task the design
supports or an outcome the change promises. In a large change, look for
a definition that connects the parts under review.

Show the relevant part of an existing signature, record, or rule and
point to its definition. When the judgment depends on implicit structure,
write out a working model in the review. Express the relevant fields,
relationships, or state changes in a compact notation using the source's
terms. Show what supports each distinction and mark any assumption that
could change the conclusion.

## Test What the Structure Tells You

Choose a case that exercises the distinction. Can the design represent
it? Could two situations that need different responses look identical to
the caller or reader? In code, consider which field values a product type
can hold together or what data each alternative of a sum type carries.

Compare the predicted result with a documented promise or a use that
depends on it. Suppose a report promises to count teams and its input
table, `memberships`, is described as having “one row for each team a
person belongs to.” Model an input row as `(team, person)`. With two
people on the only team, `SELECT COUNT(*) FROM memberships` would
return two where the report should show one.

For a change, show the relevant parts of the old and new forms together.
If plausible readings of a description would change the answer, write
out the part of the model that differs between them. Trace the same case
through each form so the reviewer can see how it would be handled.

When the structure allows several outcomes, check the behavior that
determines which occurs, such as the order of two operations. If that
evidence is unavailable, say what follows from the structure and what
would settle the question. If the intended outcome is unclear, identify
the decision the design leaves open.
