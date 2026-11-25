# Agent Profile

Use this guide to maintain the reusable agent skills and synchronize them
with the host.

## Structure

- Each directory under [skills](skills/) contains a skill that can be used
  on its own with its declared inputs. Its entry point is `SKILL.md`. Use
  the directory name as the front matter `name` and render it in title form
  as the H1. Keep any bundled resources in the skill directory.
- The [synchronization rules](content-hub.yaml) define which paths are
  deployed and where.

## Skill Design Contract

Each skill contributes domain knowledge or records how this profile chooses
among reasonable alternatives. Keep a preference with the decision it settles.
When a task depends on a fact maintained elsewhere, use its authoritative
source. General collaboration, compatibility review, and migration planning
belong to the surrounding task.

Reserve front matter for identity and discovery. Use a concise task or
domain name and describe when the skill adds value within a larger request.
Write the body in this profile's own terms. Say what the agent should
notice and how that affects its choice. State each chosen default and its
scope. Use open questions for decisions that depend on evidence and exact
instructions where a tool or format requires them. For guidance on scope
and on testing selection and behavior with representative requests, see
[Skill Design](skills/skill-design/SKILL.md).

## Design Influences

To keep the agent focused on the task, document outside work that shaped
a skill here. Explain the choice it influenced and link to the passage
or example a maintainer would need to revisit it.

[Design Rationale](skills/design-rationale/SKILL.md) keeps a decision and
its sources together so a maintainer can trace the choice after the working
conversation ends. We adapted [Gemini Notebook's practice of retaining citations in saved notes](https://support.google.com/gemininotebook/answer/16179559).
The skill also asks why a borrowed idea fits the project, a question drawn
from the [Rust RFC template's guidance on prior art](https://github.com/rust-lang/rfcs/blob/main/0000-template.md#prior-art).

[Writing and Editing](skills/writing-and-editing/SKILL.md) asks what a
piece must supply given what its reader already knows. That question
draws on [Google's guidance on audience](https://developers.google.com/tech-writing/one/audience).
Its advice to link to a fuller explanation at the point of need draws on
[the guidance on background material in how-to guides](https://diataxis.fr/how-to-guides/#key-principles).

## Synchronization

Run these commands from `profile/agent`.

The `agents` workspace synchronizes `skills/**` to `${HOME}/.agents`.

Preview and deploy the skills with these commands.

```bash
uv run contentctl --dry-run deploy agents
uv run contentctl deploy agents
```

To bring host edits back into the repository, run the adoption command.

```bash
uv run contentctl adopt agents
```
