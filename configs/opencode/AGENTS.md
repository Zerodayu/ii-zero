# Global Instructions

Development happens on an Arch-based Linux environment (CachyOS) using Neovim (LazyVim). This project uses Bun exclusively — runtime and package manager. Language: TypeScript.

## Always-on rules

- Runtime & package manager: **Bun only**. Never generate `npm`, `npx`, `node`, `yarn`, or `pnpm` commands unless there is truly no Bun equivalent.
- Prefer Bun-native APIs and modern TypeScript syntax.
- Assume a Linux shell (Arch/CachyOS) for all commands and examples.

## Pacakage Management Rules

- `rules/package-management.md` — Bun install/add/remove/run commands, full forbidden-tools list, dev guidelines. Load when the task involves dependencies, workspaces, or running scripts.

## Commit messages Rules

- `rules/commit-messages.md` — commit message suggestion format/table. Load when you're about to suggest a commit at the end of a step.
