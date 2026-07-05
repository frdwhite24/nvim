# Neovim Configuration

Personal Neovim setup for daily development. Lua-first, plugin-managed via lazy.nvim, targeting modern Neovim (currently 0.12.x).

## Language

**Core**:
The always-loaded baseline in `lua/core/` — options (`set.lua`), keymaps (`keymaps/`), and autocommands (`autocommands.lua`). Editor-wide behaviour only; no cross-plugin orchestration. Loaded from `init.lua` after lazy.nvim bootstraps.

**Stack module**:
A directory under `lua/` that wires a concern spanning multiple plugins — e.g. `lua/lsp/` or `lua/treesitter/`. Holds setup, keymaps, and overrides for that stack. Plugin specs in `lua/plugins/` delegate to stack modules via `require()`.

**Plugin spec**:
A lazy.nvim plugin declaration in one of the `lua/plugins/*.lua` files. Specs declare dependencies, lazy-loading triggers, and minimal config that delegates to stack modules where applicable.

**Find hub**:
The plugin layer for project-wide discovery — files, text search, git history, diagnostics lists, keymaps. Distinct from in-buffer navigation (flash) and directory browsing (oil). Stays on telescope.nvim; no picker migration planned.

**Symbol outline**:
File-structure sidebar for skimming and jumping within a buffer. Implemented via aerial.nvim; toggle with `<Leader>a`.

**LSP stack**:
The language-server layer: Mason (installer) → mason-lspconfig (`ensure_installed` + `automatic_enable`) → nvim-lspconfig (server definition catalog) → `lua/lsp/` (`vim.lsp.config` overrides, diagnostic signs, global and buffer keymaps, `LspAttach`) → blink.cmp (completion). Buffer LSP navigation (`gd`, `gr`, `gi`, `gD`) uses telescope pickers — peek-style plugins (e.g. glance) not planned. Extended by conform.nvim (formatting) and twoslash-queries.nvim.

**Treesitter stack**:
Parser and query management via nvim-treesitter `main` → `lua/treesitter/` (`install` bootstrap, `FileType` → `vim.treesitter.start`). Requires `tree-sitter-cli` in PATH. Extended by nvim-ts-autotag, nvim-ts-context-commentstring, and render-markdown.nvim.

**Modernization cadence**:
Incremental, small, purposeful changes — one concern per step so the config stays usable as a daily driver. Work can be paused and resumed at any time. Each completed step is committed and pushed to remote before moving on. Run the QA plan in `docs/agents/qa-plan.md` before every commit.

**Configuration philosophy**:
Prefer vanilla plugin and Neovim defaults over custom hacks. If a setting matches the default, remove it. If a plugin provides a built-in way to do something (e.g. lualine's dynamic `color` function), use that instead of manual highlight manipulation. Less custom code means fewer API breakages on upgrade.

**Active languages**:
Day-to-day stack this config is trimmed to: TypeScript, Terraform, YAML, JSON, Lua, Svelte (occasional), Dockerfile, GraphQL, Markdown, Bash/shell, HTML, CSS. JavaScript/TSX parsers and tooling are kept as TypeScript ecosystem dependencies.

## Example dialogue

> **Dev**: Where do global LSP keymaps live?
>
> **Maintainer**: In the **LSP stack** module — `lua/lsp/keymaps.lua`. Buffer-local LSP keys are in `lua/lsp/on_attach.lua`. **Core** keymaps are editor-wide only.
>
> **Dev**: Treesitter is erroring on startup — should we fix the LSP stack first?
>
> **Maintainer**: No — stacks are independent. Treesitter delegates to `lua/treesitter/`. Check `:checkhealth nvim-treesitter` and that `tree-sitter-cli` is in PATH.
>
> **Dev**: Where does lualine config live?
>
> **Maintainer**: In its own **plugin spec** at `lua/plugins/lualine.lua`.
