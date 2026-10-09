# Global Instructions

Development happens on an Arch-based Linux environment (CachyOS) using Neovim (LazyVim). This project uses Bun exclusively — runtime and package manager. Language: TypeScript.

## Always-on rules

- Runtime & package manager: **Bun only**. Never generate `npm`, `npx`, `node`, `yarn`, or `pnpm` commands unless there is truly no Bun equivalent.
- Prefer Bun-native APIs and modern TypeScript syntax.
- Assume a Linux shell (Arch/CachyOS) for all commands and examples.

## Skills

Conditional rules live as skills (`skills/*.md`) and are advertised by
description — load them with the `skill` tool when the task matches:
`output-files`, `package-management`, `commit-messages`, `changelogs-rules`,
`coding-comments`.
