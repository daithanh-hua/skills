---
name: plan
description: "Open the plan phase on one request or one existing issue, then name the first undone step of that phase's order."
argument-hint: "A request, or one existing issue"
disable-model-invocation: true
---

# Plan

Before editing this door, read [../coding-harness/GUARDRAILS.md](../coding-harness/GUARDRAILS.md). Invariants 4, 5, and 6 bind this file.

You decide the constraints and the scope. The agent drafts the spec, the tickets, and the edge cases.

The order is the Plan section of [../coding-harness/phases.md](../coding-harness/phases.md). Walk it. Name the first line whose work is not done. The user types a skill whose line says so. Call the Skill tool for `research` and `grilling`. This door does not start a user-invoked skill. A missing skill on this order is named and the turn stops. That line is not skipped, and it is not done.

A recurring loop in the user's life or work: tell them to type `/loop-me` and stop.

Entry is one of two. Both leave one issue.

- A request from the user, and no issue for it yet: create one issue where **A request starts** says in `docs/agents/harness.md`. The body is the request. The reply names the issue.
- One issue someone already created: that issue is the entry. Read it. Do not create a second one.

When they passed neither, ask once which it is.

1. `/to-questionnaire`, when a person other than the user holds the answer. Skip when the user holds it.
2. `research`, when the answer is in source material and the user is not the one who must decide. Skip otherwise.
3. Sharpen, the first line whose skip is false. One line only:
   - `/grilling`, when they asked for the interview with no wrapper. Skip otherwise. This line replaces the other sharpeners.
   - `/wayfinder`, when the way is not visible or the effort is bigger than one session. Skip when one session can hold it. A cleared map skips `/grill-with-docs`. The next step is `/to-spec`.
   - `/grill-me`, when there is no working directory. Skip when a repo is open.
   - `/grill-with-docs`, while the issue is still a raw request in a repo. Skip once this session has run it, the issue is already a spec, or a wayfinder map has cleared.
4. `/to-spec`, once the constraints are settled and the issue is not a spec yet. A spec states the problem, the solution, and the user stories.
5. `/to-tickets`, when that spec is more than one slice and the tickets are not published yet. One slice skips this line.

When the list is done, tell the user to type `/build`. A screen that still needs a look: tell the user to type `/design` first. `/build` is the slash command. Cursor's Build button is not that door.

**Done when:** one issue is named, and the next skill in the order was named. When the order is finished, `/build` or `/design` was named.
