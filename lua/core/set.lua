-- Spell checking
vim.opt.spell = true
vim.opt.spelllang = "en_gb"

-- Tabs, spaces & indent
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.cindent = true
vim.opt.breakindent = true

-- Wrapping, viewports and windows
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.errorbells = false
vim.opt.hidden = true
vim.opt.cmdheight = 1
vim.opt.wrap = true
vim.opt.scrolloff = 15

-- Rulers and columns
vim.opt.cursorline = true
vim.g.cursorline_timeout = 25
vim.opt.ruler = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#353535" })

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Long update time (default 4s) leads to poor UX
vim.opt.updatetime = 250

-- Get rid of swap files and backups - don't use these features
vim.opt.swapfile = false
vim.opt.backup = false

-- Editing help
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Which-key timeout
vim.opt.timeoutlen = 500

-- Clean up command line for things already shown in statusbar
-- TODO: look into why this isn't vim.optting correctly
-- vim.opt.noshowmode = false

-- Python env vim.optup
vim.g.python3_host_prog = "/Users/fred/.pyenv/versions/py3nvim/bin/python"
