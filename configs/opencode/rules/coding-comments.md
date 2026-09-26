# Coding Comments (todo-comments)

Write comments so they show up in Neovim's todo-comments.nvim picker
(`:TodoTelescope` / `:TodoQuickFix`), while keeping them short and plain.

## Keyword

Start comment lines with one of these so they get highlighted and searchable:

- `TODO:` — work not done yet
- `FIXME:` — known broken or incomplete code
- `NOTE:` — worth knowing context
- `HACK:` — temporary workaround
- `WARN:` — risky / footgun
- `PERF:` — performance concern
- `TEST:` — needs test coverage

Format: `// TODO: short imperative line` (same shape for `/* */`, `#`, `--`, ...)

## Style

- **Always comment the relevant areas that need it.** When you write or touch
  code, look for the spots that need a comment and add one — don't skip them.
- Relevant areas: non-obvious logic, decisions and their reasons, edge cases,
  workarounds, unfinished or known-issue spots, and anything a reader would
  have to reverse-engineer.
- Keep comments straightforward: one line, plain words, no prose.
- Say what or why, not a translation of the code.
- Don't pad obvious lines or add a comment to every block just to hit a quota.
- No narration ("now we loop over items"), no filler headers on tiny functions.

## Examples

```ts
// TODO: handle empty array before merge
// FIXME: retries leak the client on timeout
/* NOTE: cache is per-request, not global */
```

Avoid:

```ts
// loop over items          <- says nothing beyond the code
// TODO                      <- no text after the keyword
```
