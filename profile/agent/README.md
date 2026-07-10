# Agent Profile

Repository source for reusable agent skills and their synchronization rules.

## Structure

- `skills/<skill-name>/` is an independently usable runtime skill; `SKILL.md` is
  its required entry point, and any bundled resources remain in the same unit.
- `content-hub.yaml` is the authoritative mapping for synchronized paths,
  exclusions, and workspace targets.
- `README.md` is the maintainer-facing design contract and synchronization entry
  point; it is not runtime guidance for deployed skills.

## Skill Design Contract

A user request or an established task decision selects whether to create a new
skill. Once a new or existing target is selected, begin with representative
usage scenarios, then establish its positioning, activation boundary,
post-activation responsibilities, and distinction from adjacent task families.

- Use front matter only for stable identity and activation routing: `name`
  identifies the skill, while `description` states the user intent that should
  activate it and the nearest intent that should not.
- Put post-activation evidence sources, decision questions, fixed execution
  rules or procedures, resource-use guidance, and validation in the body.
- Keep each skill independently usable after activation and able to produce a
  complete result for its declared domain. Express its boundary through inputs,
  outputs, and out-of-scope decisions. Do not name, invoke, or require another
  skill, or assume another skill is present.
- Treat explicit decisions outside the declared domain as inputs; do not reopen
  them or prescribe decisions outside the skill's result.
- Let explicit user targets and requirements govern the choices they settle.
  Treat normative project policy and tool-enforced contracts as bounds on viable
  results. Use observed history only for choices that stronger sources leave
  open.
- Classify supplied wording, examples, and candidates by role: exact constraints
  or authoritative terms to preserve, candidates to evaluate, or semantic intent
  to translate into the artifact's own form.
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
