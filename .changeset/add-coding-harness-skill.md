---
"mattpocock-skills": patch
---

Add the `coding-harness` skill (in-progress bucket, user-invoked). Install it like `setup-matt-pocock-skills`, open a project repo, and run it there. It explores that repo, then asks for the instructions file, validation command, working memory, GitHub flow or Gitflow, where a request starts, and whether the agent starts with `grill-with-docs`. The instructions pointer says a task is done only when **Until done** in `docs/agents/harness.md` is met. That block is the only copy of the four gates, and a shortened copy is restored from the template. The default entry is one sentence. A later run, once sections 1–8 and **Until done** are present, rescores the session instead of asking again. It refuses to run in the skills library that ships it.
