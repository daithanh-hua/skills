# Google Stitch

Choosing Stitch is the acceptance. Write during this step.

On a re-run, add only what is missing. Keep a `DESIGN.md` that already has tokens, a `metadata.json` with a `projectId`, a `SITE.md` with a sitemap, a `next-prompt.md` that names a page, and a stitch MCP entry that already points at the server below.

Setup writes the scaffold and stops. The first screen waits for a later UI task.

## Skills

Install the full suite, plugins `stitch-design`, `stitch-build`, and `stitch-utilities`, from https://github.com/google-labs-code/stitch-skills. Run the install command that README gives for the harness you are running in. A prompt that offers a subset still means the full suite. An already-installed result counts as done.

**Done when:** the command exits 0, or it reports the suite is already present.

## MCP

Write the server into this project's MCP config. The setup guide is https://stitch.withgoogle.com/docs/mcp/setup. When that page names the URL, the header, or the env var, use the page. When it does not, use `https://stitch.googleapis.com/mcp`, the header `X-Goog-Api-Key`, and `STITCH_API_KEY` (those names come from `@google/stitch-sdk`).

The tracked file reads the key from the environment. Merge into an existing server map and leave the other servers.

- Cursor: `.cursor/mcp.json`
- Claude Code: `.mcp.json` at the repo root
- Any other harness: the project MCP file that harness reads. When it has none, write `.mcp.json` at the repo root.

Use this shape when the harness does not document a different one:

```json
{
  "mcpServers": {
    "stitch": {
      "url": "https://stitch.googleapis.com/mcp",
      "headers": {
        "X-Goog-Api-Key": "${env:STITCH_API_KEY}"
      }
    }
  }
}
```

Add `STITCH_API_KEY=` to `.env.example`. Create that file when the repo has none. `.env` is listed in `.gitignore`.

When `STITCH_API_KEY` is unset and `wizard` is installed, call the Skill tool with `wizard` so the user can create the key and write it to `.env`. The human path is: sign in at https://stitch.withgoogle.com, open Stitch settings, API Keys, Create key. The key goes in `.env`. It stays out of chat and out of tracked files.

**Done when:** the project MCP file names the stitch server, and you can say whether `.env` has `STITCH_API_KEY` or the user still has to create it.

## Template

Create what is missing under `.stitch/`.

`metadata.json` when absent:

```json
{
  "projectId": "",
  "title": "",
  "screens": {}
}
```

Set `title` from the repo name. Set `projectId` only from a `stitch.withgoogle.com` URL or a project id already recorded in the repo. Leave `screens` empty. The next `get_project` call replaces this file with that payload. Leave screen ids and `designTheme` for that payload.

`DESIGN.md` is one file. Use an export that is already in the repo or already named in this conversation. That file is copied unchanged to `.stitch/DESIGN.md`. A root `DESIGN.md` is that file: symlink `.stitch/DESIGN.md` to `../DESIGN.md`. When no export is present, write `.stitch/DESIGN.md` as an Overview that names Google Stitch and says tokens are not set yet. No hex, typeface, or palette.

`SITE.md` when absent: the project name, a one-line mission from the README when it has one, an empty sitemap, and an empty roadmap.

`next-prompt.md` when absent:

```markdown
---
page:
---

Write the next UI task here before generating a screen. Include the design system block from DESIGN.md.
```

`designs/.gitkeep` when the directory is absent.

Leave the app's existing UI tree alone. `site/public/` appears later, and only for a repo with no app framework, when the pipeline runs.

**Done when:** those paths exist, and a stub `DESIGN.md` has no tokens you invented.

## How the first session fills tokens

Agent taste is one of these sentences.

- Tokens are already recorded: open briefs run `enhance-prompt`, then `stitch::generate-design`.
- This repo already has UI (a token file, or components) and `projectId` is empty: the first design session runs `stitch::extract-design-md` on the source, then `stitch::manage-design-system` to upload `.stitch/DESIGN.md`. Later briefs run `enhance-prompt`, then `stitch::generate-design`.
- `projectId` is set and `.stitch/DESIGN.md` is still a stub: the first design session runs `design-md` against that project. Later briefs run `enhance-prompt`, then `stitch::generate-design`.
- Neither: the first brief runs `taste-design` to write `.stitch/DESIGN.md`. The next brief runs `enhance-prompt`, then `stitch::generate-design`.

**Done when:** Agent taste is one of those sentences.

## Where code lands

Read `package.json` and the UI tree. Pipeline step 6 is one of these sentences.

- `react-native` or `expo`: implement with `stitch::react-native`.
- `react` (including Next): implement with `stitch::react-components`. When the repo already has another component system, implement there, and use the staged HTML as the reference.
- Vue, Svelte, or Angular: implement in that tree. The staged HTML is the reference.
- No app framework: the `stitch-loop` skill integrates pages into `site/public/`.

**Done when:** pipeline step 6 is one of those sentences.

## Write

Write the `## Design harness` block from step 4 of [SKILL.md](./SKILL.md).

Write `docs/agents/design-harness.md` from the text below. Fill every blank.

```markdown
# Design harness

Read this file before changing UI in this repo. A screen follows the stack below. An open brief spends freedom only on axes this file leaves open.

## Stack

- **Design tool.** Google Stitch (https://stitch.withgoogle.com).
- **Skills.** `google-labs-code/stitch-skills`: plugins `stitch-design`, `stitch-build`, and `stitch-utilities`.
- **MCP.** `https://stitch.googleapis.com/mcp`, header `X-Goog-Api-Key` from `STITCH_API_KEY`. The key stays in the environment.
- **What humans edit.** Screens in Stitch. When the system itself changes, edit `.stitch/DESIGN.md` and upload it with `stitch::manage-design-system`.
- **What agents read.** `.stitch/DESIGN.md`, `.stitch/SITE.md`, `.stitch/next-prompt.md`, and `.stitch/metadata.json`.
- **On conflict.** `.stitch/DESIGN.md` wins for code. Upload that file to Stitch before generating another screen.
- **Agent taste.** {{AGENT_TASTE}}
- **A design change produces.** A Stitch screen, then code in this repo.

## Identity

`.stitch/DESIGN.md` is the design system. {{TOKENS_STATUS}}
Stitch project id: {{PROJECT_ID_OR_NOT_CREATED}}.

## Pipeline

1. Read `.stitch/DESIGN.md` and `.stitch/SITE.md`.
2. Write the next roadmap task in `.stitch/next-prompt.md`. Include the design system block from `.stitch/DESIGN.md`. One screen. Name the device: `MOBILE`, `DESKTOP`, or `TABLET`.
3. Follow the Agent taste line for this brief.
4. Generate or edit the screen with Stitch MCP via `stitch::generate-design`. Save the `get_project` payload into `.stitch/metadata.json`. Stage `.stitch/designs/{page}.html` and `.stitch/designs/{page}.png`. Append `=w{width}` to the screenshot URL before downloading, using the screen's width.
5. When a new screen drifts from the system, run `stitch::manage-design-system`.
6. {{WHERE_CODE_LANDS}}
7. Add the page to the sitemap in `.stitch/SITE.md`. Write the next task into `.stitch/next-prompt.md`.

## Practices

- Name a color by role and character, then put the hex in parentheses.
- Describe shape and depth in physical language, and put the technical value in parentheses.
- Prompting guide: https://stitch.withgoogle.com/docs/learn/prompting/

## Until done

A UI change is done only when all four are true, from this session. A description of the screen does not count.

1. The visual decision is on disk: `.stitch/DESIGN.md`, or a named frame in Stitch, or the token file this harness names. A choice that exists only in chat is not a done target.
2. The screen uses that decision. New color and type come from it. An axis it leaves open is the only place a new choice is allowed.
3. Quality floor: usable at mobile width, keyboard focus is visible, and motion respects a reduced-motion setting.
4. The user has seen it: a screenshot, or the frame in the design tool. Quote where the decision lives and what the user saw.
```

`{{TOKENS_STATUS}}` is "Tokens are not set yet." or one line naming the export or the token file that already holds them.

**Done when:** the pointer exists, the blanks are filled, and **Until done** matches the block above.

## Done

Tell the user the harness is in this repo, that agents read `.stitch/DESIGN.md`, whether the skill install succeeded, whether `STITCH_API_KEY` is set, and that they reload the MCP client before the stitch tools appear. They can edit `docs/agents/design-harness.md`. Re-run to fill a missing piece.
