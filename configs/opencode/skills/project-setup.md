---
name: Project Setup
description: Keep a project's docs and rules current — AGENTS.md, SYSTEM-DESIGN.md, ROADMAP.md and `.agents/skills` — capturing durable rules where they belong and keeping every file in sync. Load when a repo has no AGENTS.md, when docs are missing or stale, when you learn a lasting rule or command, when structure or scope changes, before committing such changes, or when asked to set up, sync or audit the docs.
---

# Project Setup

Scope: always the **current project's root**. Never write into the OpenCode
config directory.

## Triggers

Do not wait to be asked. Load this skill when any of these happens.

| Event | Action |
| --- | --- |
| Repo has no `AGENTS.md` and the work is not a throwaway | Offer setup once: "want me to set up `AGENTS.md`, `SYSTEM-DESIGN.md` and `ROADMAP.md`?" Never create silently. |
| `AGENTS.md` exists but a sibling doc or a listed skill is missing | Fill the gap, then report it. |
| You learned something durable: a command, a path convention, "from now on always X", an architectural boundary, a service limit | Record it in its owner in the same turn. Chat is not storage. |
| A change altered commands, layout, dependencies, data flow or boundaries | Update the owning file before finishing. |
| A ROADMAP item shipped or scope moved | Move it to `## Done` with a date, re-bucket the rest. |
| About to commit, and the diff touched structure, commands or tooling | Run the sync check first. |
| Explicit: "set up", "sync the docs", "audit", `@project-setup` | Full check. |

Prefer recording over asking when the fact is unambiguous. Ask when the action
would delete or rewrite content someone wrote.

## 1. Read first

- Inspect the repo: `package.json`, `bun.lock`, `justfile`, `README.md`,
  top-level dirs, existing docs.
- Derive the layout tree from the real directories (`ls`, `find`), never invent
  folders. A tree that does not match the repo is worse than none.
- Empty directory: ask only what the repo cannot answer — what it does,
  runtime/stack, install/dev/test commands. Four questions, no more.
- Never overwrite. Show existing content and ask merge or replace.
- Preserve managed blocks (`<!-- BEGIN:turborepo-agent-rules -->` and similar).
  Append around them, never inside, never delete them.
- Headings are fixed: same names, same order, nothing added, renamed or
  removed. New content goes under the closest existing heading.

## 2. Ownership map — one home per rule

| Content | Owner |
| --- | --- |
| When to load what, doc links, project one-liner | `AGENTS.md` |
| Commands | `.agents/skills/<project>-commands/SKILL.md` |
| Always-on one-line rules | `.agents/skills/<project>-rules/SKILL.md` |
| Directory tree, folder layout | `SYSTEM-DESIGN.md` → `## Structure` |
| Rules with steps, examples or narrow scope | `.agents/skills/<project>-<area>/SKILL.md` |
| Architecture, components, data flow, boundaries, decisions | `SYSTEM-DESIGN.md` |
| Hard system limits ("max 2 concurrent jobs") | `SYSTEM-DESIGN.md` → `## Constraints` |
| Work state, priorities, shipped items | `ROADMAP.md` |

`AGENTS.md` is the only file allowed to repeat anything, and only as pointer
lines — never rule text.

Rule boundary, hard threshold:

- one line, no example, applies every edit → `<project>-rules`
- needs steps or an example, or applies only sometimes → `<project>-<area>`
- ambiguous → `<project>-rules` (it loads on every code edit)

`SYSTEM-DESIGN.md` `## Constraints` holds facts ("rate limit is 60/min").
`<project>-rules` holds instructions ("always batch requests"). That split is
the only thing keeping the two apart.

## 3. Write

Copy each template below verbatim, then fill from repo evidence. Unknowns stay
`TODO:` — never invent commands, paths or services.

Files, all at the project root:

- `AGENTS.md` — index only: one-liner, load table, doc links, skill list.
- `SYSTEM-DESIGN.md`
- `ROADMAP.md`
- `.agents/skills/<project>-<id>/SKILL.md` — one directory per skill, prefixed
  with the project name.

`<project>` is the kebab-case package name from `package.json`, else the
directory name. Keep every id `<project>-<area>` so installed skills never
collide and every agent sees whose rules these are. No grouping directories: a
folder containing `SKILL.md` is a leaf, nothing inside it is discovered.

No harness config file. `.agents/skills` is read without registration.

## 4. Move, never copy

When a rule sits in the wrong file:

1. Delete it there.
2. Write it once in its owner.
3. Leave a link only if the old file still needs a signpost — never restate.
4. Report it: `moved: <rule> — <from> → <to>`.

Duplicates: keep the owner's copy, delete the others. If ownership is genuinely
unclear, leave both and list it under `Unresolved`. Never silently delete
content you did not author.

## 5. Sync — MUST

`AGENTS.md`, `SYSTEM-DESIGN.md`, `ROADMAP.md` and the project skills are one
system. On every run — create, edit or audit — you MUST verify:

- [ ] No rule, command, path or constraint appears in more than one file.
- [ ] Every rule is in its owner per the ownership map; wrong-place rules are
      moved, not copied.
- [ ] Every skill is listed under `## Skills` and has a row in
      `## Load before acting` in `AGENTS.md`.
- [ ] Every directory in `SYSTEM-DESIGN.md` `## Structure` exists, and every
      top-level source folder appears in it.
- [ ] Every ROADMAP item that changes structure has a matching entry in
      `SYSTEM-DESIGN.md`; every shipped decision is in ROADMAP `## Done` with
      a date.
- [ ] Component, folder and command names are spelled identically everywhere.
- [ ] Headings unchanged: fixed H2s, fixed order.

Conflicts resolve by owner: commands and rules → the skill files, structure →
`SYSTEM-DESIGN.md`, status → `ROADMAP.md`. Fix the loser.

Run this same check on a freshly created set before reporting. It is part of
the create flow, not an optional follow-up.

## 6. Portability

Everything written here is plain Markdown at the project root, so a fork picks
it up unchanged:

- `AGENTS.md` is the instruction file read by OpenCode, Codex and other
  harnesses.
- `SYSTEM-DESIGN.md` and `ROADMAP.md` are reached through the pointer in
  `AGENTS.md`, so no harness config is needed.
- `.agents/skills/<project>-<id>/SKILL.md` is the cross-tool skill convention:
  one level deep, prefixed id, no grouping directories.
- Never add `opencode.jsonc`, `.cursor/rules` or similar just to register
  these files — that breaks the fork.

## 7. Report

`Created`, `Moved`, `Deduped`, `Conflicts`, `Unresolved`, and remaining
`TODO:` items. Nothing else.

## Templates

### AGENTS.md

```md
# <Project Name>

<One line: what it is, who it is for.>

> Index only. Rules and commands live in `.agents/skills/`. Load them before acting.

## Load before acting

| When | Load |
| --- | --- |
| Running any command | `<project>-commands` |
| Writing or editing code | `<project>-rules` |
| TODO: <area-specific work> | `<project>-<area>` |

## Docs

- `SYSTEM-DESIGN.md` — read before changing architecture; update when structure changes.
- `ROADMAP.md` — update when scope or priorities change.

## Skills

- `.agents/skills/<project>-commands/SKILL.md` — project commands.
- `.agents/skills/<project>-rules/SKILL.md` — always-on coding rules.
```

### SYSTEM-DESIGN.md

````md
# System Design — <Project>

> Architecture reference. Update when structure, boundaries or decisions change.

## Purpose

<Problem it solves, for whom.>

## Scope

**In:** TODO
**Out:** TODO

## Architecture

<Small text or mermaid diagram of the pieces and how they talk.>

## Structure

```text
src/
├── features/<name>/   # one folder per feature
│   ├── ui/
│   ├── api/
│   └── model/
├── lib/               # shared code
└── app/               # entry points, routes
```

<One line per top-level folder saying what belongs there.>

## Components

| Component | Path | Responsibility |
| --- | --- | --- |
| TODO | `<path>` | TODO |

## Data Flow

<Request/event path, what is persisted where.>

## Data Model

<Main entities and relations, or a link to the schema.>

## External Services

| Service | Used for | Config |
| --- | --- | --- |
| TODO | TODO | TODO |

## Constraints

- TODO

## Decisions

| Date | Decision | Why |
| --- | --- | --- |
| YYYY-MM-DD | TODO | TODO |

## Open Questions

- [ ] TODO
````

### ROADMAP.md

```md
# Roadmap — <Project>

> Work status. Update when scope or priorities change.

## Now

- [ ] TODO

## Next

- [ ] TODO

## Later

- [ ] TODO

## Done

- [x] TODO — YYYY-MM-DD

## Open Questions

- [ ] TODO
```

`Now` is being built, `Next` is agreed, `Later` is an idea, `Done` is shipped
with a date. Max five items per bucket, overflow moves down.

### <project>-commands/SKILL.md

```md
---
name: <Project> Commands
description: Exact commands for <Project> — install, dev, test, typecheck, lint. Load before running any command in this repo.
---

# Commands — MUST

Use these exact commands. Never guess, substitute or invent flags.

| Task | Command |
| --- | --- |
| Install | `bun install` |
| Dev | `bun run dev` |
| Test | `bun test` |
| Typecheck | `bun run typecheck` |
| Lint | `bun run lint` |

- MUST run test before reporting logic changes as done.
- MUST run typecheck before reporting done.
```

### <project>-rules/SKILL.md

````md
---
name: <Project> Rules
description: Always-on coding rules for <Project> — file layout, UI components, imports, error handling. Load before writing or editing any code.
---

# Rules — MUST

Every rule is mandatory unless the user explicitly overrides it.

## Placement

Follow `SYSTEM-DESIGN.md` → `## Structure` before adding files or folders.
Do not invent top-level folders.

- MUST NOT import across features except through their `index.ts`.
- MUST keep shared code in the shared folder named in `## Structure`.

## UI

- TODO

## Before finishing

- Re-read this file and confirm each rule was followed.
````

Add one `<project>-<area>/SKILL.md` per extra concern the project needs
(`testing`, `deploy`). Do not cram everything into `-rules`.
