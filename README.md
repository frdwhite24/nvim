# Introduction

This is the simplified version of my custom Neovim configuration. I am currently using Neovim version 0.10, and the configuration is written entirely in Lua.

> [!WARNING]
> This has only been set up on MacOS, expect issues if you are on Linux or Windows.

# Prerequisites

- Install [the Nerd Font](https://github.com/ryanoasis/nerd-fonts) patch of your terminal font, so that you get all the icons rendering properly
- Install [Homebrew](https://brew.sh/)

# Usage

```bash
# NOTE: Make sure you move or delete your existing nvim config before running this
git clone -b meetup git@github.com:frdwhite24/nvim.git ~/.config/nvim
brew install neovim

# Check Neovim is installed properly
nvim --version

# NOTE: When opening Neovim, you might have to let things install to start with.
```
