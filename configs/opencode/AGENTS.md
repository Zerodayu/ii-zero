# Bun Project Instructions

This project uses Bun exclusively for both the runtime and package management. Development is performed on an Arch-based Linux environment (Omarchy) using Neovim (LazyVim).

## Environment

- Runtime: Bun
- Package Manager: Bun
- Operating System: Arch Linux
- Editor: Neovim (LazyVim)
- Language: TypeScript

## Package Management

Use Bun for all package and workspace operations.

### Install Dependencies

```bash
bun install
```

### Add Dependencies

```bash
bun add <package>
```

### Remove Dependencies

```bash
bun remove <package>
```

### Run Scripts

```bash
bun run <script>
```

## Runtime Requirements

- Always assume Bun is available.
- Generate code that is compatible with the Bun runtime.
- Prefer Bun-native APIs and features when appropriate.
- Use modern TypeScript patterns and syntax.

## Forbidden Tools

Do not use or recommend:

- Node.js
- npm
- Yarn
- pnpm

Never generate commands containing (unless no choice):

```bash
npm
npx
node
yarn
pnpm
```

## Development Guidelines

- Use Bun workspaces for monorepo package management.
- When referencing scripts from `package.json`, execute them with `bun run`.
- Prefer Bun-native tooling over Node.js-specific alternatives.
- Assume a Linux shell environment for commands and examples.

## Agent Instructions

When generating code, documentation, or terminal commands:

- Always use Bun commands.
- Never substitute Bun commands with npm, pnpm, Yarn, or Node.js equivalents (unless no choice).
- Treat Bun as the project's canonical runtime and package manager.
- Optimize examples for Arch Linux and Neovim-based workflows.

## Commit Message Suggestions

At the end of every completed step, suggest a commit message in a table — never commit on your own.

- Prefix the suggestion with one of: `update:`, `new:`, `add:`, `feat:`, `fix:`, `refactor:` and pick the one that best fits the change.
- Keep the summary short and imperative (e.g. `feat: add fuzzy finder to config`).
- Do not run `git commit`. Ask the user whether they want to commit themselves or have you run it.
- Show the suggestion once, at the end of the step, so it does not overwhelm.

| Commit message | Files to add |
| -------------- | ------------ |
| `update: ...`  | `configs/opencode/AGENTS.md` |

```
