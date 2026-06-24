---
name: practice-memory
description: "Use when the user asks to review or debrief a current or prior agent interaction to decide whether lessons, repeated corrections, missed expectations, or collaboration friction should become durable agent guidance. Do not use for ordinary task summaries, code review, or project postmortems unless the goal is to improve future agent behavior."
---

# Practice Memory

## Evidence Questions

- What future behavior is the user trying to improve: activation, planning, evidence gathering, editing discipline, wording judgment, validation, communication, handoff, or a domain-specific workflow?
- What did the user have to repeat, correct, reframe, or rescue?
- Which instructions, files, conventions, tool outputs, or prior messages should have changed the agent's behavior?
- Which failures came from ignored instructions, missed local context, weak inference, insufficient validation, unclear ownership, or an absent reusable workflow?
- Which corrections were ordinary collaboration because the task involved subjective judgment, hidden context, changing requirements, exploratory design, or a genuine tradeoff?
- Did the agent eventually converge by learning a portable behavior rule, or only by following session-specific details or one-off instructions from the user?

## Classification Questions

- Is this reasonable collaboration friction because the missing answer could not be inferred from the request, files, conventions, or prior context, and the user's clarification changed a real decision?
- Is this reasonable collaboration friction because the user was choosing between acceptable alternatives, refining taste, changing scope, or supplying private context that no skill should assume?
- Is this a skill gap because the user repeatedly emphasized the same class of instruction after it was explicit in the request or visible in local conventions?
- Is this a skill gap because the agent skipped a predictable context source, asked avoidable questions, failed validation, confused routing with execution, gave phrasing or examples more weight than local context, or produced output the skill should have prevented?
- Is this a project documentation gap because the missing durable knowledge belongs in repository docs, configuration, commands, templates, or product notes rather than an agent behavior workflow?
- Is this no durable change because the issue was a one-off bug, transient misunderstanding, private fact, session-specific detail, wording preference that only applied once, or constraint that should not be generalized?

## Scope Questions

- Should the lesson live at project level because it depends on one codebase, product domain, command set, directory layout, release process, team convention, or local style?
- Should the lesson live at user level because it reflects the user's stable working preference or a cross-project agent behavior that should follow them between repositories?
- Should an existing skill change because the desired future behavior, including how it handles wording evidence, belongs to that skill's task family and the activation boundary is already right?
- Should a new skill exist because the lesson names a recurring task family with its own activation boundary, evidence sources, decisions, and validation responsibilities?
- What context should remain only as supporting evidence because it explains this session rather than future behavior?
- Which nearby skill or project guidance would become confusing, duplicated, or overloaded if this lesson were placed there?

## Edit Target Questions

- Did the wrong skill activate, the right skill fail to activate, or an adjacent intent fall outside the current routing boundary? If so, revise front matter.
- Did the skill activate correctly but guide the wrong work, miss evidence, ask unnecessary questions, lose the user's center of gravity, give prompt phrasing more weight than task evidence, or report poorly? If so, revise the body.
- Did the retrospective reveal both a routing problem and an execution problem? If not, avoid changing both front matter and body.
- Would a body question guide future inference better than a command, or does the behavior require concrete steps because the sequence, files, tools, or validation are fragile?
- Which sentence only sounds cautious, complete, or sophisticated without changing future behavior?

## Change Workflow

- Inspect the relevant existing skills before deciding whether to add a new one.
- Use session evidence as the source of truth for classification, but separate portable behavior from session-specific detail before editing durable guidance.
- Name the behavioral lesson and selected artifact before editing files.
- Keep front matter at the task-family level and keep execution guidance in the body.
- Preserve local skill style, including concise question-led sections and focused handoff questions.
- Validate the result against likely trigger prompts, adjacent non-trigger prompts, and the original session failure.

## Handoff Questions

- What was the retrospective classification: reasonable friction, skill gap, project documentation gap, or no durable change?
- Which artifact changed or should change: existing skill front matter, existing skill body, new skill, project guidance, or nothing?
- Why is the selected scope project-level, user-level, or specific to an existing skill?
- What future agent behavior should be different because of this lesson?
- What validation was performed, and what uncertainty remains?
