local option = vim.opt
local global = vim.g

-- Spell checking
option.spell = true
option.spelllang = "en_gb"

-- Tabs, spaces & indent
option.autoindent = true
option.expandtab = true
option.smartindent = true
option.smarttab = true
option.cindent = true
option.breakindent = true

-- Wrapping, viewports and windows
option.splitbelow = true
option.splitright = true
option.errorbells = false
option.hidden = true
option.cmdheight = 1
option.wrap = true
option.scrolloff = 15

-- Rulers and columns
option.cursorline = true
global.cursorline_timeout = 25
option.ruler = true
option.relativenumber = true
option.number = true
option.signcolumn = "yes"
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#353535" })

-- Search
option.incsearch = true
option.hlsearch = true
option.ignorecase = true
option.smartcase = true

-- Long update time (default 4s) leads to poor UX
option.updatetime = 250

-- Get rid of swap files and backups - don't use these features
option.swapfile = false
option.backup = false

-- Editing help
option.undodir = os.getenv("HOME") .. "/.vim/undodir"
option.undofile = true

-- Which-key timeout
option.timeoutlen = 500

-- Clean up command line for things already shown in statusbar
-- TODO: look into why this isn't optionting correctly
-- option.noshowmode = false

-- Python env vim.optup
global.python3_host_prog = "/Users/fred/.pyenv/versions/py3nvim/bin/python"
global.loaded_perl_provider = 0
global.loaded_ruby_provider = 0
