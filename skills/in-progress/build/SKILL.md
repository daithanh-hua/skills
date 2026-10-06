---
name: build
description: "Pick one build skill from the context you pass in."
argument-hint: "A ticket, a list of tickets, an idea, a screen, or another application"
disable-model-invocation: true
---

# Build

You set the quality bar and you approve the change. The agent writes the code, the tests, and the fixes. A task is done only when **Until done** in `docs/agents/harness.md` is met, when that file exists.

The context is what the user passed with this skill: a sentence, a ticket, a list of tickets, a path, a screen, or another application. Read it. When they passed nothing, ask once what it is.

When `docs/agents/harness.md` has a Plan gate, read that section before the list. With no accepted plan for this change, write the plan where **A request starts** says, and the reply names that artifact. The list below runs on a later turn, after the user accepts it.

Pick the first match. One line. Name that line in one sentence.

A line that says to call the Skill tool: call it with the context. A line that says the user runs a skill: tell them that one name and stop. The user types a user-invoked skill. This door does not start it.

1. A bug, a flake, a slowdown, or a regression: call the Skill tool with `diagnosing-bugs`.
2. A review of a diff, a branch, or a pull request: call the Skill tool with `code-review`.
3. Tests that use `as` assertions: call the Skill tool with `migrate-to-shoehorn`.
4. A screen or a UI: tell the user to run `design`.
5. One behaviour to build, and no spec: call the Skill tool with `tdd`.
6. A list of tickets, or a spec that names more than one ticket: tell the user to run `implement-spec`. The agent writes the code. You approve it.
7. One ticket or one change: tell the user to run `implement`. The agent writes the code. You approve it.
8. An idea with no chosen change: tell the user to run `plan`.

**Done when:** the plan is on disk and named in the reply, or one line was picked. Every Skill tool call on that line was made. Every skill that line says the user runs was named to them.
