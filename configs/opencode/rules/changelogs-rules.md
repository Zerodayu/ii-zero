# Changelog Entries

Write changelog entries in this fixed shape when writing or updating a
changelog / release-notes file.

## Format

```markdown
v1.2.0 - Dark mode release
Adds a dark theme across the app.

## FEATURES / WHATS NEW
- dark theme toggle
- follows system preference

## FIXES
- login redirect loop

## CHANGES
- theme colors moved to tokens
- reduced bundle size
---
Released 2026-10-02. Thanks to @contributor.
```

## Structure

- **Title line**: `version - short title` — e.g. `v1.2.0 - Dark mode release`.
- **Short desc**: one line right under the title summarizing the release.
- **Sections**: `##` h2 headers, in this order when present:
  - `## features / whats new`
  - `## fixes`
  - `## changes`
- **Entries**: markdown bullets (`-`) under each section.
- **Footer**: free text after a `---` separator.

## Entry rules

- Each entry is a **markdown bullet on one line** — `- entry text`.
- **One line maximum**: a single short sentence at most, or just words.
- No wrapped continuation lines, no prose paragraphs, no blockquotes.
- Plain wording: `- add fuzzy finder to config`, not a paragraph explaining
  what the config is.
- One entry per change — don't merge unrelated changes into one line.

## Sections

- **Omit empty sections** — emit `## fixes` only when it has at least one entry.
- **Ask or add a section if needed**: if an item doesn't fit `features / whats
  new`, `fixes`, or `changes`, ask the user which heading to use or add a new
  `## section` line. Never force an item into a section that doesn't describe it.

## Latest-only file

- The changelog file holds **only the latest entry** — no accumulated history.
- When the user asks to update the changelog, **replace ALL contents** of the
  file with the new entry (full rewrite) — never append below the old one.
- Older versions stay reachable through git history — don't copy them into the
  file or an archive.

## Short title & footer

Don't invent the short title or the footer silently — **ask the user what to
put there**, offering a recommendation:

- **Short title** (after `version -`): recommend one short phrase naming the
  release's main change, picked from the biggest feature or fix
  (e.g. `Dark mode release`).
- **Footer** (after `---`): recommend `Released YYYY-MM-DD. Thanks to
  @contributor.` — date plus credits — or a compare/tag link when the repo
  has one. If the user has nothing to add, fall back to the date only.

## Examples

Good:

```markdown
v0.4.0 - Search overhaul
Faster, fuzzy search across the app.

## features / whats new
- fuzzy finder
- search recent files

## changes
- index built in background
---
2026-10-02
```

Avoid:

```markdown
v0.4.0 - Search overhaul

## fixes

## features / whats new
- This release adds a fuzzy finder which lets you quickly jump      <- wraps,
  between files by typing part of their name, and it works with     multi-line
  the recent files list as well.                                    <- prose

## changes
> index built in background                                         <- blockquote,
                                                                     not a bullet
```
