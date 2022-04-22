# Introduction

This is my custom Neovim configuration. I am currently using Neovim version 0.7
and the configuration is written entirely in Lua.

# Usage

```bash
# NOTE: Make sure you move or delete your existing nvim config before running this
git clone git@github.com:frdwhite24/nvim.git ~/.config/nvim

# Install the latest Neovim version
make

# Run Neovim! (you might need to exit a few times till everything is installed
# while the Makefile is incomplete)
nvim
```

# To do

- Fill out the rest of this Readme (with screenshots)! Take inspo from
[AstroNvim](https://github.com/AstroNvim/AstroNvim/blob/main/README.md)
- Enhance the "out of the box" functionality (improve initial startup with
    makefile by adding prereqs, headless neovim startup to make sure plugins,
    treesitter parsers and language servers are all installed)
- Record startup time and incrementally improve it
- Pull out all the todos into a checklist in the readme
