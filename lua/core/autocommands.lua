local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local MyGroup = augroup("MyGroup", {})
local yank_group = augroup('HighlightYank', {})

-- Disable continuation of comments on next line apart from on enter in insert
autocmd("BufWinEnter", {
    group = MyGroup,
    pattern = "*",
    callback = function() vim.opt.formatoptions:remove({ "c", "o" }) end
})
autocmd({ "BufRead", "BufNewFile" }, {
    group = MyGroup,
    pattern = "*",
    callback = function() vim.opt.formatoptions:remove({ "c", "o", "r" }) end
})

-- Auto-resize splits when Vim gets resized
autocmd("VimResized", { group = MyGroup, pattern = "*", command = "wincmd =" })

-- Update a buffer's contents on focus if it changed outside of Vim
autocmd({ "FocusGained", "BufEnter" },
    { group = MyGroup, pattern = "*", command = "checktime" })

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 150 })
    end
})
