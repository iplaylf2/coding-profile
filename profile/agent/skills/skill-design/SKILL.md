---
name: skill-design
description: "Use when the user asks to design, create, review, refactor, or optimize reusable agent skills or their activation and execution behavior. Do not use for ordinary prompts, one-off instructions, application code, or general writing unless the task is about reusable skill behavior."
---

# Skill Design

The requested new or existing skill target is an input supplied by the user or
an already-established task decision. This skill designs, creates, reviews, or
changes that target; it does not decide whether creation is warranted.

Use questions that can change the current design decision or review conclusion.
Answer them first from the request, target artifacts, surrounding conventions,
and available evidence. Ask the user only when an unresolved answer would
materially change the requested result.

## Positioning Questions

Read every existing target skill completely. Inspect affected resources and the
local schemas, templates, validators, and repository conventions that govern the
artifact.

Use the current request for desired behavior, runtime and schema requirements
for validity, and current repository conventions for integration. When current
evidence leaves a material design question unresolved, use relevant history to
inform that decision within current requirements.

When related task guidance can clarify the target's contribution, compare the
inputs each requires, the judgments it guides, and the results it produces.
Keep the finished skill independently usable after activation: express
boundaries as domain inputs, outputs, and out-of-scope decisions without naming,
invoking, or requiring another skill or shared context.

- In concrete situations, what is the user trying to accomplish and what would a
  successful result look like?
- Which representative situations actually expose a design choice, and which
  would merely expand a checklist?
- What stable semantic task family appears across the relevant situations?
- What context is already available at activation, and what judgments, workflow,
  or result must the target skill contribute?
- What relevant behavior is already supplied by baseline agent behavior or
  project guidance, and what does the target add or refine for its domain?

## Front Matter Questions

Front matter routes before the body is loaded. Follow the repository's metadata
schema and keep execution guidance in the body.

- What minimum semantic context is needed to decide whether to load the target
  skill?
- Which user intents benefit from the target's contribution, and which fall
  outside its declared domain?
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
- Compared with leaving the target unchanged, what would a proposed change
  improve, and would that gain justify its context, coupling, and maintenance
  costs?
- When refactoring without preserving the current section or patch shape, what
  coherent structure would retain valid external behavior and current contracts?
- When optimizing for a supplied goal, which elements affect that goal and which
  unrelated effective behavior should remain intact?

## Validation Questions

Use existing validation facilities. Report exact checks and distinguish static
reasoning from runtime evaluation.

- What behavior or contract changed, and which existing check or affected task
  boundary can reveal conflicting guidance, missing coverage, unnecessary
  repeated work, duplicated sources of truth, or a broken use path?
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
