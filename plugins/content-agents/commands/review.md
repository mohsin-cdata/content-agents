---
description: Run an exec-style pre-review on a content draft (pasted text or a file path)
argument-hint: "[file path or pasted draft] [optional: content type, audience, goal]"
---

Use the `exec-reviewer` skill to review the draft below.

Input: $ARGUMENTS

If the input is a file path, read the file. If it's empty, ask the user to paste the draft or give a path. Follow the skill's steps exactly, including loading the full constitution first and logging the run if the workspace is connected.
