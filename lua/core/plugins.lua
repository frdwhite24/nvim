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
	use("nathom/filetype.nvim") -- https://github.com/nathom/filetype.nvim

	-- LSP
	use("williamboman/nvim-lsp-installer") -- https://github.com/williamboman/nvim-lsp-installer/
	use("neovim/nvim-lspconfig")
	use("jose-elias-alvarez/null-ls.nvim") -- formatting, linting etc.
	use("jose-elias-alvarez/nvim-lsp-ts-utils") -- Utilities to improve the TS dev ex
	use("rust-lang/rust.vim") -- rust.vim in Neovim pre-package has bug
	-- master branch on rust.vim has it fixed so update direct from there
	-- https://github.com/rust-lang/rust.vim/issues/460
	use("simrat39/rust-tools.nvim")

	-- Completion
	use("hrsh7th/nvim-cmp") -- https://github.com/hrsh7th/nvim-cmp
	use("dcampos/nvim-snippy") -- https://github.com/dcampos/nvim-snippy
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp") -- https://github.com/hrsh7th/cmp-nvim-lsp
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lua") -- https://github.com/hrsh7th/cmp-nvim-lua
	-- use("saadparwaiz1/cmp_luasnip") -- https://github.com/saadparwaiz1/cmp_luasnip
	use("dcampos/cmp-snippy") -- https://github.com/dcampos/cmp-snippy
	use({
		"saecki/crates.nvim", -- https://github.com/Saecki/crates.nvim
		event = { "BufRead Cargo.toml" },
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- NOTE: these are on my watch list
	-- https://github.com/David-Kunz/cmp-npm

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

	-- Version control
	use("lewis6991/gitsigns.nvim") -- https://github.com/lewis6991/gitsigns.nvim
	use("ruifm/gitlinker.nvim") -- https://github.com/ruifm/gitlinker.nvim

	-- Navigation
	use("nvim-telescope/telescope.nvim")
	use("kyazdani42/nvim-tree.lua") -- https://github.com/kyazdani42/nvim-tree.lua

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
	use("ja-ford/delaytrain.nvim") -- https://github.com/ja-ford/delaytrain.nvim
	use("ibhagwan/smartyank.nvim") -- https://github.com/ibhagwan/smartyank.nvim

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
