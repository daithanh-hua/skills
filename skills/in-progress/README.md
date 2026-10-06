# In Progress

Beta. These skills are public on purpose: try them and tell me what breaks. They're excluded from the plugin and the top-level README until they graduate to a stable bucket, they get no docs pages, and they can change or disappear without warning.

The plugin won't give you these. Install one directly:

```bash
npx skills@latest add mattpocock/skills --skill=<name>
```

- **[loop-me](./loop-me/SKILL.md)**: Grill yourself into implementable workflow specs over multiple sessions, using the current directory as a stateful workspace. User-invoked.
- **[writing-beats](./writing-beats/SKILL.md)**: Shape an article as a journey of beats, choose-your-own-adventure style. Pick a starting beat, write only that beat, then pivot to the next, until the article reaches a natural end.
- **[writing-fragments](./writing-fragments/SKILL.md)**: Grilling session that mines you for fragments (heterogeneous nuggets of writing) and appends them to a single document as raw material for a future article.
- **[writing-shape](./writing-shape/SKILL.md)**: Take a markdown file of raw material and shape it into an article paragraph by paragraph, arguing format choices at each step.
- **[claude-handoff](./claude-handoff/SKILL.md)**: Hand the current conversation off to a fresh background agent that picks up the work immediately, seeded with a handoff summary via `claude --bg`. User-invoked.
- **[setup-ts-deep-modules](./setup-ts-deep-modules/SKILL.md)**: Wire dependency-cruiser into a TypeScript repo so each package is a deep module: implementation hidden in subfolders, reachable only through its entry-point files, tests exercising it through those. User-invoked.
- **[coding-harness](./coding-harness/SKILL.md)**: Set up a project's coding harness: six blocks, git strategy, how a request enters, a plan gate before code, four gates that must be shown before a task is called done, lint when the repo has none, and a phase door for Plan, Design, Build & Test, Deploy, then Operate & Maintain. You keep the decision. The agent produces the artifact. User-invoked.
- **[plan](./plan/SKILL.md)**: Open on one request or one existing issue, then name the first undone step of the plan order. User-invoked.
- **[design](./design/SKILL.md)**: Name the first undone step of the design order. User-invoked.
- **[build](./build/SKILL.md)**: After an accepted issue, name the first undone step of the build order. User-invoked.
- **[deploy](./deploy/SKILL.md)**: Name the first undone step of the deploy order. User-invoked.
- **[operate](./operate/SKILL.md)**: Name the operate entry, or the first undone step after a build. User-invoked.
- **[design-harness](./design-harness/SKILL.md)**: Set up a project's frontend design stack. Google Stitch also installs its skills, MCP server, `.stitch` template, and the screen-to-code pipeline. User-invoked.
