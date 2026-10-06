---
name: operate
description: "Name the operate entry, or the first undone step after a build: retro, then deepening, then the hooks you asked for."
argument-hint: "A ticket, a list of tickets, an idea, a screen, or another application"
disable-model-invocation: true
---

# Operate

Before editing this door, read [../coding-harness/GUARDRAILS.md](../coding-harness/GUARDRAILS.md). Invariant 5 binds this file.

You choose rollback, hotfix, or a change to the agent's environment. The agent analyzes the failure and drafts the first fix.

The order is the Operate & Maintain section of [../coding-harness/phases.md](../coding-harness/phases.md). The context is what the user passed with this skill. Read it. When they passed nothing, ask once what it is.

A pile of bugs or requests the user did not create: tell the user to type `/triage` and stop. The issues it marks ready enter `/plan`. Tickets from `/to-tickets` are already ready.

An incident, logs, or a failure that resists a glance: call the Skill tool with `diagnosing-bugs` and stop. The user chooses rollback or hotfix. A hotfix enters `/plan`.

After a build, walk the list in order. Name the first line whose work is not done. The user types `/retro` and `/improve-codebase-architecture`. Call the Skill tool for `setup-pre-commit` and `git-guardrails-claude-code`. This door does not start a user-invoked skill.

1. `/retro`, when this session has not been looked back on. The user keeps which environment changes.
2. `/improve-codebase-architecture`, when `/retro` or the user asked to deepen the code. A picked opportunity enters `/plan`. Skip when neither pointed here.
3. `setup-pre-commit`, when the user wants a pre-commit hook and it is not installed. Skip otherwise.
4. `git-guardrails-claude-code`, when the user wants dangerous git commands blocked in Claude Code and that block is absent. Skip otherwise.

**Done when:** one entry or the next step was named.
