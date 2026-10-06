---
"mattpocock-skills": patch
---

Each phase door now names the first undone step of a fixed order, the same way `/plan` already did. Design, build, deploy, and operate stop picking one skill from a grab bag. Skills that were only "outside" sit in the phase their output feeds, and a step runs only when its skip is false. Invariant 5 in `GUARDRAILS.md` records that move.
