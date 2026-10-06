# Phases

Plan, then Design, then Build & Test, then Deploy, then Operate & Maintain. You keep the decision. The agent produces the artifact.

For a phase, the user types that phase's slash command with the context: `/plan`, `/design`, `/build`, `/deploy`, or `/operate`. The door names the first step in that phase's order whose work is not done. A step whose skip is true is done. For Any phase, Article, and Outside this lifecycle, run a line only when it matches. Tell the user to type a skill whose line says so. Call the Skill tool for every other skill named here. When a named skill is missing from this agent, tell the user the name and skip that line.

When no line matches, tell the user to type `/ask-matt`.

## IDE words

`/plan` and `/build` are harness slash commands. Type them. Cursor uses the same words for IDE controls, and those controls do not run these doors.

- Cursor Plan mode is the read-only mode. Switching to it does not create the issue and does not run the plan order.
- Cursor's Build button leaves Plan mode and starts coding in Agent mode. That click is not `/build`.

## Before Plan

- No issue tracker yet: tell the user to type `/setup-matt-pocock-skills`.

## Plan

You decide the constraints and the scope. The agent drafts the spec, the tickets, and the edge cases.

Entry is one of two. Both leave one issue. A plan that exists only in chat does not open the gate.

- A request from you, and no issue yet: the agent creates one issue where a request starts. The reply names it.
- One issue someone already created: that issue is the entry. The agent does not create a second one.

A recurring loop in your life or work is not this order. Type `/loop-me`.

Then the skills run in this order. The user types `/plan` with the request or the issue. That skill names the first line whose work is not done yet. The spine is `grill-with-docs`, `to-spec`, `to-tickets`. The lines before the spine run only when their skip is false.

1. `/to-questionnaire`, when a person other than you holds the answer. Skip when you hold it.
2. `research`, when the answer is in source material and you are not the one who must decide. Skip otherwise. The file it writes feeds the next sharpening step.
3. Sharpen, the first line whose skip is false:
   - `/grilling`, when you asked for the interview with no wrapper. Skip otherwise. This line replaces the other sharpeners.
   - `/wayfinder`, when the way is not visible or the effort is bigger than one session. Skip when one session can hold it. A cleared map skips `/grill-with-docs`. The next step is `/to-spec`.
   - `/grill-me`, when there is no working directory. Skip when a repo is open.
   - `/grill-with-docs`, while the issue is still a raw request in a repo. Skip once this session has run it, the issue is already a spec, or a wayfinder map has cleared.
4. `/to-spec`, once the constraints are settled and the issue is not a spec yet. A spec states the problem, the solution, and the user stories.
5. `/to-tickets`, when the spec is more than one slice and the tickets are not published yet. One slice skips this line.

When the list is done, the user types `/build`. A screen that still needs a look: the user types `/design` first.

## Design

You choose the architecture, the data model, and the look of a screen. The agent supplies the words, the module shape, and the screen.

The user types `/design` with the context. That skill names the first line whose work is not done yet. An idea with nothing to design yet: type `/plan`.

1. `domain-modeling`, when a term this change needs is fuzzy. Skip when the glossary already uses it cleanly.
2. `codebase-design`, when a module's seam or shape is undecided. Skip when the seam is chosen.
3. `/setup-ts-deep-modules`, when that shape is deep modules, this is a TypeScript repo, and the wiring is absent. Skip otherwise.
4. `prototype`, when a state model or logic question still needs a runnable answer. `/handoff` out and back. Skip when paper settles it.
5. `/design-harness`, when a screen is in this change and `docs/agents/design-harness.md` is missing. Skip when there is no screen, or the file exists.
6. The screen, when one remains and that file exists. Follow the file. When it names Google Stitch, that pipeline generates the screen. The user sees it. Skip when there is no screen.

When the list is done, the user types `/build`.

## Build & Test

You set the quality bar: the validation command and lint in the harness doc. You approve the change. Build starts after the plan gate in the harness doc is accepted. The agent then writes the code, the tests, and the fixes, and turns a red bar green. Done when **Until done** in the harness doc is met, all four, from this session.

The user types `/build` with the context. Cursor's Build button does not type this command. With no accepted issue, this door sends the user to `/plan` and stops. A screen that still needs a look: type `/design` and stop.

1. `diagnosing-bugs`, when this is a bug, a flake, a slowdown, or a regression, and the cause is not named. Skip when the cause is known, or this is a feature.
2. The write, the first line whose skip is false:
   - `migrate-to-shoehorn`, when the change is tests that use `as`. Skip otherwise.
   - `/implement-spec`, when the spec names more than one ticket. Skip for one ticket.
   - `/implement`, for one ticket or one change. It drives `tdd`, then `code-review`.
   - `tdd`, for one behaviour and no spec. Skip when `/implement` or `/implement-spec` is the write.
3. `code-review`, after the edit, against a fixed point. Standards and Spec both report. Skip when this session already has both axes and no Spec finding is open.
4. The validation command in the harness doc, run here, exit 0. Skip when this session already has that exit after the last edit.

When the list is done, the user types `/deploy` to ship, or `/operate` to look back.

## Deploy

You sign off on what ships. The agent writes the pull request body. No skill promotes to production. Where a branch starts, where the pull request lands, and what deploys: section 7 of the harness doc.

The user types `/deploy` with the context. That skill names the first line whose work is not done yet.

1. `pr`, when a branch is ready and the pull request body for this change is not current. Skip when the body is current.
2. `wizard`, when a human must still click: provisioning, credentials, a dashboard, or a cutover. Skip when no human click remains.
3. Sign-off, when the context is a release, production, or a promotion. Stop. The user signs off. Section 7 says what deploys.

## Operate & Maintain

You choose rollback, hotfix, or a change to the agent's environment. The agent analyzes the failure and drafts the first fix.

The user types `/operate` with the context.

A pile of bugs or requests you did not create: type `/triage`. The issues it marks ready enter `/plan`. Tickets from `/to-tickets` are already ready.

An incident, logs, or a failure that resists a glance: `diagnosing-bugs`. You choose rollback or hotfix. A hotfix enters `/plan`.

After a build, the skills run in this order. The door names the first line whose work is not done yet.

1. `/retro`, when this session has not been looked back on. You keep which environment changes.
2. `/improve-codebase-architecture`, when `/retro` or you asked to deepen the code. A picked opportunity enters `/plan`. Skip when neither pointed here.
3. `setup-pre-commit`, when you want a pre-commit hook and it is not installed. Skip otherwise.
4. `git-guardrails-claude-code`, when you want dangerous git commands blocked in Claude Code and that block is absent. Skip otherwise.

## Any phase

- A message did not land: tell the user to type `/wait-what`.
- The transcript must travel, including `/handoff` out and back around `prototype`: tell the user to type `/handoff`.
- Hand this conversation to a fresh background agent now: tell the user to type `/claude-handoff`.

## Article

Not a product phase. Explore, then one exploit.

1. `/writing-fragments`, while there is no raw pile yet.
2. The pile exists. Type `/writing-beats` for a journey of beats, or `/writing-shape` for an article paragraph by paragraph.

## Outside this lifecycle

- Editing a skill, `AGENTS.md`, or `CLAUDE.md`: call the Skill tool with `writing-for-agents`.
- Learning a concept over sessions: tell the user to type `/teach`.
- A course exercise tree: call the Skill tool with `scaffold-exercises`.
