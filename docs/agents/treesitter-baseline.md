# Treesitter baseline (pre-main migration)

Recorded on nvim-treesitter `master` before migrating to `main`.

## Environment

- Neovim 0.12.3
- tree-sitter-cli 0.26.10 (required on `main`; install via `brew install tree-sitter-cli`)

## Parsers (ensure_installed)

bash, css, dockerfile, graphql, hcl, html, javascript, json, lua, markdown, markdown_inline, svelte, tsx, typescript, yaml

## Features enabled on master

- `highlight.enable = true`
- `additional_vim_regex_highlighting = false`
- `auto_install = true`
- No indent, fold, or incremental selection

## Dependent plugins

- nvim-ts-autotag (html, tsx, jsx, svelte)
- nvim-ts-context-commentstring (tsx/jsx block comments)
- render-markdown.nvim (markdown preview)

## Smoke-test filetypes

`.lua`, `.ts`, `.tsx`, `.svelte`, `.tf`, `.yaml`, `.json`, `.graphql`, `.dockerfile`, `.md`, `.html`, `.sh`, `.css`
