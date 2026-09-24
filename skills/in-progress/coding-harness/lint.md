# Lint setup

Read this only when the open repo has no linter already running. A running linter is a config plus a script, task, or CI step that invokes it. Prettier and other formatters are not linters.

Two branches:

- **Config exists, nothing runs it.** Add the command below for that tool. Leave the config as it is.
- **No config.** Write the default below, then add the command.

One language, the first match. Ask the user for a command when nothing matches. Record that command as `{{LINT}}`.

Detect the package manager from the lockfile: `package-lock.json` is npm, `pnpm-lock.yaml` is pnpm, `yarn.lock` is yarn, `bun.lock` or `bun.lockb` is bun. Default to npm.

## JavaScript or TypeScript

Signal: `package.json`.

Command: `<pm> run lint`, with `"lint": "eslint ."` in `package.json`.

Default config is `eslint.config.js`. Install `eslint` and `@eslint/js` as dev dependencies. When `tsconfig.json` or a `typescript` dependency is present, also install `typescript-eslint` and use the TypeScript config.

JavaScript:

```js
import js from "@eslint/js";

export default [
  js.configs.recommended,
  { ignores: ["dist/**", "node_modules/**"] },
];
```

TypeScript:

```js
import js from "@eslint/js";
import tseslint from "typescript-eslint";

export default tseslint.config(
  js.configs.recommended,
  tseslint.configs.recommended,
  { ignores: ["dist/**", "node_modules/**"] },
);
```

An existing `biome.json` is the config branch. Its command is `<pm> exec biome lint .`

## Python

Signal: `pyproject.toml`, `requirements.txt`, or `setup.py`.

Command: `ruff check .`

Install ruff with the tool the repo already uses: `uv add --dev ruff`, `poetry add --group dev ruff`, or `pip install ruff`. Append this to `pyproject.toml`, creating the file when it is absent:

```toml
[tool.ruff.lint]
select = ["E", "F"]
```

## Rust

Signal: `Cargo.toml`.

Command: `cargo clippy --all-targets -- -D warnings`

Clippy ships with the toolchain. Run `rustup component add clippy` when the component is missing. No new config file.

## Go

Signal: `go.mod`.

Command: `go vet ./...`

No new config file.
