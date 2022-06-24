local utils = require("core.utils")

utils.define_augroups({
	_general_settings = {
		-- Disable continuation of comments on next line
		{ "BufWinEnter", "*", "lua vim.opt.formatoptions:remove({'c', 'o'})" },
		{ "BufRead", "*", "lua vim.opt.formatoptions:remove({'c', 'o', 'r'})" },
		{ "BufNewFile", "*", "lua vim.opt.formatoptions:remove({'c', 'o', 'r'})" },

		-- Highlight on yank
		{ "TextYankPost", "*", "silent! lua vim.highlight.on_yank()" },

		-- Auto-resize splits when Vim gets resized
		{ "VimResized", "*", "wincmd =" },

		-- Update a buffer's contents on focus if it changed outside of Vim
		{ "FocusGained", "*", ":checktime" },
		{ "BufEnter", "*", ":checktime" },

		-- Keep cursorline centered on move
		{ "CursorMoved", "*", ':exec "norm zz"' },
	},
})
