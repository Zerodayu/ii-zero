# Bun Package Management

## Install Dependencies

```
bun install
```

## Add Dependencies

```
bun add <package>
```

## Remove Dependencies

```
bun remove <package>
```

## Run Scripts

```
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

Never generate commands containing (unless there's truly no choice):

```
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
