---
name: deploy
description: "Pick one deploy skill from the context you pass in."
argument-hint: "A ticket, a list of tickets, an idea, a screen, or another application"
disable-model-invocation: true
---

# Deploy

You sign off on what ships. The agent writes the pull request body. No skill promotes to production.

The context is what the user passed with this skill: a sentence, a ticket, a list of tickets, a path, a screen, or another application. Read it. When they passed nothing, ask once what it is.

Pick the first match. One line. Name that line in one sentence.

A line that says to call the Skill tool: call it with the context. A line that says the user runs a skill: tell them that one name and stop. The user types a user-invoked skill. This door does not start it.

1. The context is a release, production, or a promotion: stop. The user signs off. When `docs/agents/harness.md` exists, where it deploys is section 7.
2. The context is provisioning, credentials, a dashboard, or a cutover: call the Skill tool with `wizard`. The agent writes the script. The user performs the clicks.
3. Otherwise: call the Skill tool with `pr`.

**Done when:** one line was picked. Every Skill tool call on that line was made. Every skill that line says the user runs was named to them.
