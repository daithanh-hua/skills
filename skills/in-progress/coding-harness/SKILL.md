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
8. **Workflow.** Where a request starts, the default entry, and the four done gates. The user enters a phase through `plan`, `design`, `build`, `deploy`, or `operate`. [phases.md](./phases.md) points at those doors. Any phase, and the skills outside the lifecycle, stay listed there. Copy **Until done** from [harness.md](./harness.md) unchanged. Copy [phases.md](./phases.md) unchanged.

## Process

When `docs/agents/harness.md` already has sections 1–8, **Until done** still has four gates, and `docs/agents/phases.md` matches [phases.md](./phases.md), read [rescore.md](./rescore.md) and stop. The steps below are the first run, or a run whose **Until done** or phases file was shortened.

### 1. Explore

Read the open repo:

- `CLAUDE.md` and `AGENTS.md`. A symlink pair is one file. A `.claude/` directory. An existing `## Coding harness` section.
- `CONTEXT.md`, `docs/adr/`, `docs/agents/harness.md`, `docs/agents/phases.md`, `docs/agents/decisions.md`, `docs/agents/issue-tracker.md`
- Top-level layout
- `git status -sb`, `git remote -v`, and `git branch -a`. A long-lived `develop` branch. Version tags. Any sentence that already names GitHub flow or Gitflow.
- The validation command, in this order: the CI workflow's check, then a `check` / `ci` / `test` / `validate` script, then `pytest`, `cargo test`, `./mvnw -B verify`, or `go test ./...`
- Whether a linter already runs: a config plus a script, task, or CI step that invokes it. Read [lint.md](./lint.md) only when that pair is absent.

**Done when:** sections 1, 2, 3, 5, and 7 each cite a path or command in this repo, or say the repo has none. Sections 4 and 6 are the template rules. Section 8 stays unset until the questions. Lint is a command in this repo or absent.

### 2. Present findings and ask

Summarise what is present and what is missing. One section, one answer, then the next. Lead with the recommended answer. Skip a section the repo already settled.

**Section A: Instructions file.** Use `CLAUDE.md` only when this project uses Claude Code. Otherwise use `AGENTS.md`.

Claude Code is a `.claude/` directory, or a real `CLAUDE.md`. Then edit `CLAUDE.md` and skip the question.

Otherwise ask:

> Do you use Claude Code for this repo? (recommended: **no**)

Yes writes `CLAUDE.md`. Any other answer writes `AGENTS.md`. One file only. When that file already exists, edit it. A symlink pair is edited once.

**Section B: Validation command.** Skip when exactly one command won the search. Recommend that command. When none exists, ask what to record. The user can leave it `missing`.

**Section C: Lint.** Skip when a linter already runs. Otherwise ask:

> Set up lint? (recommended: **yes**, the default in [lint.md](./lint.md) for the language you found)

Yes follows [lint.md](./lint.md): keep an existing config, otherwise write the default, and add the command that runs it. When the validation command is `missing`, that lint command is the validation command. When a validation command already exists, leave it and record the lint command beside it.

Any other answer records lint as `missing`.

**Section D: Working memory.** Skip when `CONTEXT.md` or `docs/adr/` already exists. When neither exists, recommend **`docs/agents/decisions.md`**.

**Section E: Git strategy.** Skip when the repo already names GitHub flow or Gitflow. Otherwise ask:

> GitHub flow or Gitflow? (recommended: **GitHub flow**. Recommend **Gitflow** when a long-lived `develop` branch exists and a version tag is what deploys.)

GitHub flow: a short branch off `main`, the pull request lands on `main`, merge to `main` deploys.
Gitflow: a branch off `develop`, the pull request lands on `develop`, a version tag on `main` deploys.

**Section F: Where a request starts.** Skip when the harness doc already says so. Ask:

> Where does a request start? (recommended: **a GitHub issue** when the remote is GitHub, otherwise **a question in chat**)

They may say both. An issue is usable only after `docs/agents/issue-tracker.md` exists. When they choose an issue and that file is missing, tell them to run `setup-matt-pocock-skills`.

**Section G: Default entry.** Skip when the harness doc already names one. Ask:

> Start with grill-with-docs, then implement, when the request fits one session? (recommended: **yes**)

Yes writes: `Default entry: grill-with-docs, then implement, for a request that fits one session.`

No: ask which one skill is the default entry, and write `Default entry: <that skill>.`

The full map is [phases.md](./phases.md). This section records one default entry.

**Until done** is not a question. Copy it from [harness.md](./harness.md) on every write, including a re-run whose copy is missing or shortened. Copy [phases.md](./phases.md) the same way.

### 3. Confirm and edit

Show a draft of the `## Coding harness` block, `docs/agents/harness.md`, and `docs/agents/phases.md`. When Section C said yes, include the lint files from [lint.md](./lint.md). When Section D creates it, include `docs/agents/decisions.md`. Let the user edit the draft before writing. Edits to the phases draft are discarded: that file is copied from the template.

**Done when:** the user has accepted the draft or edited it. **Until done** in the draft matches [harness.md](./harness.md). The phases draft matches [phases.md](./phases.md).

### 4. Write

Edit the one instructions file from Section A. When a `## Coding harness` block already exists, replace that block. Leave the surrounding sections alone.

```markdown
## Coding harness

The loop is observe, inspect, choose, act. Read [docs/agents/harness.md](docs/agents/harness.md) at the start of a session that will edit this repo. Which skill to run is in [docs/agents/phases.md](docs/agents/phases.md). A task is done only when **Until done** in the harness doc is met, from this session.
```

Write `docs/agents/harness.md` by filling [harness.md](./harness.md). Delete a `{{...}}` line whose answer is empty. A validation command you did not find stays `missing`. Fill `{{LINT}}` from Section C. Copy **Until done** unchanged. Copy [phases.md](./phases.md) to `docs/agents/phases.md`, replacing whatever is there.

When Section C said yes, write the lint files from [lint.md](./lint.md) before the harness doc. Leave existing violations unfixed.

When Section D creates it, write `docs/agents/decisions.md` with a heading and the line "Decisions that must survive compaction are written here verbatim."

**Done when:** the pointer exists, sections 1–8 are filled, **Until done** matches the template, and `docs/agents/phases.md` matches [phases.md](./phases.md).

### 5. Record validation

Run the validation command when its last-observed line is missing, or the command changed. When the line already records a pass for this same command, leave it. When Section C added a lint command that the validation command does not already run, run the lint command too. When no command exists, write `missing`.

**Done when:** the validation line says pass, fail, or `missing`, from this run or from a pass already recorded for the same command.

### 6. Done

Tell the user which files you wrote, which command you ran, and the word on the validation line. They can edit `docs/agents/harness.md`. Ask again only for a section the doc does not answer.

When the validation line is `missing`, say a task cannot be called done until a command is recorded.
