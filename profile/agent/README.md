# Agent Profile

Repository source for reusable agent skills and their synchronization rules.

## Structure

- `skills/<skill-name>/` is an independently usable runtime skill whose required
  entry point is `SKILL.md`. Keep its directory basename and front matter `name`
  identical, render that name in title form as the H1, and keep any bundled
  resources within the skill directory.
- `content-hub.yaml` is the authoritative mapping for synchronized paths,
  exclusions, and workspace targets for reusable skills.
- `README.md` is the maintainer-facing design contract and synchronization entry
  point; it is not runtime guidance for deployed skills.

## Skill Design Contract

Each skill contributes domain knowledge or records how this profile chooses
among reasonable alternatives. Keep a preference with the decision it settles.
When a task depends on a fact maintained elsewhere, use its authoritative
source. General collaboration, compatibility review, and migration planning
belong to the surrounding task.

- Ground the design in representative requests. When a judgment recurs across
  different artifacts, describe what makes it the same decision and what
  evidence it needs in each setting.
- Reserve front matter for identity and discovery. Use a concise, idiomatic
  task or domain name. The description should let the agent recognize when the
  skill adds value, including within a larger task.
- Keep each skill independently usable with its declared inputs and bundled
  resources. Describe the boundary with neighboring work in domain terms.
- State a chosen default and when it applies. Use open questions for choices
  whose answers depend on the evidence. Give exact instructions where a tool
  or format requires them.
- Check the part of the design that changed. Skill selection can be exercised
  with names and descriptions alone. An execution check needs the body, a
  representative task, and an observable result.

## Synchronization

Run these commands from `profile/agent`.

The `agents` workspace synchronizes `skills/**` to `${HOME}/.agents`.

Preview and deploy skills:

```bash
uv run contentctl --dry-run deploy agents
uv run contentctl deploy agents
```

Adopt skills from the host workspace:

```bash
uv run contentctl adopt agents
```
