# LSP stack baseline

Parity reference for the native LSP migration (completed). Use when changing servers or attach behaviour.

## Servers (Mason ensure_installed)

terraformls, vtsls, eslint, svelte, lua_ls, cssls, html, jsonls, bashls, yamlls

## Buffer keymaps (on LSP attach)

| Key | Action |
|-----|--------|
| `K` | Hover |
| `gs` | Signature help |
| `gd` | Telescope definitions |
| `gD` | Telescope type definitions |
| `gr` | Telescope references |
| `gi` | Telescope implementations |
| `gl` | Diagnostic float (line) |
| `<Leader>ca` | Code action |
| `<F2>` | Rename |
| `<F3>` | Format (n/x) |

Global LSP/diagnostic keymaps live in `lua/lsp/keymaps.lua` (`<C-p>`/`<C-n>`, `<Leader>lr`).

## Server-specific

| Server | Extra |
|--------|-------|
| terraformls | Codelens refresh autocmd (0.11 fix) |
| vtsls, svelte | twoslash-queries attach |
| lua_ls | Neovim runtime workspace (`lua/lsp/servers.lua`) |

## Diagnostics gutter icons

error ``, warn `` hint `` info ``

## Completion

blink.cmp sets `vim.lsp.config('*').capabilities` on 0.11.
