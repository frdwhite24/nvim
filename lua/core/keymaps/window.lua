local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to split above", noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to split below", noremap = true, silent = true })
vim.keymap.set("n", "<Leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list item" })
vim.keymap.set("n", "<Leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location list item" })

-- Tab and C-I share the same terminal key; preserve jump-forward before rebinding Tab
vim.keymap.set("n", "<C-I>", "<C-I>")
vim.keymap.set("n", "<Tab>", "<Nop>")
vim.keymap.set("n", "<TAB>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>", opts)

vim.keymap.set("n", "<Leader>q", ":bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<Leader>wq", ":w|bd<CR>", { desc = "Save and close buffer" })
vim.keymap.set("n", "<Leader>sh", ":split<Return><C-w>w", { desc = "Horizontally split buffer" })
vim.keymap.set("n", "<Leader>sv", ":vsplit<Return><C-w>w", { desc = "Vertically split buffer" })
