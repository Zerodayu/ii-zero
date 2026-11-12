# Global Instructions

Development happens on an Arch-based Linux environment (CachyOS) using Neovim (LazyVim). This project uses Bun exclusively — runtime and package manager. Language: TypeScript.

## Always-on rules

- Runtime & package manager: **Bun only**. Never generate `npm`, `npx`, `node`, `yarn`, or `pnpm` commands unless there is truly no Bun equivalent.
- Prefer Bun-native APIs and modern TypeScript syntax.
- Assume a Linux shell (Arch/CachyOS) for all commands and examples.
- Never run `git commit` or `git push` without first loading the `commit-messages` skill, showing the per-step table, and getting explicit approval.
- Commit scope: one commit per distinct task or change — never merge unrelated tasks into a single commit. If a session completed multiple unrelated tasks, propose separate commits, one per task, even when the same files were touched.

## Skills — mandatory pre-check

**Before your first tool call in a task, decide if a skill matches. If yes, load it first — never do the work, then load the skill.**

- editing any file (code, config, docs) → `coding-comments`
- any dependency, workspace, `bun run`, or script command → `package-management`
- any changelog / release-notes file → `changelogs-rules`
- any commit suggestion, `git commit`, or `git push` → `commit-messages`
- any one-time output before writing a file → `output-files`

A skill you have not loaded is a skill you are not following.
