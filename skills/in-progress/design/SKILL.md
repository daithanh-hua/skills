---
name: design
description: "Name the first undone step of the design order: words, module shape, prototype, then the screen."
argument-hint: "A ticket, a list of tickets, an idea, a screen, or another application"
disable-model-invocation: true
---

# Design

Before editing this door, read [../coding-harness/GUARDRAILS.md](../coding-harness/GUARDRAILS.md). Invariant 5 binds this file.

You choose the architecture, the data model, and the look of a screen. The agent supplies the words, the module shape, and the screen.

The order is the Design section of [../coding-harness/phases.md](../coding-harness/phases.md). The context is what the user passed with this skill. Read it. When they passed nothing, ask once what it is.

An idea with nothing to design yet: tell the user to type `/plan` and stop.

Walk the list in order. Name the first line whose work is not done. Call the Skill tool for `domain-modeling`, `codebase-design`, and `prototype`. The user types `/setup-ts-deep-modules` and `/design-harness`. This door does not start those two.

1. `domain-modeling`, when a term this change needs is fuzzy. Skip when the glossary already uses it cleanly.
2. `codebase-design`, when a module's seam or shape is undecided. Skip when the seam is chosen.
3. `/setup-ts-deep-modules`, when that shape is deep modules, this is a TypeScript repo, and the wiring is absent. Skip otherwise.
4. `prototype`, when a state model or logic question still needs a runnable answer. Tell the user to type `/handoff` out and back. Skip when paper settles it.
5. `/design-harness`, when a screen is in this change and `docs/agents/design-harness.md` is missing. Skip when there is no screen, or the file exists.
6. The screen, when one remains and that file exists. Read it and follow it. When it names Google Stitch, that pipeline generates the screen. The user sees it. Skip when there is no screen.

When the list is done, tell the user to type `/build`.

**Done when:** the next step was named, or the screen was followed. When the order is finished, `/build` was named.
