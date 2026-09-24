---
name: coding-harness
description: "Set up Raschka's six-block coding harness in the project you have open, including its git strategy, how a request enters, the four gates that mean done, and a linter when the repo has none."
disable-model-invocation: true
---

# Coding harness

Scaffold the coding harness for the repository you have open. Install this skill into your agent the same way as `setup-matt-pocock-skills`, open the project repo, and run it there. Writes go in that working directory.

The skills library that ships this skill is not a project repo. If `skills/in-progress/coding-harness/SKILL.md` is in the working directory, stop and tell the user to open the project.

This is a prompt-driven skill, not a deterministic script. Explore, present what you found, confirm with the user, then write.

A coding agent is a model in a tools loop. The harness validates a structured tool call, asks for approval when a gate says so, executes, clips and bounds the result, and appends it to session state. The loop is observe, inspect, choose, act.

## What this file records

Fill [harness.md](./harness.md) from the open repo. A block an installed skill already owns is done by that skill, in this repo. Otherwise write it yourself. The file you leave still states the rule.

1. **Live repo context.** Git state, layout, project docs. Refresh git with a command. Terminology or an ADR, and `domain-modeling` is installed: call the Skill tool with `domain-modeling`. Issue tracker missing, and `setup-matt-pocock-skills` is installed: tell the user to run it.
2. **Prompt shape and cache reuse.** Stable prefix plus changing session state. When `writing-for-agents` is installed, call the Skill tool with `writing-for-agents` before editing the prefix.
3. **Structured tools, validation, and permissions.** The tools you can call, the validation command, the lint command, this repo as the sandbox, and what needs a human yes.
4. **Context reduction and output management.** Clip verbose output, drop a duplicate file read, compress older transcript into working memory.
5. **Transcripts, memory, and resumption.** The transcript stays in the harness session log. Working memory is a file in this repo. When `handoff` is installed, tell the user to run it for a transcript that must travel.
6. **Delegation and bounded subagents.** One bound: read-only, a depth, or a task scope. Installed spawners stay inside it. Do not spawn them during setup.
7. **Git.** GitHub flow or Gitflow: where a branch starts, where the pull request lands, what deploys.
8. **Workflow.** Where a request starts, how the agent starts, and the four done gates. Copy the **Until done** block from [harness.md](./harness.md) unchanged.

## Process

### 1. Explore

Read the open repo:

- `CLAUDE.md` and `AGENTS.md`. A symlink pair is one file. A `.claude/` directory. An existing `## Coding harness` section.
- `CONTEXT.md`, `docs/adr/`, `docs/agents/harness.md`, `docs/agents/decisions.md`, `docs/agents/issue-tracker.md`
- Top-level layout
- `git status -sb`, `git remote -v`, and `git branch -a`. A long-lived `develop` branch. Version tags. Any sentence that already names GitHub flow or Gitflow.
- The validation command, in this order: the CI workflow's check, then a `check` / `ci` / `test` / `validate` script, then `pytest`, `cargo test`, `./mvnw -B verify`, or `go test ./...`
- Whether a linter already runs: a config plus a script, task, or CI step that invokes it. Read [lint.md](./lint.md) only when that pair is absent.

**Done when:** blocks 1–8 each have a status and cite a path or command in this repo, and lint is either a command in this repo or absent.

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

**Section G: How the agent starts.** Skip when the harness doc already says so. Ask:

> Start with grill-with-docs, then implement when it fits one session? (recommended: **yes**)

Yes records this path. A ticket that already exists: the user runs `implement`. A chat request that fits one session: the user runs `grill-with-docs`, then `implement`. A request that does not fit one session: the user runs `wayfinder`, then `to-spec`, then `to-tickets`. A question that needs a runnable answer: call the Skill tool with `prototype`, and the user runs `handoff` out and back. A runbook, only when the user asks for steps only they can perform: call the Skill tool with `wizard`. `to-tickets` is the checklist.

No means ask which one entry is the default, and record that entry.

**Until done** is not a question. It is copied from [harness.md](./harness.md) on every write, including a re-run whose copy is missing or shortened.

### 3. Confirm and edit

Show a draft of the `## Coding harness` block, `docs/agents/harness.md`, the lint files [lint.md](./lint.md) will add, and `docs/agents/decisions.md` when Section D creates it. Let the user edit the draft before writing.

**Done when:** the user has accepted the draft or edited it. The four done gates are still present.

### 4. Write

Edit the one instructions file from Section A. When a `## Coding harness` block already exists, replace that block. Leave the surrounding sections alone.

```markdown
## Coding harness

The loop is observe, inspect, choose, act. Read [docs/agents/harness.md](docs/agents/harness.md) at the start of a session that will edit this repo. A task is done only when this session shows all four: the request on disk, a test that went red then green, Standards and Spec from `code-review`, and the validation command exiting 0.
```

Write `docs/agents/harness.md` by filling [harness.md](./harness.md). Delete a `{{...}}` line whose answer is empty. A validation command you did not find stays `missing`. Fill `{{LINT}}` from Section C. Copy **Until done** unchanged.

When Section C said yes, write the lint files from [lint.md](./lint.md) before the harness doc. Leave existing violations unfixed.

When Section D creates it, write `docs/agents/decisions.md` with a heading and the line "Decisions that must survive compaction are written here verbatim."

**Done when:** the pointer exists, blocks 1–8 are filled, and **Until done** matches the template.

### 5. Prove validation

Run the validation command when its last-observed line is missing, or the command changed. When the line already records a pass for this same command, leave it. When Section C added a lint command that the validation command does not already run, run the lint command too.

**Done when:** the line says pass, fail, or `missing`, from an observed run. `missing` ends the skill: the harness is not in place until a command exists.

### 6. Done

Tell the user the harness is in this repo, which command you ran, and that they can edit `docs/agents/harness.md`. Re-run to fill a missing section. Do not re-ask a section the doc already answers.

When blocks 1–8 and **Until done** are all present, score the session instead: context rot, lossy compaction, stateless session. Repair working memory. Leave the doc.
