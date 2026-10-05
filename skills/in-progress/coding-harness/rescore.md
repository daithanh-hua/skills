# Rescore

The harness doc already has sections 1–8, **Until done** still has four gates, and `docs/agents/phases.md` matches [phases.md](./phases.md). Leave the setup steps in [SKILL.md](./SKILL.md). This run checks the doc against the repo and the session.

1. **Context rot.** For each line that names a path or command, look it up. Rewrite a line that no longer matches. A user choice (instructions file, git strategy, where a request starts, default entry) stays while that choice is still possible. When the file or branch it names is gone, ask that one section again.
2. **Lossy compaction.** Open the working memory file. Where a requirement survives only as a summary, write the original wording back when this session still has it. When it does not, name that line to the user.
3. **Stateless session.** Write any decision from this session that must survive compaction into the working memory file, verbatim.

**Done when:** each of the three is pass, or names the line you changed. You asked again only where a user choice became impossible.
