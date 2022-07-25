require("core.plugins")

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Leader
keymap("n", "<Space>", "<NOP>", opts)
vim.g.mapleader = " "

-- Visual
which_key.register({
	["<"] = { "<gv", "Reselect after indent left" },
	[">"] = { ">gv", "Reselect after indent left" },
}, {
	mode = "v",
})

-- Visual + leader
which_key.register({
	g = {
		name = "Git",
		y = { "<CMD>lua require('gitlinker').get_buf_range_url('v')<CR>", "Remote range link" },
	},
}, {
	prefix = "<leader>",
	mode = "v",
})

-- Insert
which_key.register({
	[","] = { ",<C-g>u", "which_key_ignore" }, -- add undo break point for ,
	["."] = { ".<C-g>u", "which_key_ignore" }, -- add undo break point for .
	["!"] = { "!<C-g>u", "which_key_ignore" }, -- add undo break point for !
	["?"] = { "?<C-g>u", "which_key_ignore" }, -- add undo break point for ?
}, {
	mode = "i",
})
keymap("i", "<C-Del>", "<C-o>dw", opts) -- delete word after
keymap("i", "<C-BS>", "<C-w>", opts) -- delete word before

keymap("n", "<C-p>", "<CMD>lua vim.lsp.diagnostics.goto_prev()<CR>", opts)
keymap("n", "<C-n>", "<CMD>lua vim.lsp.diagnostics.goto_next()<CR>", opts)
keymap("n", "<TAB>", ":bnext<CR>", opts) -- move to next buffer
keymap("n", "<S-TAB>", ":bprevious<CR>", opts) -- move to previous buffer
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "tlo", ":TSLspOrganize<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "tlr", ":TSLspRenameFile<CR>", opts)
-- vim.api.nvim_buf_set_keymap(bufnr, "n", "tli", ":TSLspImportAll<CR>", opts)
-- Normal
which_key.register({
	g = {
		name = "Go to...",
		d = { "<CMD>Telescope lsp_definitions<CR>", "definitions" },
		r = { "<CMD>Telescope lsp_references<CR>", "references" },
	},
	s = {
		name = "Split buffer...",
		h = { ":split<Return><C-w>w", "horizontally" },
		v = { ":vsplit<Return><C-w>w", "vertically" },
	},
	["<C-k>"] = { "<C-w>k", "Move up to split" },
	["<C-j>"] = { "<C-w>j", "Move down to split" },
	["<C-h>"] = { "<C-w>h", "Move left to split" },
	["<C-l>"] = { "<C-w>l", "Move right to split" },
	K = { "<CMD>lua vim.lsp.buf.hover()<CR>" },
}, {
	mode = "n",
})

-- Normal + leader
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
	g = {
		name = "Git",
		l = { "<CMD>lua require('gitlinker').get_buf_range_url('n')<CR>", "Remote line link" },
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
	mode = "n",
})
