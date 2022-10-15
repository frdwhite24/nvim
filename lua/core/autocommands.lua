local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
MyGroup = augroup("MyGroup", {})

-- Disable continuation of comments on next line apart from on enter in insert
autocmd("BufWinEnter", {
	group = MyGroup,
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "o" })
	end,
})
autocmd({ "BufRead", "BufNewFile" }, {
	group = MyGroup,
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "o", "r" })
	end,
})

-- Auto-resize splits when Vim gets resized
autocmd("VimResized", {
	group = MyGroup,
	pattern = "*",
	command = "wincmd =",
})

-- Update a buffer's contents on focus if it changed outside of Vim
autocmd({ "FocusGained", "BufEnter" }, {
	group = MyGroup,
	pattern = "*",
	command = "checktime",
})

-- Keep cursorline centered on move
autocmd("CursorMoved", {
	group = MyGroup,
	pattern = "*",
	command = "norm zz",
})

-- Format toml on save
autocmd("BufWritePre", {
	group = MyGroup,
	pattern = "*.toml,*.html",
	callback = function()
		vim.lsp.buf.format()
	end,
})

-- Disable lsp diagnostics for .lock files
autocmd("BufEnter", {
	group = MyGroup,
	pattern = "*.lock",
	command = "LspStop",
})
