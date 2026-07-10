---
name: module-structure
description: "Use when the user asks to create, place, split, move, review, or reshape files, directories, or modules because ownership, dependency direction, public surface, discoverability, or credible growth affects the work, including when a broader task contains a substantive structural decision. Do not use for a name-only choice or ordinary implementation that requires no structural judgment or change."
---

# Module Structure

## Structural Boundary

This skill produces a complete structural decision or change within the
requested scope: owning location, unit boundaries, dependency direction, public
surface, and required integration points. Treat explicit user requirements and
established decisions outside this domain as inputs; decide unresolved
structural details from workspace evidence.

A name-only choice and a content change with no structural consequence are
outside this skill's result. When a proposed name implies a structural claim,
identify the ownership or relationship that the name must represent.

## Context Questions

- Is the requested result a diagnosis, a structural choice, a plan, an
  implemented change, or a review of an existing or proposed structure?
- What concrete work, use, or future change should the structure make easier?
- What local unit functions as a module, and which paths, imports, exports,
  references, tests, manifests, build rules, entrypoints, or overview material
  reveal its contract?
- Which nearby units must be inspected because their dependencies or public
  surfaces cross the named scope?
- What organizing principle explains the current peers, and should the proposed
  placement follow or deliberately revise it?
- When explicit requirements, project policy, tool-enforced contracts, and
  observed conventions disagree, which source governs this structural decision?
- Which observed relationships are hierarchy, dependency, disclosure, or
  ownership, and which are enforced rather than inferred from location or
  convention?
- Which requirements or prior decisions already settle part of the structure,
  and what remains open?
- Which missing answers can be inferred from the workspace, and which would
  materially change the target, boundary, dependency direction, integration
  work, or migration cost enough to require clarification?
- Which generated, vendored, archived, or incidental files should not shape the
  structural judgment?

## Placement Questions

- What role will the new or moved item play in the local structure?
- Which existing or new module naturally owns that responsibility, and what
  would become ambiguous if it lived elsewhere?
- What references, imports, exports, indexes, manifests, tests, entrypoints, or
  navigation paths must change so people and tooling can find or consume it?
- Would another location create an unnecessary shared area or force unrelated
  consumers to know the item's internals?

## Boundary Questions

- Does each proposed unit have a coherent responsibility and a stable reason to
  change?
- Are peers at a compatible level of abstraction, or are concepts, policies,
  examples, implementations, and exceptions being mixed as siblings?
- Can each unit be understood, used, and changed through its declared contract
  without hidden knowledge from outside its boundary?
- Which unit owns mutable knowledge, and are its indexes, manifests, registries,
  or overviews authoritative contracts, reliably derived views, or duplicated
  maintenance surfaces?

## Dependency Questions

- Which contracts do modules cross through code, configuration, generation,
  tests, links, or explanation?
- Does dependency direction follow ownership, or does one unit rely on unstable
  knowledge of another's internals?
- Does a parent or coordinating module depend on mutable descendant details that
  a nearer boundary should expose through a stable contract?
- Is a cycle a deliberate protocol or harmless reference, or does it create a
  build, initialization, comprehension, or ownership hazard?
- Which contract and coupling make a dependency significant beyond its path
  spelling or directory depth?

## Disclosure Questions

- What must each public surface expose for discovery, use, selection, or
  extension, and what should remain internal?
- Can an entrypoint or overview guide consumers without copying implementation
  detail or a mutable inventory?
- Would an internal change force unrelated callers, readers, or parent modules
  to change, and what stable surface or derivation would prevent that leakage?

## Growth Questions

- What is the next credible addition or change, and would its owner and
  integration path be evident in the proposed structure?
- Would another similar item fit the current boundary, or expose duplication,
  scattered exceptions, or pressure for a different grouping?
- Does a proposed abstraction answer observed growth evidence, or only
  hypothetical scale?

## Structural Choice Questions

- Which evidence-backed options would materially change placement, ownership,
  dependency direction, disclosure, or migration work?
- What benefit, coupling, disclosure effect, and migration cost does each actual
  candidate introduce?
- What scope of change would make the structure honest and complete, and is
  leaving it unchanged also a valid candidate?
- Which option best supports the requested work and credible growth without
  unjustified migration or ceremony?
- If implementation is requested, which files, responsibilities, integration
  points, compatibility measures, and migration steps must change together?
- If review is requested, which findings materially affect use, change,
  dependency, disclosure, or growth, and which are only stylistic cleanup?

## Validation And Result

When implementing, change the owning units and affected integration points
together. Validate relevant structural surfaces, such as references,
imports and exports, entrypoints, manifests, generated views, links, existing
tests, builds, and public contracts. Report only checks that ran; distinguish
enforced relationships from inferred conventions when the result is conceptual
or static.

Lead with the chosen placement, shape, or structural judgment and the work it
improves. State the decisive evidence, required integration points, and material
migration or compatibility cost.
