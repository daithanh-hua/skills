# Rescore

The question list for this run is already answered. This step checks the doc against the repo and the session.

1. **Context rot.** For each line that names a path or command, look it up. Rewrite a line that no longer matches. A user choice just confirmed in the question list stays. When the file or branch it names is gone, the shown answer for that section was already wrong: fix the line from what you found.
2. **Lossy compaction.** Open the working memory file. Where a requirement survives only as a summary, write the original wording back when this session still has it. When it does not, name that line to the user.
3. **Stateless session.** Write any decision from this session that must survive compaction into the working memory file, verbatim.

**Done when:** each of the three is pass, or names the line you changed. You asked again only where a user choice became impossible.
