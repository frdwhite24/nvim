-- TODO: go through this setup and take plugins that look goodplu
-- https://github.com/kabinspace/AstroVim

-- TODO: implement the mapping popup I saw in Chris@Machine's video
-- TODO: separate out my nvim config from my dotfiles and make a new gh repo
-- TODO: sort out the /after directory into nicely imported code in /lua that works out the box
-- TODO: implement this when I have time
-- use 'dhruvmanila/telescope-bookmarks.nvim'  -- https://github.com/dhruvmanila/telescope-bookmarks.nvim
-- TODO: implement lsp installer and make sure lua is set up correctly

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install plugins from here
return packer.startup(function(use)
  -- Core
  use 'wbthomason/packer.nvim'  -- https://github.com/wbthomason/packer.nvim
  use 'nvim-lua/popup.nvim'  -- https://github.com/nvim-lua/popup.nvim
  use 'nvim-lua/plenary.nvim'  -- https://github.com/nvim-lua/plenary.nvim
  use 'kyazdani42/nvim-web-devicons'  -- https://github.com/kyazdani42/nvim-web-devicons
  
  -- Peformance
  use 'lewis6991/impatient.nvim'  -- https://github.com/lewis6991/impatient.nvim
  use 'nathom/filetype.nvim'  -- https://github.com/nathom/filetype.nvim

  -- LSP
  use 'neovim/nvim-lspconfig'  -- Built in Neovim LSP client
  -- TODO: implement this below
  -- use 'williamboman/nvim-lsp-installer'  -- https://github.com/williamboman/nvim-lsp-installer/
  use {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    requires = { "nvim-lua/plenary.nvim" },
  }
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'rust-lang/rust.vim'  -- rust.vim in Neovim pre-package has bug
  -- master branch on rust.vim has it fixed so update direct from there
  -- https://github.com/rust-lang/rust.vim/issues/460
  use 'simrat39/rust-tools.nvim'

  -- Completion
  use 'hrsh7th/nvim-cmp'  -- https://github.com/hrsh7th/nvim-cmp
  -- TODO: reimplement this as the cmp uses it for certain LSP source suggestions
  -- use 'L3MON4D3/LuaSnip' -- https://github.com/L3MON4D3/LuaSnip
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'  -- https://github.com/hrsh7th/cmp-nvim-lsp
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'  -- https://github.com/hrsh7th/cmp-nvim-lua
  use 'saadparwaiz1/cmp_luasnip'  -- https://github.com/saadparwaiz1/cmp_luasnip
  -- NOTE: these are on my watch list
  -- https://github.com/David-Kunz/cmp-npm

  -- Syntax
  use "EdenEast/nightfox.nvim"
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'norcalli/nvim-colorizer.lua'
  use "narutoxy/dim.lua"  -- https://github.com/NarutoXY/dim.lua
  
  -- Layout
  use 'akinsho/bufferline.nvim'
  use 'hoob3rt/lualine.nvim'
  use 'goolord/alpha-nvim'  -- https://github.com/goolord/alpha-nvim

  -- Version control
  use 'lewis6991/gitsigns.nvim'  -- https://github.com/lewis6991/gitsigns.nvim
  use 'ruifm/gitlinker.nvim'  -- https://github.com/ruifm/gitlinker.nvim
  
  -- Navigation
  use 'nvim-telescope/telescope.nvim'
  use 'kyazdani42/nvim-tree.lua'  -- https://github.com/kyazdani42/nvim-tree.lua
  use 'simrat39/symbols-outline.nvim'  -- https://github.com/simrat39/symbols-outline.nvim

  -- Editor support
  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use "folke/todo-comments.nvim"  -- https://github.com/folke/todo-comments.nvim
  use 'tpope/vim-surround'  -- Vim surround support (change brackets with cs)
  use 'windwp/nvim-autopairs'  -- https://github.com/windwp/nvim-autopairs
  use 'windwp/nvim-ts-autotag'
  use 'lukas-reineke/indent-blankline.nvim'  -- https://github.com/lukas-reineke/indent-blankline.nvim
  use 'yamatsum/nvim-cursorline'  -- https://github.com/yamatsum/nvim-cursorline
  use 'rmagatti/alternate-toggler'  -- https://github.com/rmagatti/alternate-toggler

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
