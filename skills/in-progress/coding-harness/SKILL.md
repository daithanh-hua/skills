---
name: coding-harness
description: "Set up Raschka's six-block coding harness in the project you have open, including its git strategy, how a request enters, the four gates that mean done, and a linter when the repo has none."
disable-model-invocation: true
---

# Coding harness

Scaffold the coding harness for the repository you have open. Install this skill into your agent the same way as `setup-matt-pocock-skills`, open the project repo, and run it there. Writes go in that working directory.

The skills library that ships this skill is not a project repo. If `skills/in-progress/coding-harness/SKILL.md` is in the working directory, stop and tell the user to open the project.

Explore, present what you found, confirm with the user, then write.

A coding agent is a model in a tools loop. The harness validates a structured tool call, asks for approval when a gate says so, executes, clips and bounds the result, and appends it to session state. The loop is observe, inspect, choose, act.

## What this file records

Fill [harness.md](./harness.md) from the open repo. You write every section. The file you leave still states the rule. An installed skill is a pointer in that section, or a step you tell the user to run.

1. **Live repo context.** Git state, layout, project docs. Refresh git with a command. Record paths to a glossary or ADRs when they exist. Issue tracker missing: tell the user to run `setup-matt-pocock-skills`.
2. **Prompt shape and cache reuse.** Stable prefix plus changing session state. When `writing-for-agents` is installed, call the Skill tool with `writing-for-agents` before editing the prefix.
3. **Structured tools, validation, and permissions.** The tools you can call, the validation command, the lint command, this repo as the sandbox, and what needs a human yes.
4. **Context reduction and output management.** Clip verbose output, drop a duplicate file read, compress older transcript into working memory.
5. **Transcripts, memory, and resumption.** The transcript stays in the harness session log. Working memory is a file in this repo. When `handoff` is installed, tell the user to run it for a transcript that must travel.
6. **Delegation and bounded subagents.** One bound: read-only, a depth, or a task scope. Installed spawners stay inside it. Setup writes the bound. Spawning waits until a later session.
7. **Git.** GitHub flow or Gitflow: where a branch starts, where the pull request lands, what deploys.
8. **Workflow.** Where a request starts, the phase doors, and the four done gates. The user enters a phase through `plan`, `design`, `build`, `deploy`, or `operate`, plus the context. [phases.md](./phases.md) is the map those doors read. Any phase, and the skills outside the lifecycle, stay listed there. Copy **Until done** from [harness.md](./harness.md) unchanged. Copy [phases.md](./phases.md) unchanged.

## Process

Every run asks the question list, then writes. Copy [phases.md](./phases.md) to `docs/agents/phases.md` as soon as explore is done. That copy does not wait on an answer. When the harness doc already had sections 1–8 and four gates before this run, read [rescore.md](./rescore.md) after the write.

### 1. Explore

Read the open repo:

- `CLAUDE.md` and `AGENTS.md`. A symlink pair is one file. A `.claude/` directory. An existing `## Coding harness` section.
- `CONTEXT.md`, `docs/adr/`, `docs/agents/harness.md`, `docs/agents/phases.md`, `docs/agents/decisions.md`, `docs/agents/issue-tracker.md`
- Top-level layout
- `git status -sb`, `git remote -v`, and `git branch -a`. A long-lived `develop` branch. Version tags. Any sentence that already names GitHub flow or Gitflow.
- The validation command, in this order: the CI workflow's check, then a `check` / `ci` / `test` / `validate` script, then `pytest`, `cargo test`, `./mvnw -B verify`, or `go test ./...`
- Whether a linter already runs: a config plus a script, task, or CI step that invokes it. Read [lint.md](./lint.md) only when that pair is absent.

**Done when:** sections 1, 2, 3, 5, and 7 each cite a path or command in this repo, or say the repo has none. Sections 4 and 6 are the template rules. Section 8's last answers are noted for the list. Lint is a command in this repo or absent. `docs/agents/phases.md` matches [phases.md](./phases.md).

### 2. Ask, with the last answer shown

Present sections A–G in one list, in the same turn. Ask every section on every run. Each line shows the answer that will be written.

- When the repo already recorded an answer, label it **Last answer**.
- When it did not, label it **Recommended**.

A section the user does not mention keeps its shown answer. Write after that one reply. No section waits on another.

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

They may say both. An issue is usable only after `docs/agents/issue-tracker.md` exists. When they choose an issue and that file is missing, tell them to run `setup-matt-pocock-skills`.

**Section G: Phase doors.** How the user enters a phase. The door reads the context and picks one skill.

Shown answer: the **The agent starts** line, when it names `plan`, `design`, `build`, `deploy`, and `operate`. Label that **Last answer**. When that line names one skill, or the doc has no such line, **Recommended:** the user runs `plan`, `design`, `build`, `deploy`, or `operate` with the context. The door reads it and picks one skill. Context is a ticket, a list of tickets, an idea, a screen, or another application.

Write that sentence as **The agent starts.** The map is [phases.md](./phases.md), copied to `docs/agents/phases.md`.

No: they name the doors to keep. The line lists those doors.

**Until done** is not a question. Copy it from [harness.md](./harness.md) on every write, including a re-run whose copy is missing or shortened.

**Done when:** the list shows A–G, each with **Last answer** or **Recommended**, and `docs/agents/phases.md` is already a copy of [phases.md](./phases.md).

### 3. Write

Edit the one instructions file from Section A. When a `## Coding harness` block already exists, replace that block. Leave the surrounding sections alone.

```markdown
## Coding harness

The loop is observe, inspect, choose, act. Read [docs/agents/harness.md](docs/agents/harness.md) at the start of a session that will edit this repo. Which skill to run is in [docs/agents/phases.md](docs/agents/phases.md). A task is done only when **Until done** in the harness doc is met, from this session.
```

Write `docs/agents/harness.md` by filling [harness.md](./harness.md). Delete a `{{...}}` line whose answer is empty. A validation command you did not find stays `missing`. Fill `{{LINT}}` from Section C. Fill **The agent starts.** from Section G. Copy **Until done** unchanged.

When `docs/agents/harness.md` already exists, keep a line the template does not have if it names a path, a command, or a tool that is still in this repo. That covers a branch guard, a Stitch block, and a hook named in **Saying done**. Drop a kept line whose path or command is gone.

`docs/agents/phases.md` was copied in explore. Replace it again from [phases.md](./phases.md) if that copy was shortened.

When Section C said yes, write the lint files from [lint.md](./lint.md) before the harness doc. Leave existing violations unfixed.

When Section D creates it, write `docs/agents/decisions.md` with a heading and the line "Decisions that must survive compaction are written here verbatim."

**Done when:** the pointer exists, sections 1–8 are filled, **Until done** matches the template, and `docs/agents/phases.md` matches [phases.md](./phases.md).

### 4. Record validation

Run the validation command on this run. An earlier pass does not carry forward. When Section C added a lint command that the validation command does not already run, run the lint command too. When no command exists, write `missing`.

**Done when:** the validation line says pass, fail, or `missing`, and that word comes from this run.

### 5. Done

Tell the user which files you wrote, which command you ran, and the word on the validation line. They can edit `docs/agents/harness.md`. The next run asks A–G again and shows these answers as **Last answer**.

When the validation line is `missing`, say a task cannot be called done until a command is recorded.

When the harness doc already had sections 1–8 and four gates before this run, read [rescore.md](./rescore.md) now.
