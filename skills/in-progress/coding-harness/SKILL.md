---
name: coding-harness
description: "Set up Raschka's six-block coding harness in the project you have open: git, the plan gate, the four done gates, lint, and the phase-skill links."
disable-model-invocation: true
---

# Coding harness

Scaffold the coding harness for the repository you have open. Install this skill the same way as `setup-matt-pocock-skills`, open the project repo, and run it there. Writes go in that working directory.

When `skills/in-progress/coding-harness/SKILL.md` is in the working directory, stop and tell the user to open the project.

Before you edit this skill, [harness.md](./harness.md), [phases.md](./phases.md), or a phase door, read [GUARDRAILS.md](./GUARDRAILS.md). A change that breaks a guardrail edits that file first, in the same change.

## Process

### 1. Explore

Read the open repo:

- `CLAUDE.md` and `AGENTS.md`. A symlink pair is one file. A `.claude/` directory. An existing `## Coding harness` section.
- `CONTEXT.md`, `docs/adr/`, `docs/agents/harness.md`, `docs/agents/phases.md`, `docs/agents/decisions.md`, `docs/agents/issue-tracker.md`
- Top-level layout
- `git status -sb`, `git remote -v`, and `git branch -a`. A long-lived `develop` branch. Version tags. Any sentence that already names GitHub flow or Gitflow.
- The validation command, in this order: the CI workflow's check, then a `check` / `ci` / `test` / `validate` script, then `pytest`, `cargo test`, `./mvnw -B verify`, or `go test ./...`
- Whether a linter already runs: a config plus a script, task, or CI step that invokes it. Read [lint.md](./lint.md) only when that pair is absent.

Copy [phases.md](./phases.md) to `docs/agents/phases.md` before the question list.

Link the phase skills on every run, before the question list. From this skill's directory:

```bash
bash link-phase-skills.sh "<open project root>"
```

Keep the script output for the question list.

**Done when:** layout, project docs, the stable prefix, tools, validation, lint, working memory, and git each cite a path or command in this repo, or say the repo has none. The existing request-start and agent-start lines are noted for the list. `docs/agents/phases.md` matches [phases.md](./phases.md). The script printed at least one name, and every name is `installed`, `already`, `left in place`, or `no source`.

### 2. Ask, with the last answer shown

One list, one reply, then write. Ask every section on every run. Open the turn with the link groups (`installed`, `already`, `left in place`, `no source`), then A–G. Each line shows the answer that will be written.

- When the repo already recorded an answer, label it **Last answer**.
- When it did not, label it **Recommended**.

A section the user leaves untouched keeps its shown answer.

When `docs/agents/issue-tracker.md` is absent, the list names it and tells the user to run `setup-matt-pocock-skills`.

**IDE words**, **Plan gate**, and **Until done** are copied in the write step.

**Section A: Instructions file.** One file only. A symlink pair is edited once.

Shown answer: the file that already holds `## Coding harness`. When neither file has it, **Recommended: `AGENTS.md`**, unless `.claude/` or a real `CLAUDE.md` exists, then **Recommended: `CLAUDE.md`**.

`CLAUDE.md` when they choose Claude Code. `AGENTS.md` for any other answer.

**Section B: Validation command.** Shown answer: the command already in the harness doc, otherwise the one command the search found. When none exists, **Recommended: `missing`**, and ask what to record.

**Section C: Lint.** Shown answer: the lint command already running. When none runs, **Recommended: yes**, the default in [lint.md](./lint.md) for the language you found.

Yes follows [lint.md](./lint.md): keep an existing config, otherwise write the default, and add the command that runs it. When validation is `missing`, that lint command is the validation command. When a validation command already exists, leave it and record the lint command beside it. Any other answer records lint as `missing`.

**Section D: Working memory.** Shown answer: `CONTEXT.md` or `docs/adr/` when either exists. When neither exists, **Recommended: `docs/agents/decisions.md`**.

**Section E: Git strategy.** Shown answer: the strategy the repo already names. When it names none, use the recommendation below.

> GitHub flow or Gitflow? (recommended: **GitHub flow**. Recommend **Gitflow** when a long-lived `develop` branch exists and a version tag is what deploys.)

GitHub flow: a short branch off `main`, the pull request lands on `main`, merge to `main` deploys.
Gitflow: a branch off `develop`, the pull request lands on `develop`, a version tag on `main` deploys.

**Section F: Where a request starts.** Shown answer: the line already in the harness doc. When it has none, **Recommended: a GitHub issue** when the remote is GitHub, otherwise **a question in chat**.

They may name both. An issue needs `docs/agents/issue-tracker.md`.

**Section G: Phase doors.** How the user enters a phase. The door reads the context and picks one skill.

Shown answer: the **The agent starts** line, when it names `plan`, `design`, `build`, `deploy`, and `operate`. Label that **Last answer**. When that line names one skill, or the doc has no such line, **Recommended:** the user types `/plan`, `/design`, `/build`, `/deploy`, or `/operate` with the context. The door reads it and picks one skill. Context is a ticket, a list of tickets, an idea, a screen, or another application.

Write that sentence as **The agent starts.**

They may name the doors to keep. The line lists those doors.

**Done when:** the turn opens with the link groups, then A–G, each labeled **Last answer** or **Recommended**.

### 3. Write

When `writing-for-agents` is installed, call the Skill tool with `writing-for-agents` before editing the instructions file.

Edit the one instructions file from Section A. When a `## Coding harness` block already exists, replace only that block.

```markdown
## Coding harness

The loop is observe, inspect, choose, act. A change opens with the plan gate in [docs/agents/harness.md](docs/agents/harness.md): one request creates one issue, an issue someone already created is the entry, and code starts after the user accepts that issue. A missing skill on the Plan order is named and the turn stops. `/plan` and `/build` are slash commands. Cursor Plan mode and the Cursor Build button do not run them. Read that file at the start of a session that will edit this repo. Which skill to run is in [docs/agents/phases.md](docs/agents/phases.md). A task is done only when **Until done** in the harness doc is met, from this session.
```

When Section C said yes, write the lint files from [lint.md](./lint.md). Existing violations stay for a later session.

When Section D creates it, write `docs/agents/decisions.md` with a heading and the line "Decisions that must survive compaction are written here verbatim."

Write `docs/agents/harness.md` by filling [harness.md](./harness.md). You write every section. The rule sentences stay. An installed skill is a pointer in that section, or a step you tell the user to run. Delete a `{{...}}` line whose answer is empty.

- `{{LAYOUT}}`: the top-level layout.
- `{{PROJECT_DOCS}}`: paths to a glossary, ADRs, and `docs/agents/` when they exist.
- `{{STABLE_PREFIX}}`: the instructions file from Section A.
- `{{PROMPT_SKILL}}`: the `writing-for-agents` rule above, when that skill is installed.
- `{{TOOLS}}`: the tools this session can call.
- `{{VALIDATION}}`: Section B. A command you did not find stays `missing`.
- `{{LINT}}`: Section C.
- `{{ASK_FIRST}}`: what this repo already requires a human to approve.
- `{{WORKING_MEMORY}}`: Section D.
- `{{HANDOFF}}`: when `handoff` is installed, the user runs it for a transcript that must travel.
- `{{SPAWNERS}}`: when the repo has a subagent or a task spawner, one bound (read-only, a depth, or a task scope) with those spawners inside it. Setup writes the bound. Spawning waits until a later session.
- `{{GIT_STRATEGY}}`, `{{GIT_START}}`, `{{GIT_TARGET}}`, `{{GIT_DEPLOY}}`: Section E.
- `{{REQUEST_START}}`: Section F.
- `{{AGENT_START}}`: Section G.

Sections 4 and the paragraph in section 6 stay as the template wrote them. Copy **IDE words**, **Plan gate**, and **Until done** unchanged, including when the project copy is missing or shortened.

When `docs/agents/harness.md` already exists, keep a line the template does not have if it names a path, a command, or a tool that is still in this repo. Drop a kept line whose path or command is gone.

`docs/agents/phases.md` was copied in explore. Replace it from [phases.md](./phases.md) when that copy was shortened.

**Done when:** the pointer names the plan gate and the IDE clash, sections 1–8 are filled, **IDE words**, **Plan gate**, and **Until done** match the template, `docs/agents/phases.md` matches [phases.md](./phases.md), and the phase-skill links from explore are still in place.

### 4. Record validation

Run the validation command on this run. An earlier pass does not carry forward. When Section C added a lint command that the validation command does not already run, run the lint command too. When no command exists, write `missing`.

**Done when:** the validation line says pass, fail, or `missing`, and that word comes from this run.

### 5. Done

Tell the user which files you wrote, which command you ran, and the word on the validation line. They can edit `docs/agents/harness.md`.

When the validation line is `missing`, say a task cannot be called done until a command is recorded.

When the harness doc already had sections 1–8 and four gates before this run, read [rescore.md](./rescore.md) now.
