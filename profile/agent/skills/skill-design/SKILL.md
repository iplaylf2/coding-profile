---
name: skill-design
description: "Use when the user asks to design, create, review, refactor, or optimize reusable agent skills or their activation and execution behavior. Do not use for ordinary prompts, one-off instructions, application code, or general writing unless the task is about reusable skill behavior."
---

# Skill Design

The requested new or existing skill target is an input supplied by the user or
an already-established task decision. This skill designs, creates, reviews, or
changes that target; it does not decide whether creation is warranted.

Drive context-dependent work with questions. Answer them first from the request,
target artifacts, surrounding conventions, and available evidence. Ask the user
only when an unresolved answer would materially change the requested design.

## Positioning Questions

Read every existing target skill completely. Inspect affected resources and the
local schemas, templates, validators, and repository conventions that govern the
artifact.

Use the current request for desired behavior, runtime and schema requirements
for validity, and current repository conventions for integration. Consult
history only when current evidence cannot explain a compatibility requirement.

When available, use adjacent task guidance only to detect routing or
responsibility overlap. Keep the finished skill independently usable after
activation: express boundaries as domain inputs, outputs, and out-of-scope
decisions without naming, invoking, or requiring another skill or shared context.

- In concrete situations, what is the user trying to accomplish and what would a
  successful result look like?
- Which representative situations actually expose a design choice, and which
  would merely expand a checklist?
- What stable semantic task family appears across the relevant situations?
- What context is already available at activation, and what judgments, workflow,
  or result must the target skill contribute?
- Which responsibilities already belong to baseline agent behavior, project
  guidance, or adjacent task families?

## Front Matter Questions

Front matter routes before the body is loaded. Follow the repository's metadata
schema and keep execution guidance in the body.

- What minimum semantic context is needed to decide whether to load the target
  skill?
- What user intent should activate it, and which adjacent intent should not?
- Would paraphrase, translation, or implication preserve the same activation
  decision?
- Is the description expressing a task family and user intent rather than an
  internal step or artifact inventory, and did any execution detail enter without
  helping activation?

## Skill Body Questions

The body guides work after activation. Fixed invariants and fragile or ordered
procedures may be stated directly; contextual judgments should remain questions
or decision prompts.

- Once the target skill is active, which task-specific judgments, workflows,
  result paths, validation, and result delivery must it guide?
- What information sources can change those decisions, what can the agent infer
  from them, and which unresolved answer would justify a focused follow-up?
- What concrete decision does each question expose or instruction settle, and
  would answering the question differently or removing the content materially
  affect future behavior?
- Is each question located with the responsibility it shapes and worded to keep
  the judgment open rather than smuggle in a preferred answer?
- Which content should remain an open question, and which is an explicit
  constraint, runtime contract, fixed sequence, or validation fact that should
  be stated directly?
- Does execution require reusable material that the body cannot carry
  effectively, and what stable purpose and source of truth would that resource
  have?
- Does a literal keyword or list change routing or execution, and is the list a
  closed set, a fixed sequence, or an open set better expressed as a category?
- Is the body proportional to its distinct decisions, or did incremental edits
  leave repetition, conflicting rules, patch traces, or disproportionate
  emphasis that call for a rewrite?

## Target Artifact Questions

- For a new target, what name, location, smallest complete front matter, body,
  and resource set follow from its positioning and repository contract?
- For an existing target, in which situations is the current design effective,
  and where does its routing or execution diverge?
- When refactoring without preserving the current section or patch shape, what
  coherent structure would retain valid external behavior and current contracts?
- When optimizing for a supplied goal, which elements affect that goal and which
  unrelated effective behavior should remain intact?

## Validation Questions

Use existing validation facilities. Report exact checks and distinguish static
reasoning from runtime evaluation.

- What behavior or contract changed, and which existing check or affected task
  boundary can reveal an overlap, gap, duplicated source of truth, or broken use
  path?
- Are the target's declared inputs sufficient to produce its complete result in
  representative activation and execution situations?
- What was actually checked, what remains a static inference, and what has not
  been evaluated at runtime?

## Result Questions

Lead with the requested design, completed artifact or change, or review
conclusion.

- What intended usage, positioning, activation boundary, or execution
  responsibility was established or changed?
- Which material design choice, rewrite, or removal should the user understand?
- What validation evidence can be reported truthfully, and what uncertainty
  still affects future behavior?
