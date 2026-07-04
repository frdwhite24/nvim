# QA Plan (Modernization Track)

Run after every incremental change, before commit. Automated steps are run by the agent; manual steps are yours (~2 min).

## Automated (agent)

1. **Clean startup** — `nvim --headless "+messages" "+qa" 2>&1` → no `Error` lines
2. **Plugin health** — `nvim --headless "+checkhealth lazy nvim-treesitter lsp" "+qa" 2>&1` → no errors
3. **Changed files parse** — `luac -p` on every modified `.lua` file
4. **Scope check** — `git diff --stat` matches the intended single concern

## Manual (you, when the change touches that area)

Only run items relevant to what changed:

| Area changed | Quick check |
|--------------|-------------|
| Core keymaps / options | Open any file; exercise the affected keys |
| LSP / completion | Open a `.lua` or `.ts` file; confirm diagnostics, `gd`, blink menu on `<C-Space>` |
| Treesitter / syntax | Open `.lua`, `.tsx`; confirm highlighting looks normal |
| Formatting | `:w` on a JS/TS/Python file; confirm formatter runs |
| UI / statusline | Glance at lualine, bufferline, oil (`<Leader>e`) |
| Git plugins | Open a git repo file; confirm gitsigns gutter |

If nothing in the change touches a row, skip it.

## Automated testing (optional, not in use yet)

Neovim configs *can* be tested — plugin authors use [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) test harness, [MiniTest](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-test.md), or headless CI scripts. For a personal daily-driver config, headless smoke checks (above) are the usual balance. A Makefile target can wrap steps 1–3 if we want one-liner QA later.
