---
"mattpocock-skills": patch
---

`coding-harness` now links every skill the phase map names into the open project's `.cursor/skills` when that skill is missing. It looks in this library, then `~/.agents/skills` and `~/.claude/skills`. A real directory already there stays. A name with no source is reported and left unlinked.
