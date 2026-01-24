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
  Text that constrains how the document should be written or edited, such as audience, scope, tone, format expectations, and must-not-change constraints.

* **Content description**
  Text that belongs in the document as subject matter. Anything the user explicitly requests to be included in the document is content.

### Structure Forms

A document can be organized using two structural forms.

* **Dict structure**
  Named modules that divide the document by responsibility. Each responsibility has a stable home, so readers know where to find and place information.

* **List structure**
  A set of items grouped under one framing because they serve the same responsibility in the document.

## Editing Standards

Apply these standards throughout the edit.

1. **Keep semantic layers distinct**
   Keep meta description separate from content description unless it is explicitly part of the subject matter.

2. **Model responsibilities as dict**
   Use dict structure to assign each major responsibility a stable home.

3. **Name sections by responsibility**
   Name headings by responsibility, and rename only to improve structure or comprehension.

4. **Use lists within one responsibility**
   Use lists only to enumerate within one responsibility, with items similar in length and information density.

5. **Prefer definitions over enumerations**
   Explain concepts with definitions and criteria, and use enumerations only to apply them.

6. **Remove redundancy by responsibility**
   Remove cross-module repetition by giving each concept or rule one responsible home.

7. **Balance proportions and optimize globally**
   Edit with the whole document in view, keeping emphasis proportional to importance.

8. **Preserve format conventions**
   Improve readability within the existing formatting system and local conventions.

## Workflow

Use a repeatable editing pass.

1. Identify the document’s subject, required content, and any meta description constraints.
2. Establish or repair a dict structure for major responsibilities, and align headings to responsibilities.
3. Normalize lists by responsibility, and move shared prerequisites to the responsible module.
4. Edit prose for clarity and precision while preserving meaning, terminology, and tone.
5. Replace explanatory enumerations with definitions.
6. Remove overlap by relocating each concept or rule to its responsible home.
7. Rebalance modules and lists to match responsibility and importance.
8. Do a whole-document pass to align terminology, emphasis, and structure.

## Acceptance Criteria

Confirm the result meets these checks before returning.

* The response contains the revised document only.
* Semantic layers are kept distinct, and any meta-level material included as content is placed deliberately.
* Major responsibilities are organized into named modules with clear boundaries.
* Lists are used only to enumerate within one responsibility, and list items are similar in length and information density.
* Concepts and rules are explained primarily through definitions with usable boundaries and criteria.
* Redundancy across modules is removed by giving each concept or rule a responsible home.
* Proportions are balanced across modules and lists, and format conventions are preserved.
