-- Recommended from https://github.com/kyazdani42/nvim-tree.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Load lazy.nvim here
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "      -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " " -- I (Fred) added this in i think from a Primeagen vid

require("lazy").setup("plugins", { ui = { border = "rounded" } })
require('core')
