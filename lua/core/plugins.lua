-- Auto install packer if not already installed
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- Install plugins from here
require("packer").startup(function(use)
  -- Core
  use("wbthomason/packer.nvim") -- https://github.com/wbthomason/packer.nvim
  use("nvim-lua/plenary.nvim") -- https://github.com/nvim-lua/plenary.nvim
  use("kyazdani42/nvim-web-devicons") -- https://github.com/kyazdani42/nvim-web-devicons

  -- Performance
  -- use("lewis6991/impatient.nvim") -- https://github.com/lewis6991/impatient.nvim

  -- LSP and completion
  use({
    "VonHeikemen/lsp-zero.nvim", -- https://github.com/VonHeikemen/lsp-zero.nvim
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
  use "lukas-reineke/lsp-format.nvim" -- https://github.com/lukas-reineke/lsp-format.nvim
  use "jose-elias-alvarez/null-ls.nvim" -- https://github.com/jose-elias-alvarez/null-ls.nvim
  use "j-hui/fidget.nvim" -- https://github.com/j-hui/fidget.nvim

  -- Syntax highlighting / theme
  use("EdenEast/nightfox.nvim") -- https://github.com/EdenEast/nightfox.nvim
  -- use({ "kartikp10/noctis.nvim", requires = { "rktjmp/lush.nvim" } }) -- https://github.com/kartikp10/noctis.nvim
  -- use { 'nyoom-engineering/oxocarbon.nvim' } -- https://github.com/nyoom-engineering/oxocarbon.nvim
  -- use 'B4mbus/oxocarbon-lua.nvim'
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
  use {
    "folke/trouble.nvim", -- https://github.com/folke/trouble.nvim
    requires = "kyazdani42/nvim-web-devicons",
  }

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
  use 'tpope/vim-sleuth' -- https://github.com/tpope/vim-sleuth
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
  if is_bootstrap then
    require('packer').sync()
  end
end)

-- Automatically source and re-compile packer whenever you save this file
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = 'plugins.lua',
})
