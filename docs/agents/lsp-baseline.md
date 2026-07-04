# LSP stack baseline (pre-migration)

Recorded before removing lsp-zero. Use for parity checks during migration.

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
| `<F4>` | Code action (lsp-zero default; x mode) |

Global (not LSP attach): `<C-p>` / `<C-n>` diagnostics, `<Leader>lr` LspRestart

## Server-specific

| Server | Extra |
|--------|-------|
| terraformls | Codelens refresh autocmd (0.11 fix) |
| vtsls, svelte | twoslash-queries attach |
| lua_ls | Neovim runtime workspace (lsp-zero `nvim_lua_ls`) |

## Diagnostics gutter icons

error ``, warn `` hint `` info ``

## Completion

blink.cmp sets `vim.lsp.config('*').capabilities` on 0.11 (no lsp-zero cmp needed).
