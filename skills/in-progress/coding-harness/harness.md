# Coding harness

A coding agent is a model in a tools loop. The harness validates a structured tool call, asks for approval when a gate says so, executes, clips and bounds the result, and appends it to session state. The loop is observe, inspect, choose, act.

Read this file at the start of a session that will edit this repo. Refresh anything marked as a command. Leave command output in the terminal.

## 1. Live repo context

- **Git.** Refresh with `git status -sb` and `git remote -v`. A status copied into chat is stale.
- **Layout.** {{LAYOUT}}
- **Project docs.** {{PROJECT_DOCS}}

## 2. Prompt shape and cache reuse

- **Stable prefix.** {{STABLE_PREFIX}}
- **Session state.** The transcript, tool results, and the current diff. Keep those out of the prefix.

{{PROMPT_SKILL}}

## 3. Structured tools, validation, and permissions

- **Tools.** {{TOOLS}}
- **Validation.** {{VALIDATION}}
- **Lint.** {{LINT}}
- **Path sandbox.** This repo.
- **Ask first.** {{ASK_FIRST}}

## 4. Context reduction and output management

- Clip tool output to the failing lines, the diff, and the decision.
- Skip a file read that is already in the transcript and has not changed.
- Compress older transcript by writing the decision into working memory. A summary does not replace the requirement.

## 5. Transcripts, memory, and resumption

- **Full transcript.** The harness session log. It stays with the harness.
- **Working memory.** {{WORKING_MEMORY}}
- **Another agent.** {{HANDOFF}}

## 6. Delegation and bounded subagents

A subagent inherits this file and one task. It does not inherit the parent transcript. The bound is one of: read-only, a named depth, or a single task scope. It returns a report and does not spawn further agents.

{{SPAWNERS}}

## Git

- **Strategy.** {{GIT_STRATEGY}}
- **Start from.** {{GIT_START}}
- **Pull request lands on.** {{GIT_TARGET}}
- **Deploy.** {{GIT_DEPLOY}}

## Workflow

- **A request starts.** {{REQUEST_START}}
- **The agent starts.** {{AGENT_START}}
- **Until done.** A task is done only when all four are true, from this session. A summary of an earlier turn does not count.
  1. The request is on disk: an issue, a spec, or a paragraph in working memory. A request that exists only in chat is not a done target.
  2. Red, then green: call the Skill tool with `tdd`. When the user runs `implement`, that skill drives `tdd`. Name the test that failed before the edit and passes after it.
  3. Review: call the Skill tool with `code-review` against a fixed point. Standards and Spec both report. A Spec finding that the change is wrong is fixed, and `code-review` runs again. "No spec available" means gate 1 is still open.
  4. The suite: the validation command, run here, output read, exit 0. `missing` means the task cannot be done.
- **Saying done.** Quote the four: where the request lives, the test that went red then green, the two review axes, and the command's exit status. A commit waits until the user asks for one.
