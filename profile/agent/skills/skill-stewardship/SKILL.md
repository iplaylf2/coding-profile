---
name: skill-stewardship
description: "Use when the user asks to create, review, refactor, or optimize reusable agent skills, including activation metadata, body workflow, or question-led intent models. Do not use for ordinary prompts, one-off instructions, application code, or general writing unless the task is about reusable skill behavior."
---

# Skill Stewardship

## Responsibility Questions

- Is front matter acting only as routing information?
- Is the body acting only as execution guidance after activation?
- Does the skill help the agent infer and satisfy user intent through questions?
- Which sentence is only making the skill look complete, cautious, or thorough rather than changing future agent behavior?

## Front Matter Questions

- What is the minimum context needed to decide whether to load this skill before reading the body?
- What user intent should trigger this skill?
- Which adjacent requests should also trigger it?
- What similar requests should not trigger it?
- What task boundary distinguishes this skill from generic agent behavior or neighboring skills?
- Is the description operating at the task-family level rather than the step level?
- Does a concrete artifact name, such as `SKILL.md`, front matter, body instructions, a command, a file type, or an API, change routing?
- Did any example, checklist, tone guidance, validation step, or internal workflow enter the description without changing activation?

## Body Questions

- Once this skill is active, what should the agent ask itself first?
- What context, evidence, or local convention should the agent inspect before acting?
- What should the agent infer instead of asking the user?
- When is user clarification genuinely required?
- What decision rules or responsibility boundaries keep auxiliary constraints serving the user's intent rather than becoming parallel responsibilities?
- Is the body length and structure proportional to the number of distinct decisions the skill must guide?
- How should the agent validate and report the result?
- Which question or instruction changes the agent's behavior?
- Which question or instruction merely restates a generic virtue, defensive caution, duplicated guardrail, or unwanted behavior that may pull future agents' attention off task?
- Did repeated edits leave patch traces that should become a rewrite, merge, or deletion?

## Question-Led Style Questions

- Is this question for the agent's internal reasoning, or does it truly need to be asked of the user?
- Can the answer be inferred from the request, files, surrounding conventions, or prior context?
- Would the missing answer change scope, behavior, output format, or risk?
- What choice does this question force the agent to make?
- Is this question placed where its responsibility is clearest?
- For a broad skill, would a paraphrased or translated request still activate it for the right semantic reason?

## Keywords And Lists Questions

- Is this keyword a literal artifact name, such as a file type, command, API, tool, or product term?
- Is this list a closed set, a fragile sequence the agent must follow, or an open set of examples for inference?
- If the category is open-ended, can a category phrase replace the enumeration?
- Does the enumeration define the skill by artifact type when the real trigger is a relationship, decision, evidence source, or user intent?
- Would a paraphrased, translated, or implied request bypass this skill because the description depends on exact wording?
- Would removing one item from this list change future agent behavior?

## Focus Questions

- Does this content help decide when the skill activates?
- Does it guide the agent's work after activation?
- Does it preserve the question-led intent model and keep the user's current center of gravity primary?
- Is this section preserving a necessary responsibility, or only matching the length, shape, or caution level of nearby skills?
- Is it justified by user intent, local convention, external standard, repeated failure mode, or task evidence?
- Would a future agent behave worse without it?
- If not, why keep it?

## Handoff Questions

- How should the user's intent be translated for handoff: create, review, refactor, optimize, or recommend no change?
- What activation boundary changed, was recommended, or was confirmed unchanged?
- What body workflow or responsibility layer was created, changed, clarified, or left intact?
- What was removed or intentionally kept to preserve the skill's focus?
- What validation was performed, and was it limited to static review?
