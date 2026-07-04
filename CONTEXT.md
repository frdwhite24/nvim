# Neovim Configuration

Personal Neovim setup for daily development. Lua-first, plugin-managed via lazy.nvim, targeting modern Neovim (currently 0.11.x).

## Language

**Core**:
The always-loaded baseline in `lua/core/` — options (`set.lua`), keymaps (`remap.lua`), and autocommands (`autocommands.lua`). Loaded directly from `init.lua` after lazy.nvim bootstraps.

**Plugin spec**:
A lazy.nvim plugin declaration in one of the `lua/plugins/*.lua` files. Specs declare dependencies, lazy-loading triggers, and config/opts.

**LSP stack**:
The language-server layer: Mason (installer) → mason-lspconfig (wiring) → lsp-zero (convenience wrapper) → nvim-lspconfig (server configs) → blink.cmp (completion). Extended by conform.nvim (formatting), inlay-hints.nvim, twoslash-queries.nvim, and venv-selector.nvim.

**Modernization track**:
The ongoing effort to align this config with the latest stable Neovim release, current plugin APIs, and community best practice — without breaking daily-driver workflows.

**Treesitter pin**:
Short-term decision to keep `nvim-treesitter` on the frozen `master` branch until a deliberate migration to `main` is planned. The `main` branch is a rewrite with a different API and fewer built-in features.

**Modernization cadence**:
Incremental, small, purposeful changes — one concern per step so the config stays usable as a daily driver. Work can be paused and resumed at any time. Each completed step is committed and pushed to remote before moving on. Run the QA plan in `docs/agents/qa-plan.md` before every commit.

**Configuration philosophy**:
Prefer vanilla plugin and Neovim defaults over custom hacks. If a setting matches the default, remove it. If a plugin provides a built-in way to do something (e.g. lualine's dynamic `color` function), use that instead of manual highlight manipulation. Less custom code means fewer API breakages on upgrade.

**Active languages**:
Day-to-day stack this config is trimmed to: TypeScript, Terraform, YAML, JSON, Lua, Svelte (occasional), Dockerfile, GraphQL, Markdown, Bash/shell, HTML, CSS. JavaScript/TSX parsers and tooling are kept as TypeScript ecosystem dependencies.

## Example dialogue

> **Dev**: Treesitter is erroring on startup — should we fix the LSP stack first?
>
> **Maintainer**: No — the **LSP stack** works independently. Treesitter lives in a **plugin spec** in `syntax.lua` and it's on the wrong API for the `main` branch. That's **Modernization track** priority one because it blocks `:checkhealth` and anything that depends on parsers.
>
> **Dev**: Where does lualine config live?
>
> **Maintainer**: In its own **plugin spec** at `lua/plugins/lualine.lua`.
