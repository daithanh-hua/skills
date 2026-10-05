---
name: design
description: "Pick one design skill from the context you pass in."
argument-hint: "A ticket, a list of tickets, an idea, a screen, or another application"
disable-model-invocation: true
---

# Design

You choose the architecture, the data model, and the look of a screen. The agent supplies the words, the module shape, and the screen.

The context is what the user passed with this skill: a sentence, a ticket, a list of tickets, a path, a screen, or another application. Read it. When they passed nothing, ask once what it is.

Pick the first match. One line. Name that line in one sentence.

A line that says to call the Skill tool: call it with the context. A line that says the user runs a skill: tell them that one name and stop. The user types a user-invoked skill. This door does not start it.

1. A screen or a UI, and `docs/agents/design-harness.md` names Google Stitch: read that file and follow its pipeline. The user sees the screen.
2. A screen or a UI, and that file exists: read it and follow it.
3. A screen or a UI: tell the user to run `design-harness`.
4. A state model or a logic question that needs a runnable answer: call the Skill tool with `prototype`. Tell the user to run `handoff` out and back.
5. The words or the domain are the problem: call the Skill tool with `domain-modeling`.
6. A module's shape, seams, or boundaries: call the Skill tool with `codebase-design`.
7. The context is setting up the design stack, and there is no design harness: tell the user to run `design-harness`.
8. This is a TypeScript repo whose packages should be deep modules: tell the user to run `setup-ts-deep-modules`.
9. An idea with nothing to draw yet: tell the user to run `plan`.

**Done when:** one line was picked. Every Skill tool call on that line was made. Every skill that line says the user runs was named to them.
