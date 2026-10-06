---
name: deploy
description: "Name the first undone deploy step: the pull request body, then a human click, then your sign-off."
argument-hint: "A ticket, a list of tickets, an idea, a screen, or another application"
disable-model-invocation: true
---

# Deploy

Before editing this door, read [../coding-harness/GUARDRAILS.md](../coding-harness/GUARDRAILS.md). Invariant 5 binds this file.

You sign off on what ships. The agent writes the pull request body. No skill promotes to production.

The order is the Deploy section of [../coding-harness/phases.md](../coding-harness/phases.md). The context is what the user passed with this skill. Read it. When they passed nothing, ask once what it is.

Walk the list in order. Name the first line whose work is not done. Call the Skill tool for `pr` and `wizard`. Where a branch starts, where the pull request lands, and what deploys: section 7 of `docs/agents/harness.md` when that file exists.

1. `pr`, when a branch is ready and the pull request body for this change is not current. Skip when the body is current.
2. `wizard`, when a human must still click: provisioning, credentials, a dashboard, or a cutover. Skip when no human click remains. The agent writes the script. The user performs the clicks.
3. Sign-off, when the context is a release, production, or a promotion. Stop. The user signs off. Section 7 says what deploys.

**Done when:** the next step was named, or sign-off stopped the door.
