local opts = { noremap = true, silent = true }

-- Wipe mappings
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "Q", "<nop>")

-- Treat word-wrapped lines as multiple lines with cursor
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'",
    { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'",
    { expr = true, silent = true })

-- Move text under selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Rename plugin requires command not to be executed as requires new name
vim.keymap.set("n", "<leader>rn", ":IncRename ")
vim.keymap.set("n", "<leader>rm",
    function() return ":IncRename " .. vim.fn.expand("<cword>") end,
    { expr = true })

-- Replace current word under cursor
vim.keymap.set("n", "<leader>rw",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "[R]eplace [W]ord under cursor" })

-- Search highlight plugin
local kopts = { noremap = true, silent = true }
vim.keymap.set("n", "n",
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.keymap.set("n", "N",
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.keymap.set("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.keymap.set("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.keymap.set("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.keymap.set("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.keymap.set("n", "<Leader>l", ":noh<CR>", kopts)

-- Keep cursor in same position when using J
vim.keymap.set("n", "J", "mzJ`z")

-- Centralise cursor after certain actions
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "}", "}zzzv")
vim.keymap.set("n", "{", "{zzzv")

-- Reselect text when indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Void pasting, deleting and copying
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Void paste" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank movement to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank selection to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to clipboard" })
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Void delete movement" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Void delete selection" })

-- Quick fix list navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("i", "<C-Del>", "<C-o>dw", opts) -- delete word after
vim.keymap.set("i", "<C-BS>", "<C-w>", opts)    -- delete word before

-- NOTE: these two lines need to be done because otherwise remapping <TAB> messes with the jumplist movements
-- this is because C-I and Tab are identical in the eyes of the terminal
vim.keymap.set("n", "<C-I>", "<C-I>")
vim.keymap.set("n", "<Tab>", "<Nop>")
vim.keymap.set("n", "<TAB>", ":bnext<CR>", opts)       -- move to next buffer
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>", opts) -- move to previous buffer

-- LSP, should these move?
vim.keymap.set("n", "<C-p>", "<CMD>lua vim.lsp.diagnostics.goto_prev()<CR>",
    opts)
vim.keymap.set("n", "<C-n>", "<CMD>lua vim.lsp.diagnostics.goto_next()<CR>",
    opts)
vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>", { desc = "Restart language server" })

-- general buffer helpers
vim.keymap.set("n", "<leader>q", ":bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>wq", ":w|bd<CR>", { desc = "Save and close" })
vim.keymap.set("n", "<leader>wh", "<CMD>nohlsearch<CR>",
    { desc = "Wipe search highlights" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move up to split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move down to split" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move left to split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move right to split" })
