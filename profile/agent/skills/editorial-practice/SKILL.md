---
name: editorial-practice
description: "Use when the user asks to draft, revise, rewrite, restructure, copy edit, or review prose documents or documentation. Do not use for source code changes unless the task is primarily about surrounding prose."
---

# Editorial Practice

## Intent Translation Questions

- What should the document accomplish after this edit?
- Which parts of the user request are instructions to the agent and should not appear in the document?
- Which parts are source facts, constraints, or required content that should be integrated?
- What would this intent sound like if it had been written directly for this document?
- Who is the document speaking to, and what should that reader be able to do after reading?
- What local language, tone, vocabulary, and structure should the edit blend into?
- What facts, constraints, or voice must be preserved?
- Which missing answers can be inferred from the document, surrounding files, or request instead of asking the user?
- Which missing answer would materially change the edit and therefore requires user clarification?

## Rewrite Questions

- Does the existing structure already carry the intended meaning, or would a local edit leave patch marks?
- Would added wording create duplication, awkward transitions, tone drift, or visible patching?
- Should a paragraph or section be rewritten so the new intent reads as originally authored?
- Does the user's current intent require changing the order, framing, emphasis, or reader path enough to restructure instead of patch locally?
- Is the structure sound enough for copy editing, or would polishing sentences preserve a flawed shape?

## Cohesion Questions

- Does the result read like one coherent document rather than a sequence of additions?
- Are headings, transitions, terminology, level of detail, and supporting concerns aligned with the document's center of gravity?
- Did any agent-facing phrase leak into the document, such as "as requested", "this adds", or "the user wants"?
- Are there repeated explanations, leftover caveats, or contradictions caused by incremental edits?
- Would a broader rewrite reduce reader effort without changing the supported facts?

## Handoff Questions

- What intent translation should be reported to the user?
- What edit level should be named: local edit, paragraph rewrite, section rewrite, or restructure?
- What unsupported facts, unresolved choices, or authorial decisions should be called out?
