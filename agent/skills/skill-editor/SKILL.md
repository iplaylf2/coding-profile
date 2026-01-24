---
name: skill-editor
description: Use when asked to draft, revise, or review an agent skill specification to make it trigger correctly from frontmatter and read as a compact, non-redundant, internally consistent execution guide.
---

# Skill Editor

## Layers

A skill spec has two layers with different load timing and responsibilities:

- **Frontmatter** is read early and steers discovery and routing.
- **Body** is read later and steers task execution.

Layer contract:

- Trigger wording belongs to frontmatter.
- Execution guidance belongs to the body.
- The two layers must not overlap.

## Authoring Rules

### Frontmatter

- Write for correct routing. Use user-intent phrasing, common request wording, and the intended task family.
- Prefer specific triggers over broad capability claims that would overlap with other skills.
- Ensure frontmatter is sufficient for routing without reading the body.

### Body

- Write the body as rules, constraints, and checklists.
- Establish a minimal framework first, then fill it with content. Optimize for navigability and extensibility, not exhaustiveness.
- Remove restatement and narrative. Merge overlapping sections; keep each rule single-sourced.
- Use the smallest neutral example only to resolve ambiguity; do not introduce conventions through examples.

## Review Checklist

Before finalizing, confirm:

- **Routing**: Frontmatter alone is sufficient to decide when to use the skill.
- **Structure**: The body has a minimal framework that supports navigation and extension.
- **Redundancy**: Each rule appears once; sections are non-overlapping.
- **Terminology**: Terms are defined once and used consistently.
- **Conflicts**: Where tradeoffs exist, priority is explicit.
- **Verifiability**: Requirements are clear enough to check.
