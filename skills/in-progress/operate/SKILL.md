---
name: operate
description: "Pick one operate skill from the context you pass in."
argument-hint: "A ticket, a list of tickets, an idea, a screen, or another application"
disable-model-invocation: true
---

# Operate

You choose rollback, hotfix, or a change to the agent's environment. The agent analyzes the failure and drafts the first fix.

The context is what the user passed with this skill: a sentence, a ticket, a list of tickets, a path, a screen, or another application. Read it. When they passed nothing, ask once what it is.

Pick the first match. One line. Name that line in one sentence.

A line that says to call the Skill tool: call it with the context. A line that says the user runs a skill: tell them that one name and stop. The user types a user-invoked skill. This door does not start it.

1. A pile of bugs or requests the user did not create: tell the user to run `triage`.
2. An incident, logs, or a failure that resists a glance: call the Skill tool with `diagnosing-bugs`. The user chooses rollback or hotfix.
3. They want this session looked back on: tell the user to run `retro`. It suggests changes to the agent's environment. The user decides which to keep.
4. A spare moment to deepen the codebase: tell the user to run `improve-codebase-architecture`.
5. They want a pre-commit hook: call the Skill tool with `setup-pre-commit`.
6. They want dangerous git commands blocked in Claude Code: call the Skill tool with `git-guardrails-claude-code`.
7. Otherwise, after a build: tell the user to run `retro`.

**Done when:** one line was picked. Every Skill tool call on that line was made. Every skill that line says the user runs was named to them.
