# Phases

Plan, then Design, then Build & Test, then Deploy, then Operate & Maintain. You keep the decision. The agent produces the artifact.

For a phase, the user runs that phase's door with the context. The door picks one skill. For Any phase and Outside this lifecycle, run a line only when it matches. Tell the user to run the skills phrased that way. Call the Skill tool for every other skill named here. When a named skill is missing from this agent, tell the user the name and continue.

When no line matches, tell the user to run `ask-matt`.

## Before Plan

- No issue tracker yet: tell the user to run `setup-matt-pocock-skills`.

## Plan

You decide the constraints and the scope. The agent drafts the spec, the tickets, and the edge cases.

The user runs `plan` with the context. That skill reads it and picks one plan skill.

## Design

You choose the architecture, the data model, and the look of a screen. The agent supplies the words, the module shape, and the screen.

A UI screen follows `docs/agents/design-harness.md` when that file exists. When it names Google Stitch, that pipeline generates the screen and then the code. The user runs `design` with the context. That skill reads it and picks one design skill.

## Build & Test

You set the quality bar: the validation command and lint in the harness doc. You approve the change. The agent writes the code, the tests, and the fixes, and turns a red bar green. Done when **Until done** in the harness doc is met, all four, from this session.

The user runs `build` with the context. A list of tickets picks `implement-spec`.

## Deploy

You sign off on what ships. The agent writes the pull request body. No skill promotes to production. Where a branch starts, where the pull request lands, and what deploys: section 7 of the harness doc.

The user runs `deploy` with the context. A pull request body calls `pr`.

## Operate & Maintain

You choose rollback, hotfix, or a change to the agent's environment. The agent analyzes the failure and drafts the first fix.

The user runs `operate` with the context. After the build, the user runs `retro`.

## Any phase

- A message did not land: tell the user to run `wait-what`.
- Editing a skill, `AGENTS.md`, or `CLAUDE.md`: call the Skill tool with `writing-for-agents`.
- The transcript must travel to a new directory, a colleague, or a new harness: tell the user to run `handoff`.
- Hand this conversation to a fresh background agent now: tell the user to run `claude-handoff`.

## Outside this lifecycle

- Learning a concept over sessions: tell the user to run `teach`.
- An article, as beats: tell the user to run `writing-beats`.
- Mining fragments for an article: tell the user to run `writing-fragments`.
- Shaping raw material into an article: tell the user to run `writing-shape`.
- A course exercise tree: call the Skill tool with `scaffold-exercises`.
