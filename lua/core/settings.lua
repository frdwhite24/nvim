-- this is for global (o), window (wo) or local (bo) settings, not general (g)
local set = vim.opt
local g = vim.g

-- Spell checking
set.spell = true
set.spelllang = "en_gb"

-- Tabs, spaces & indent
set.tabstop = 2
set.autoindent = true
set.expandtab = true
set.shiftwidth = 2
set.smartindent = true
set.smarttab = true
set.softtabstop = 2
set.cindent = true

-- Wrapping, viewports and windows
set.scrolloff = 8
set.splitbelow = true
set.splitright = true
set.errorbells = false
set.hidden = true
set.cmdheight = 1
set.wrap = true

-- Rulers and columns
set.cursorline = true
g.cursorline_timeout = 25
set.ruler = true
set.relativenumber = true
set.number = true
set.signcolumn = "yes"

-- Search
set.incsearch = false
set.hlsearch = false
set.ignorecase = true
set.smartcase = true

-- Colour scheme
set.termguicolors = true

-- Long update time (default 4s) leads to poor UX
set.updatetime = 100

-- Get rid of swap files and backups - generally never use these features.
set.swapfile = false
set.backup = false

-- Registers
-- g.clipboard = "unnamedplus"

-- Rust formatting
g.rustfmt_autosave = 1

-- Which-key timeout
set.timeoutlen = 500
