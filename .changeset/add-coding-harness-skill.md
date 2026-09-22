---
"mattpocock-skills": patch
---

Add the `coding-harness` skill (in-progress bucket, user-invoked). Install it like `setup-matt-pocock-skills`, open a project repo, and run it there. It explores that repo, then asks for the instructions file, validation command, working memory, GitHub flow or Gitflow, where a request starts, and whether the agent starts with `grill-with-docs`. The instructions pointer names the four gates a task must show before it is called done: the request on disk, a test that went red then green, Standards and Spec from `code-review`, and the validation command run in that session. The same gates are copied unchanged into `docs/agents/harness.md`. A later run asks only the sections the doc is missing, and restores the gates if they were shortened. It refuses to run in the skills library that ships it.
