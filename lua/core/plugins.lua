-- TODO: go through this setup and take plugins that look good
-- https://github.com/kabinspace/AstroVim

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install plugins from here
return packer.startup(function(use)
  -- Core
  use("wbthomason/packer.nvim") -- https://github.com/wbthomason/packer.nvim
  use("nvim-lua/popup.nvim") -- https://github.com/nvim-lua/popup.nvim
  use("nvim-lua/plenary.nvim") -- https://github.com/nvim-lua/plenary.nvim
  use("kyazdani42/nvim-web-devicons") -- https://github.com/kyazdani42/nvim-web-devicons

  -- Performance
  use("lewis6991/impatient.nvim") -- https://github.com/lewis6991/impatient.nvim

  -- LSP and completion
  use({
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  })
  use "lukas-reineke/lsp-format.nvim"
  use "jose-elias-alvarez/null-ls.nvim"

  -- Syntax
  use("EdenEast/nightfox.nvim") -- https://github.com/EdenEast/nightfox.nvim
  -- use({ "kartikp10/noctis.nvim", requires = { "rktjmp/lush.nvim" } }) -- https://github.com/kartikp10/noctis.nvim
  use({
    "nvim-treesitter/nvim-treesitter",
    runglobal = ":TSUpdate",
  })
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use("norcalli/nvim-colorizer.lua")

  -- Layout
  use("akinsho/bufferline.nvim")
  use("hoob3rt/lualine.nvim") -- https://github.com/nvim-lualine/lualine.nvim
  use("goolord/alpha-nvim") -- https://github.com/goolord/alpha-nvim
  use("rcarriga/nvim-notify") -- https://github.com/rcarriga/nvim-notify
  use({
    "petertriho/nvim-scrollbar", -- https://github.com/petertriho/nvim-scrollbar
    requires = { "kevinhwang91/nvim-hlslens" },
  })

  -- Version control
  use({
    "lewis6991/gitsigns.nvim", -- https://github.com/lewis6991/gitsigns.nvim
    requires = { "petertriho/nvim-scrollbar" },
  })
  use("ruifm/gitlinker.nvim") -- https://github.com/ruifm/gitlinker.nvim

  -- Navigation
  use("nvim-telescope/telescope.nvim")
  use("kyazdani42/nvim-tree.lua") -- https://github.com/kyazdani42/nvim-tree.lua
  use('mbbill/undotree') -- https://github.com/mbbill/undotree

  -- Editor support
  use("tpope/vim-commentary")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("folke/todo-comments.nvim") -- https://github.com/folke/todo-comments.nvim
  use({ "kylechui/nvim-surround", tag = "*" }) -- https://github.com/kylechui/nvim-surround
  use("windwp/nvim-autopairs") -- https://github.com/windwp/nvim-autopairs
  use("windwp/nvim-ts-autotag")
  use("lukas-reineke/indent-blankline.nvim") -- https://github.com/lukas-reineke/indent-blankline.nvim
  use("yamatsum/nvim-cursorline") -- https://github.com/yamatsum/nvim-cursorline
  use("rmagatti/alternate-toggler") -- https://github.com/rmagatti/alternate-toggler
  use("folke/which-key.nvim") -- https://github.com/folke/which-key.nvim
  use("dhruvmanila/telescope-bookmarks.nvim") -- https://github.com/dhruvmanila/telescope-bookmarks.nvim
  use("segeljakt/vim-silicon") -- https://github.com/segeljakt/vim-silicon
  use("gaoDean/autolist.nvim") -- https://github.com/gaoDean/autolist.nvim
  use("smjonas/inc-rename.nvim") -- https://github.com/smjonas/inc-rename.nvim
  use({ "kevinhwang91/nvim-hlslens" }) -- https://github.com/kevinhwang91/nvim-hlslens

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
