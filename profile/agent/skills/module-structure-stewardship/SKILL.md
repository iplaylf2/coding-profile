---
name: module-structure-stewardship
description: "Use when the user asks to decide where or how to create, place, name, split, move, review, or reshape files and directories as modules in a file tree, especially when relationships between files or directories affect module boundaries, composition, dependency direction, growth shape, public/internal disclosure, or explanatory cycles. Do not use for ordinary implementation, review, or editing tasks when placement is obvious and module relationships are not the user's concern."
---

# Module Structure Stewardship

Treat examples and lists as investigation prompts, not closed taxonomies. Prefer the module categories, names, and dependency surfaces visible in the user's workspace. Name file kinds, extensions, frameworks, or artifact types only when they change routing, evidence, or validation.

## Intent Questions

- Is the user asking for a placement decision, a new module, a diagnosis, a restructuring plan, structural edits, or a module naming decision?
- What local unit is operating as a module in this workspace, and what evidence makes it so?
- What scope did the user name, and what nearby files must be inspected to understand that scope without expanding the task unnecessarily?
- Which missing answers can be inferred from paths, names, references, imports, tests, indexes, or local convention?
- Which missing answer would materially change the target, placement, edit scope, or risk enough to require user clarification?

## Scope Questions

- Is module structure the center of the request, or only a background concern for another task?
- If another primary task is underway, what structural decision must be made before ordinary work can proceed?
- Is another task-family skill primary, with this skill only supplying a placement, boundary, dependency, or disclosure judgment?
- Would using this skill change where files live, how modules relate, or what a parent module exposes? If not, let the primary task-family govern.
- What is the smallest structural judgment that satisfies the user without turning the task into a general architecture review?

## Evidence Questions

- What evidence reveals the intended boundaries: names and paths, overview files, indexes or manifests, imports or exports, links, tests or build rules, repeated headings, or local conventions?
- Which relationships are explicit, and which are inferred from location, naming, ordering, shared vocabulary, or repeated structure?
- Which boundaries are enforced by language, packaging, build tooling, tests, or runtime behavior, and which exist only as prose or convention?
- Is the target tree organized by feature, layer, runtime concern, reader task, ownership, chronology, or historical accumulation?
- Which generated, vendored, archived, or incidental files should be excluded from the structural judgment?

## Placement Questions

- When creating or moving a file or directory, what structural role will it play: peer module, child specialization, entrypoint, shared primitive, example, adapter, internal support, or a local role named by the project?
- Which existing module should own the new content, and what responsibility would be blurred if it lived elsewhere?
- Does the new item follow the directory's expected growth shape, or does it reveal the need for a new parent category?
- What references, imports, exports, indexes, tests, manifests, README entries, or navigation paths must change so the module is discoverable without leaking internals?
- Would the placement introduce a dependency cycle, circular explanation, unstable public API, or unclear ownership boundary?

## Boundary Questions

- Can each file, directory, or module be understood as a coherent unit with a clear responsibility?
- Do sibling modules live at the same level of abstraction, or do concept, policy, example, implementation, and exception handling sit side by side?
- Can smaller modules compose into the parent module without requiring hidden context from outside the reviewed scope?
- Would a split, merge, rename, or parent overview make the boundary more honest without creating ceremony?

## Growth Questions

- Does this directory or module family expect horizontal growth through more siblings of the same kind?
- Does it expect vertical growth through deeper explanation, specialization, layered implementation, or nested submodules?
- Is the next likely addition obvious from the current structure?
- Would adding one more peer create duplication, scattered exceptions, naming pressure, or a need for a new parent category?
- Should the growth path be shaped by feature slices, architectural layers, reader tasks, lifecycle stages, or ownership boundaries?

## Dependency Questions

- When dependencies are explanatory, which modules rely on other modules for definitions, vocabulary, prerequisites, examples, constraints, or cross-references?
- When dependencies are enforced by tooling or runtime behavior, which modules rely on other modules through imports, exports, type references, callbacks, configuration, initialization, test helpers, or generated artifacts?
- What dependency direction does the local architecture imply, and where does the current structure violate it?
- Are cycles harmless cross-references, deliberate mutual protocols, circular explanations, circular imports, or runtime initialization hazards?
- Would a cycle be better resolved by extracting a shared primitive, adding a parent explanation, introducing an interface, inverting control, or moving responsibility?

## Disclosure Questions

- What should each module expose through public APIs, exports, README text, indexes, headings, examples, or entrypoints?
- What details should remain internal instead of leaking into sibling modules, parent modules, callers, or readers?
- Does a parent module explain enough to help users choose a child module without duplicating the child's full content?
- Are two modules explaining each other in a loop instead of sharing a stable definition or dependency root?

## Judgment Questions

- Is the current structure a flat collection, layered tree, feature-sliced tree, hub-and-spoke, pipeline, glossary plus leaves, plugin registry, or mixed shape?
- Which issues materially affect comprehension, maintenance, extension, tests, builds, or user workflows?
- Which observations are structural, and which are ordinary prose style, naming preference, or local cleanup?
- What is the smallest change that improves the module relationship: leave unchanged, rename, split, merge, move, add an index, extract a shared primitive, invert a dependency, or document a boundary?
- What risk would the proposed change introduce for references, imports, tests, published APIs, deployment, or reader expectations?

## Handoff Questions

- What module shape was found or chosen, and what evidence supports that reading?
- Which boundaries, placement choices, growth expectations, dependencies, disclosure choices, or cycles deserve action?
- What change is recommended or implemented, and why is it better than only making the tree look tidier?
- What was intentionally left alone because it is local convention, harmless redundancy, obvious placement, or outside the user's scope?
- What validation was performed: static file review, reference search, dependency inspection, tests, build checks, or only conceptual review?
