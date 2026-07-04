local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump half page down", buffer = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump half page up", buffer = true })
vim.keymap.set("n", "}", "}zzzv")
vim.keymap.set("n", "{", "{zzzv")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("x", "<Leader>p", '"_dP', { desc = "Void paste" })
vim.keymap.set("n", "<Leader>y", '"+y', { desc = "Yank movement to clipboard" })
vim.keymap.set("v", "<Leader>y", '"+y', { desc = "Yank selection to clipboard" })
vim.keymap.set("n", "<Leader>Y", '"+Y', { desc = "Yank line to clipboard" })
vim.keymap.set("n", "<Leader>d", '"_d', { desc = "Void delete movement" })
vim.keymap.set("v", "<Leader>d", '"_d', { desc = "Void delete selection" })

vim.keymap.set("n", "<Leader>rn", ":IncRename ")
vim.keymap.set("n", "<Leader>rm",
    function() return ":IncRename " .. vim.fn.expand("<cword>") end,
    { expr = true })
vim.keymap.set("n", "<Leader>rw",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "[R]eplace [W]ord under cursor" })

vim.keymap.set("i", "<C-Del>", "<C-o>dw", opts)
vim.keymap.set("i", "<C-BS>", "<C-w>", opts)
