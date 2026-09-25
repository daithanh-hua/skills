---
name: design-harness
description: "Set up the frontend design stack in the project you have open: which design tool, whether agents read DESIGN.md, and whether open briefs use the frontend-design skill."
disable-model-invocation: true
---

# Design harness

Scaffold the design harness for the repository you have open. Install this skill into your agent the same way as `setup-matt-pocock-skills`, open the project repo, and run it there. Writes go in that working directory.

The skills library that ships this skill is not a project repo. If `skills/in-progress/design-harness/SKILL.md` is in the working directory, stop and tell the user to open the project.

This is a prompt-driven skill, not a deterministic script. Explore, grill one choice at a time, confirm, then write.

Three layers, and this skill picks how they stack:

- A **design tool** is where humans make the look (Figma, Google Stitch, Penpot).
- A **design skill** steers an open brief. That skill is Anthropic's `frontend-design`. This skill does not contain it.
- **DESIGN.md** is Google's plain-text design system (YAML tokens plus prose). Tokens are the values. Prose says how to apply them. Spec: `google-labs-code/design.md`. The format is alpha.

## Process

### 1. Explore

Read the open repo:

- `CLAUDE.md` and `AGENTS.md`. A symlink pair is one file. A `.claude/` directory. An existing `## Design harness` section.
- `DESIGN.md` at the repo root, and `docs/agents/design-harness.md`.
- A Figma, Stitch, or Penpot URL in the README or the docs.
- Where tokens already live: a Tailwind theme, CSS variables, or a tokens file. Name the path. Leave the values unread beyond enough to know the file exists.

**Done when:** each item is present or absent, and a present item cites a path or URL.

### 2. Grill

One section, one question, then wait. Lead with the recommended answer. Skip a section the repo already settled. The user may reject the recommendation. Record what they pick.

**Section A: Instructions file.** Use `CLAUDE.md` only when this project uses Claude Code. Otherwise use `AGENTS.md`.

Claude Code is a `.claude/` directory, or a real `CLAUDE.md`. Then edit `CLAUDE.md` and skip the question.

Otherwise ask:

> Do you use Claude Code for this repo? (recommended: **no**)

Yes writes `CLAUDE.md`. Any other answer writes `AGENTS.md`. One file only. When that file already exists, edit it. A symlink pair is edited once.

**Section B: Design tool.** Skip when the repo already names one tool and no second tool. Otherwise ask:

> Figma, Google Stitch, Penpot, or none? (recommended: **Figma** when people share product UI. Recommend **Google Stitch** when the work is prompt-to-mock and you want a DESIGN.md export. Recommend **Penpot** when files must be open-source or self-hosted. Recommend **none** when code in this repo is the only design surface.)

**Section C: What agents read.** Skip when `DESIGN.md` already exists. Otherwise ask:

> Record the identity in DESIGN.md? (recommended: **yes** when agents will implement UI here. Recommend **no** when the design tool is the only source of truth.)

Yes, and the tool is Google Stitch: ask whether a Stitch export already exists. A file they have is copied to `DESIGN.md`. No file means a stub with an Overview only, and tokens wait for the export.

Yes, and the tool is Figma or Penpot: humans edit the tool. Agents read `DESIGN.md`. On conflict, `DESIGN.md` wins for code until someone updates it from the tool.

Yes, and the tool is none: `DESIGN.md` is the identity. When a token file already exists, name it in the harness and leave `DESIGN.md` as the rationale that points at that file.

No: agents read the tool, or the token file from the explore step. Say so in the harness.

**Section D: Agent taste.** Ask:

> Use Anthropic's frontend-design skill on open briefs? (recommended: **yes** when no palette is settled. Recommend **no** when DESIGN.md or the tool already pins palette, type, and layout.)

Yes: tell the user to install `frontend-design` from `anthropics/skills` the same way they install other skills. This skill does not install it. The harness says: on an open brief, the user runs `frontend-design`. When `DESIGN.md` exists, that file wins, and the skill spends freedom only on axes the file leaves open.

No: the harness says agents follow `DESIGN.md` or the tool, and do not invent a palette.

**Section E: What a design change produces.** Skip when the harness doc already says so. Ask:

> Code in this repo, a mock in the design tool, or mock then code? (recommended: **code** when this is an application repo. Recommend **a mock** when this work is exploration. Recommend **mock then code** when designers and this repo both ship.)

**Until done** is not a question. Copy it from [harness.md](./harness.md) on every write, including a re-run whose copy is missing or shortened.

### 3. Confirm

Show a draft of the `## Design harness` block, `docs/agents/design-harness.md`, and `DESIGN.md` when Section C creates it. Let the user edit the draft before writing.

**Done when:** the user has accepted the draft or edited it. The four done gates are still present.

### 4. Write

Edit the one instructions file from Section A. When a `## Design harness` block already exists, replace that block. Leave the surrounding sections alone.

```markdown
## Design harness

Read [docs/agents/design-harness.md](docs/agents/design-harness.md) before changing UI. A screen is done only when the visual decision is on disk, the screen uses it, the quality floor is met, and the user has seen it.
```

Write `docs/agents/design-harness.md` by filling [harness.md](./harness.md). Delete a `{{...}}` line whose answer is empty. Copy **Until done** unchanged.

When Section C creates `DESIGN.md`, write it at the repo root. A stub is an Overview that names the tool and says tokens are not set yet. Do not invent hex values, typefaces, or a palette. A Stitch export the user supplied is that file, unchanged.

**Done when:** the pointer exists, the stack lines are filled, and **Until done** matches the template.

### 5. Done

Tell the user the harness is in this repo, which tool and which file agents read, and that they can edit `docs/agents/design-harness.md`. Re-run to fill a missing section. Do not re-ask a section the doc already answers.
