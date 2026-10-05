---
name: plan
description: "Pick one planning skill from the context you pass in."
argument-hint: "A ticket, a list of tickets, an idea, a screen, or another application"
disable-model-invocation: true
---

# Plan

You decide the constraints and the scope. The agent drafts the spec, the tickets, and the edge cases.

The context is what the user passed with this skill: a sentence, a ticket, a list of tickets, a path, a screen, or another application. Read it. When they passed nothing, ask once what it is.

Pick the first match. One line. Name that line in one sentence.

A line that says to call the Skill tool: call it with the context. A line that says the user runs a skill: tell them that one name and stop. The user types a user-invoked skill. This door does not start it.

1. The context is a ticket or a list of tickets already written: tell the user to run `build`.
2. The context is a screen or another application, and the question is how it should look or behave: tell the user to run `design`.
3. There is no working directory: tell the user to run `grill-me`.
4. The context is a recurring loop in the user's life or work: tell the user to run `loop-me`.
5. The way to the destination is not visible, or the effort is bigger than one session: tell the user to run `wayfinder`.
6. A person other than the user holds the answer: tell the user to run `to-questionnaire`.
7. The context is source material to read, and the user is not the one who must decide: call the Skill tool with `research`.
8. The context is a discussion already settled, and they want it written down: tell the user to run `to-spec`.
9. They asked for the interview with no wrapper: call the Skill tool with `grilling`.
10. Otherwise, in a repo: tell the user to run `grill-with-docs`.

**Done when:** one line was picked. Every Skill tool call on that line was made. Every skill that line says the user runs was named to them.
