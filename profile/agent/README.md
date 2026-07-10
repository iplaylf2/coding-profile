# Agent Profile

Repository source for reusable agent skills and their synchronization rules.

## Structure

- `skills/<skill-name>/` is an independently usable runtime skill whose required
  entry point is `SKILL.md`. Keep its directory basename and front matter `name`
  identical, render that name in title form as the H1, and keep any bundled
  resources within the skill directory.
- `content-hub.yaml` is the authoritative mapping for synchronized paths,
  exclusions, and workspace targets.
- `README.md` is the maintainer-facing design contract and synchronization entry
  point; it is not runtime guidance for deployed skills.

## Skill Design Contract

Treat the decision to create a skill as an input supplied by the user or an
established task decision. For a new or existing skill, use representative usage
scenarios to establish and validate its positioning, activation boundary,
post-activation responsibilities, and distinction from adjacent task families.

- Use front matter only for stable identity and activation routing: `name`
  identifies the skill, while `description` states the user intent that should
  activate it and adjacent intents that should not.
- Give each skill a concise, idiomatic domain name or task phrase. Every word,
  including a shared suffix, must contribute stable meaning, useful sibling
  contrast, standalone clarity, search value, or format compliance.
- Put post-activation evidence sources, decision questions, fixed execution
  rules or procedures, resource-use guidance, and validation in the body.
- Keep each skill independently usable after activation and able to produce a
  complete result for its declared domain. Express its boundary through inputs,
  outputs, and out-of-scope decisions. Do not name, invoke, or require another
  skill, or assume another skill is present.
- Treat explicit decisions outside the declared domain as inputs; do not reopen
  them or prescribe decisions outside the skill's result.
- Determine which explicit user requirements, normative project policies, and
  tool-enforced contracts govern the remaining choices. Use observed history
  only for choices those authorities leave open.
- Classify supplied inputs by role, such as binding constraints, authoritative
  terms, candidates, preferences, rejections, or semantic examples. Preserve,
  evaluate, exclude, or translate them according to that role.
- Drive context-dependent work with questions. Answer them first from the
  request, target artifact, and selected evidence; ask the user only when an
  unresolved answer would materially change the result.
- State direct rules only for explicit constraints, fixed invariants, and
  fragile, ordered, or tool-dependent procedures.
- Lead with the requested result, distinguish performed validation from
  recommended work, and disclose only uncertainty that materially affects use.

## Synchronization

Run these commands from `profile/agent`.

Deploy all synchronized content to every configured workspace:

```bash
uv run contentctl deploy --all-workspaces
```

Adopt synchronized content from the `agents` workspace:

```bash
uv run contentctl adopt agents
```
