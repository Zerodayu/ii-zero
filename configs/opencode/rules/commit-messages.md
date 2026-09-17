# Commit Message Suggestions

Suggest a commit message at the END OF EACH STEP — not once per task or session.

- After every completed step (each distinct change: a feature added, a file edited,
  a bug fixed, a refactor), immediately output ONE suggestion table covering only
  the files that step changed.
- If a task spans multiple steps, output one table per step. Never collapse them
  into a single table at the end.
- Prefix the message with one of: `update:`, `new:`, `add:`, `feat:`, `fix:`,
  `refactor:` — pick the one that best fits that step.
  - `feat:` — new feature or functionality
  - `fix:` — bug fix or error correction
  - `update:` — modifying existing code, config, or dependencies
  - `new:` — adding new files or resources
  - `add:` — adding content to existing files (docs, tests, comments)
  - `refactor:` — restructuring code without changing behavior
- Keep the summary short and imperative (e.g. `feat: add fuzzy finder to config`).
- "Files to add" lists only the file paths changed in that step (no `git add` prefix).
  When a message covers several files, repeat the message on one row per file so the
  table stays valid.
- Do not run `git commit`. Ask the user whether they want to commit themselves
  or have you run it.
- Keep each commit scoped to a single step's changes — don't bundle multiple
  unrelated steps (e.g. a feature plus an unrelated fix) into one commit. Small,
  single-purpose commits are easier to review and revert than one large commit
  covering several steps.

| Commit message | Files to add                 |
| -------------- | ----------------------------- |
| `update: ...`  | `configs/opencode/AGENTS.md` |
| `feat: ...`    | `src/foo.ts`                 |
