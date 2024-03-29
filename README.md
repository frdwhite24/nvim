# Introduction

This is my custom Neovim configuration. I am currently using Neovim version 0.8
and the configuration is written entirely in Lua.

# Prerequisites

- Install [this
  font](https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf)
  to get completion menu icons properly rendering
- Install [pyenv](https://github.com/pyenv/pyenv-installer#installation--update--uninstallation)
- Install Python using pyenv `pyenv install 3.10.3` and setting it globally `pyenv global 3.10.3`
- Install `pynvim` and `black` globally using `pip install --user --upgrade black pynvim`
- Install `neovim` lib for Node.js with `npm i -g neovim`
- Install `silicon` cli, can use Brew for this `brew install silicon`
- Install `prettierd` globally with `npm install -g @fsouza/prettierd`

# Usage

⚠️ I haven't updated this for Mac setup yet, this is still a todo. And so this code block is likely not to work!
```bash
# NOTE: Make sure you move or delete your existing nvim config before running this
git clone git@github.com:frdwhite24/nvim.git ~/.config/nvim

# Navigate to Neovim folder and install the latest Neovim version
cd ~/.config/nvim
make

# Run Neovim! (you might need to exit a few times till everything is installed
# while the Makefile is incomplete)
nvim
```

# To do

- Fill out the rest of this Readme (with screenshots)! Take inspiration from
  [AstroNvim](https://github.com/AstroNvim/AstroNvim/blob/main/README.md)
- Enhance the "out of the box" functionality (improve initial start-up with
  makefile by adding prerequisites, headless Neovim start-up to make sure plugins,
  Treesitter parsers and language servers are all installed)
- Record start-up time and incrementally improve it
