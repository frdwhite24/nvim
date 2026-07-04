# Neovim configuration

Personal Neovim setup — Lua, [lazy.nvim](https://github.com/folke/lazy.nvim), targeting **Neovim 0.11+** on macOS.

## Install

```bash
# Back up any existing config first
mv ~/.config/nvim ~/.config/nvim.bak

git clone git@github.com:frdwhite24/nvim.git ~/.config/nvim
```

Install Neovim (Homebrew):

```bash
brew install neovim
```

Open Neovim. lazy.nvim installs plugins on first launch; Mason installs language servers and formatters as you use them (`:Mason` to browse).

## External tools

These are invoked by plugins or formatters — install only what you need:

| Tool | Used for | Install |
|------|----------|---------|
| [Nerd Font](https://www.nerdfonts.com/) | Icons in completion, statusline | e.g. `brew install --cask font-fira-code-nerd-font` |
| `prettierd` | JS/TS/CSS/HTML/JSON/YAML/Markdown/Svelte formatting | `npm i -g @fsouza/prettierd` |
| `biome` | JS/TS formatting (preferred) | `npm i -g @biomejs/biome` |
| `shfmt` | Shell formatting | `brew install shfmt` or Mason |
| `silicon` | Code screenshots (`<Leader>i` in visual) | `brew install silicon` |

Python, Perl, and Ruby remote providers are disabled — no `:python` plugins in use.

## Structure

```
init.lua              lazy.nvim bootstrap
lua/core/             options, keymaps, autocommands
lua/plugins/          plugin specs by concern
CONTEXT.md            domain glossary for this config
docs/agents/          agent skill and QA docs
```

## Modernization

This config is being incrementally updated for Neovim 0.11+ and current plugin APIs. See `CONTEXT.md` and `docs/agents/qa-plan.md` for the approach.
