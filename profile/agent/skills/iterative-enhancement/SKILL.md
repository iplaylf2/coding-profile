---
name: iterative-enhancement
description: "Use when designing or developing a product or system over successive passes, working from its overall shape toward more concrete behavior at its normal entry points."
---

# Iterative Enhancement

Start from the existing product, requirements, or prototype. Look across
the capabilities in scope before detailing any one. Follow a concrete
use through the intended entry points. Which parts already work together?
Where does that use still rely on a sketch or a placeholder?

In design work, examine a handoff from each participant's point of
view. What can each side observe, supply, or guarantee? If two outcomes
call for different actions, show how the recipient can tell them apart.
A participant can supply a capability in one interaction and depend on
another in the next. When ownership is unclear, consider the pair from
the outside. What do its callers actually need to see?

In development, build or extend a working version at the entry points
its callers will use. If the design relies on an unconfirmed capability,
check what the dependency can guarantee. A substitute can serve the
real caller while a known capability is being implemented or connected.
If an operation cannot yet take effect, make that clear at the
point of use. As the dependency becomes available, connect it through
that same path and move any remaining placeholder to the deeper detail
that still needs it. If the working code exposes a mistaken assumption,
revise the design and retire the paths it supersedes.

For example, an editor that previews text now needs to show images from
document packages. Use the editor's Open and Preview commands with a
sample document. The editor asks the renderer for a preview, and the
renderer asks the open document for the bytes of `cover.png`. The sample
document can supply those bytes while the package loader is being built.
Once the loader is ready, use the same commands with two packages that
contain different images named `cover.png`. Each should show its own cover.
