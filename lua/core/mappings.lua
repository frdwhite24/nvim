require("core.plugins")

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- leader
keymap("n", "<Space>", "<NOP>", opts)
vim.g.mapleader = " "

-- Visual mode mappings
-- Easier indenting
keymap("v", "<", "<gv", opts) -- reselect after indent left
keymap("v", ">", ">gv", opts) -- reselect after indent right

-- Insert mode mappings
-- Add undo break points for special characters
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

-- Working with words in insert mode - more normal editing
keymap("i", "<C-Del>", "<C-o>dw", opts)
keymap("i", "<C-H>", "<C-w>", opts) -- https://www.reddit.com/r/neovim/comments/okbag3/comment/h597agl/?utm_source=share&utm_medium=web2x&context=3

-- No leader mappings
-- Keep searches and joins centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Working with buffers
keymap("n", "sh", ":split<Return><C-w>w", {}) -- split window horizontally
keymap("n", "sv", ":vsplit<Return><C-w>w", {}) -- split window vertically
keymap("n", "<TAB>", ":bnext<CR>", opts) -- move to next buffer
keymap("n", "<S-TAB>", ":bprevious<CR>", opts) -- move to previous buffer
keymap("n", "<c-k>", "<c-w>k", opts) -- move to above split
keymap("n", "<c-j>", "<c-w>j", opts) -- move to below split
keymap("n", "<c-h>", "<c-w>h", opts) -- move to left split
keymap("n", "<c-l>", "<c-w>l", opts) -- move to right split

-- LSP
keymap("n", "<C-p>", "<CMD>lua vim.lsp.diagnostics.goto_prev()<CR>", opts)
keymap("n", "<C-n>", "<CMD>lua vim.lsp.diagnostics.goto_next()<CR>", opts)
which_key.register({
	g = {
		name = "Go to...",
		d = { "<CMD>Telescope lsp_definitions<CR>", "definitions" },
		r = { "<CMD>Telescope lsp_references<CR>", "references" },
	},
})

-- Leader prefix mappings
which_key.register({
	b = { "<CMD>ToggleAlternate<CR>", "Toggle value" },
	d = {
		name = "Hook dependency arrays",
		a = { "miyiw/]<CR>i, <ESC>p`i", "Add variable to array" },
	},
	e = { ":NvimTreeToggle<CR>", "Open file tree" },
	f = {
		name = "Find...",
		b = { "<CMD>lua require('telescope.builtin').buffers()<CR>", "Buffers" },
		c = { "<CMD>lua require('core.fw.telescope').search_config_nvim()<CR>", "Neovim config" },
		d = { "<CMD>lua require('telescope.builtin').diagnostics()<CR>", "Diagnostics" },
		e = { "<CMD>lua require('telescope.builtin').git_status()<CR>", "Git edited files" },
		f = { "<CMD>lua require('telescope.builtin').find_files({hidden=true})<CR>", "Files" },
		g = { "<CMD>lua require('telescope.builtin').git_files()<CR>", "Git files" },
		h = { "<CMD>lua require('telescope.builtin').help_tags()<CR>", "Help / manuals" },
		k = { "<CMD>lua require('telescope.builtin').keymaps()<CR>", "Key mappings" },
		o = { "<CMD>lua require('telescope.builtin').oldfiles()<CR>", "Recent files" },
		s = { "<CMD>lua require('telescope.builtin').git_stash()<CR>", "Git stash" },
		t = { "<CMD>TodoTelescope<CR>", "TODOs" },
		w = { "<CMD>lua require('telescope.builtin').live_grep()<CR>", "Words" },
	},
	q = { ":bd<CR>", "Close buffer" },
	r = { name = "Reload...", c = { "<CMD>luafile $MYVIMRC<CR>", "Neovim config" } },
	s = {
		name = "Spelling",
		f = { "z=", "Fix spelling mistake", noremap = false },
		a = { "zg", "Add to local dictionary" },
		r = { "zug", "Remove word from local dictionary" },
		j = { "]s", "Skip to next mistake" },
		k = { "[s", "Skip to previous mistake" },
	},
	u = { "<CMD>UndotreeToggle<CR>", "Toggle undo tree" },
	w = {
		name = "Buffer",
		q = { ":w|bd<CR>", "Save and close" },
	},
	["1"] = { "<CMD>BufferLineGoToBuffer 1<CR>", "Go to buffer no. 1" },
	["2"] = { "<CMD>BufferLineGoToBuffer 2<CR>", "Go to buffer no. 2" },
	["3"] = { "<CMD>BufferLineGoToBuffer 3<CR>", "Go to buffer no. 3" },
	["4"] = { "<CMD>BufferLineGoToBuffer 4<CR>", "Go to buffer no. 4" },
	["5"] = { "<CMD>BufferLineGoToBuffer 5<CR>", "Go to buffer no. 5" },
	["6"] = { "<CMD>BufferLineGoToBuffer 6<CR>", "Go to buffer no. 6" },
	["7"] = { "<CMD>BufferLineGoToBuffer 7<CR>", "Go to buffer no. 7" },
	["8"] = { "<CMD>BufferLineGoToBuffer 8<CR>", "Go to buffer no. 8" },
	["9"] = { "<CMD>BufferLineGoToBuffer 9<CR>", "Go to buffer no. 9" },
}, {
	prefix = "<leader>",
})
