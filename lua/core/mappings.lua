require("core.plugins")

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Leader
keymap("n", "<Space>", "<NOP>", opts)
vim.g.mapleader = " "

-- Easier indenting
keymap("v", "<", "<gv", opts) -- reselect after indent left
keymap("v", ">", ">gv", opts) -- reselect after indent right

-- Keep searches and joins centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Add undo break points for special characters
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

-- Working with words in insert mode - more normal editing
keymap("i", "<C-Del>", "<C-o>dw", opts)
keymap("i", "<C-H>", "<C-w>", opts) -- https://www.reddit.com/r/neovim/comments/okbag3/comment/h597agl/?utm_source=share&utm_medium=web2x&context=3

-- Working with buffers
keymap("n", "sh", ":split<Return><C-w>w", {}) -- split window horizontally
keymap("n", "sv", ":vsplit<Return><C-w>w", {}) -- split window vertically
keymap("n", "<TAB>", ":bnext<CR>", opts) -- move to next buffer
keymap("n", "<S-TAB>", ":bprevious<CR>", opts) -- move to previous buffer
keymap("n", "<c-k>", "<c-w>k", opts) -- move to above split
keymap("n", "<c-j>", "<c-w>j", opts) -- move to below split
keymap("n", "<c-h>", "<c-w>h", opts) -- move to left split
keymap("n", "<c-l>", "<c-w>l", opts) -- move to right split

-- Spelling related
keymap("n", "<leader>sf", "z=", { silent = true }) -- fix spelling mistake
keymap("n", "<leader>sa", "zg", opts) -- add word to local dictionary
keymap("n", "<leader>sr", "zug", opts) -- remove word from local dictionary
keymap("n", "sj", "]s", opts) -- skip to next incorrect word
keymap("n", "sk", "[s", opts) -- skip to previous incorrect word

-- File Explorer
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<Leader>wq", ":w|bd<CR>", opts)
keymap("n", "<Leader>q", ":bd<CR>", opts)

-- LSP
keymap("n", "<C-p>", "<cmd>lua vim.lsp.diagnostics.goto_prev()<CR>", opts)
keymap("n", "<C-n>", "<cmd>lua vim.lsp.diagnostics.goto_next()<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({hidden=true})<CR>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').git_files()<CR>", opts)
keymap("n", "<leader>fs", "<cmd>lua require('telescope.builtin').git_stash()<CR>", opts)
keymap("n", "<leader>fe", "<cmd>lua require('telescope.builtin').git_status()<CR>", opts)
keymap("n", "<leader>fw", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
keymap("n", "<leader>fd", "<cmd>lua require('telescope.builtin').diagnostics()<CR>", opts)
keymap("n", "<leader>ft", "<cmd>TodoTelescope<CR>", opts)
keymap("n", "<leader>fc", "<cmd>lua require('core.fw.telescope').search_config_nvim()<CR>", opts)
keymap("n", "<leader>fo", [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], opts)
keymap("n", "<leader>fk", [[<cmd>lua require('telescope.builtin').keymaps()<cr>]], opts)

-- Bufferline
keymap("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", opts)

-- Editor support
keymap("n", "<leader>b", "<cmd>ToggleAlternate<CR>", opts)

-- Reload Neovim
keymap("n", "<leader>lc", "<cmd>luafile $MYVIMRC<CR>", opts)
