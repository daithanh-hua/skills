---
"mattpocock-skills": patch
---

`coding-harness` asks to set up lint when the open repo has no linter running, writes the language default (ESLint, Ruff, Clippy, or `go vet`), and records that command. When the validation command is missing, the lint command becomes it.
