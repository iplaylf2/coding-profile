---
name: doc-editing
description: Use when the user asks to edit, polish, or rewrite documentation or long-form prose to improve clarity, terminology stability, and structural quality, aiming for publishable text without tone drift or unnecessary structural churn.
---

# Doc Editing

Edit documentation and long-form prose to be clear, precise, and easy to scan. Return the revised document only, not commentary about the edit.

## Document Model

Definitions used to reason about documents and edits.

### Semantic Layers

A document can contain two kinds of description.

* **Meta description**
  Text that describes how the document should be written or edited, such as audience, scope, tone, format expectations, and must-not-change constraints.

* **Content description**
  Text that belongs in the document as subject matter. Anything the user explicitly requests to be included in the document is content.

### Structure Forms

A document can be organized using two structural forms.

* **Dict structure**
  Named modules with distinct responsibilities. Each responsibility has a clear home.

* **List structure**
  Peer items of the same kind. Peer items are written so they can be read independently and remain comparable in granularity.

## Editing Standards

Apply these standards throughout the edit.

1. **Keep semantic layers distinct**
   Avoid mixing meta description into content description unintentionally. When meta-level material is part of the document’s subject matter or explicitly requested for inclusion, place it deliberately.

2. **Model responsibilities as dict**
   Organize major responsibilities as named modules. Keep module boundaries clear so each topic has a stable home.

3. **Name sections by responsibility**
   When sections or headings exist, use stable, responsibility-oriented names. Avoid renaming that does not improve structure or comprehension.

4. **Use lists for peer items**
   Use lists only for items that are the same kind of peer statement. Keep list items similar in length and information density.

5. **Keep list items independent**
   Do not rely on cross-item references or hide shared prerequisites inside a single item. If multiple items require the same prerequisite, state it once outside the list or move it into a responsible module.

6. **Prefer definitions over explanatory enumerations**
   When explaining a concept or rule, favor a concise qualitative definition with boundaries and usable criteria. Use lists to apply a definition, not to imply meaning through a long enumeration.

7. **Remove redundancy and keep one canonical expression**
   Eliminate repeated ideas and conflicting statements. Express each concept or rule once, and reuse the same wording rather than restating it in multiple places.

8. **Balance proportions**
   Keep module size and emphasis proportional to responsibility and importance. Avoid over-expanding one section in a way that makes the overall document uneven.

9. **Optimize globally**
   Make edits with the full document in view. Prefer changes that improve the whole document over local improvements that create drift elsewhere.

10. **Preserve format conventions**
    Work within the document’s existing formatting system and local conventions. Improve readability inside that system rather than switching formats.

## Workflow

Use a repeatable editing pass.

1. Determine what the document is about and what the user wants included as content. Identify any meta description constraints in the request or in the text.
2. Establish or repair a dict structure for major responsibilities. Align section names to responsibilities when applicable.
3. Refactor lists so they express peer items of the same kind. When a list is carrying shared prerequisites, move the prerequisite outside the list or into an appropriate module.
4. Edit prose for clarity and precision while preserving meaning, terminology, and tone.
5. Replace explanatory long lists with definitions where it improves uniformity. Keep only the minimal list needed to apply the definition.
6. Consolidate repeated statements so each concept or rule has a single canonical expression.
7. Rebalance modules and lists so length and information density match responsibility and importance.
8. Do a whole-document pass to align terminology, emphasis, and structure after local edits.

## Acceptance Criteria

Confirm the result meets these checks before returning.

* The response contains the revised document only.
* Semantic layers are kept distinct, and any meta-level material included as content is placed deliberately.
* Major responsibilities are organized into named modules with clear boundaries.
* Lists are used only for peer items; items are independent and comparable in granularity.
* Concepts and rules are explained by definitions rather than long enumerations that imply meaning.
* Redundancy and conflicting statements were removed; each concept or rule has one canonical expression.
* Proportions are balanced across modules and across list items.
* Changes improve the document as a whole without local over-optimization.
* The document’s original formatting conventions are preserved.
