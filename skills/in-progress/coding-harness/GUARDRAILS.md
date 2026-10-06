# Coding harness guardrails

Read this before editing `SKILL.md`, `harness.md`, `phases.md`, or the `/plan`, `/design`, `/build`, `/deploy`, and `/operate` doors.

This file is the purpose. A change is in purpose when every invariant below still holds. A change that needs to break one edits this file first, in the same change, and names the invariant that moved.

## Purpose

`coding-harness` scaffolds the six-block harness into the project you have open. A request becomes one issue. Each phase door names the first undone step of that phase's order. Code starts after you accept that issue. The skill records the repo. It does the repo's harness setup, and the phase doors do the repo's work.

## Invariants

1. **Scaffold.** Writes go in the open project. The skills library is not a target. Product code stays out of this skill, other than the lint files `lint.md` names. Every skill `phases.md` names is linked into the project's `.cursor/skills` when this library, `~/.agents/skills`, or `~/.claude/skills` has it and the project does not. A real directory already there stays. A name with no source is reported and left unlinked.
2. **Six blocks.** `harness.md` keeps sections 1 through 8. The loop stays observe, inspect, choose, act. You keep the decision. The agent produces the artifact. No skill promotes to production.
3. **Verbatim copies.** **IDE words**, **Plan gate**, **Until done**, and `phases.md` are copied unchanged on every setup run. A re-run keeps them whole. A project line the template does not have stays when it names a path, a command, or a tool that is still in that repo.
4. **One issue.** Plan opens on one issue. A request with no issue creates one, where a request starts. An issue someone already created is the entry. The door leaves that issue as the only new issue. A plan that exists only in chat does not open the gate. Code starts after you accept that issue. Acceptance is the latest user message, exactly `go`, `do it`, or `accepted`.
5. **Phase orders.** Each door names the first undone step of the order in `phases.md`, and the door file lists that same order. A step runs only when its skip is false. The plan spine stays `/grill-with-docs`, then `/to-spec`, then `/to-tickets`. Lines before that spine run only when their skip is false. A missing skill on the Plan order is named and the turn stops. That line is not skipped and is not done. One slice skips `/to-tickets`. The next door is `/build`, or `/design` first when a screen still needs a look. `/build` with no accepted issue sends you to `/plan` and stops. Design, Deploy, and Operate each have their own order in `phases.md`. `implement`, `tdd`, and `diagnosing-bugs` stay in Build, after that acceptance.
6. **Slash commands.** Instructions name `/plan` and `/build`. Cursor Plan mode and the Cursor Build button stay named as IDE controls that do not run those doors. Both doors stay user-invoked: the user types the slash command.
7. **Four gates.** **Until done** stays four, all from this session: the request on disk, red then green, `code-review` on both axes, and the validation command at exit 0. `missing` means the task cannot be done.
8. **Ask every run.** Sections A through G are asked on every run. Each line is **Last answer** or **Recommended**. A section the user does not mention keeps its shown answer.
9. **Router stays true.** A change to the entry, a phase order, or the IDE words updates `ask-matt` and `docs/engineering/ask-matt.md` in the same change.

## Check

Before the edit is finished, each invariant still holds, or this file names the one that moved and why.

Invariant 5 moved from a plan-only list to an order for every phase. The plan spine did not move.
