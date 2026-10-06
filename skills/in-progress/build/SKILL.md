---
name: build
description: "After an accepted issue, name the first undone build step: diagnose, write, review, then the validation command."
argument-hint: "A ticket, a list of tickets, an idea, a screen, or another application"
disable-model-invocation: true
---

# Build

Before editing this door, read [../coding-harness/GUARDRAILS.md](../coding-harness/GUARDRAILS.md). Invariants 5 and 6 bind this file.

You set the quality bar and you approve the change. The agent writes the code, the tests, and the fixes. A task is done only when **Until done** in `docs/agents/harness.md` is met, when that file exists.

The order is the Build & Test section of [../coding-harness/phases.md](../coding-harness/phases.md). The context is what the user passed with this skill. Read it. When they passed nothing, ask once what it is.

When `docs/agents/harness.md` has a Plan gate and this change has no accepted issue, tell the user to type `/plan` with the request or the issue. Stop. `/plan` is the slash command. Cursor Plan mode is not that door.

A screen that still needs a look: tell the user to type `/design` and stop.

Walk the list in order. Name the first line whose work is not done. Call the Skill tool for `diagnosing-bugs`, `migrate-to-shoehorn`, `tdd`, and `code-review`. The user types `/implement-spec` and `/implement`. This door does not start those two. `/build` is the slash command. Cursor's Build button is not this door.

1. `diagnosing-bugs`, when this is a bug, a flake, a slowdown, or a regression, and the cause is not named. Skip when the cause is known, or this is a feature.
2. The write, the first line whose skip is false:
   - `migrate-to-shoehorn`, when the change is tests that use `as`. Skip otherwise.
   - `/implement-spec`, when the spec names more than one ticket. Skip for one ticket.
   - `/implement`, for one ticket or one change. It drives `tdd`, then `code-review`.
   - `tdd`, for one behaviour and no spec. Skip when `/implement` or `/implement-spec` is the write.
3. `code-review`, after the edit, against a fixed point. Standards and Spec both report. Skip when this session already has both axes and no Spec finding is open.
4. The validation command in the harness doc, run here, exit 0. Skip when this session already has that exit after the last edit.

When the list is done, tell the user to type `/deploy` to ship, or `/operate` to look back.

**Done when:** the user was sent to `/plan` or `/design`, or the next step was named. When the order is finished, `/deploy` or `/operate` was named.
