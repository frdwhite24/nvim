local opts = {noremap = true, silent = true}

-- Wipe leader mappings
vim.keymap.set({"n", "v"}, "<Space>", "<Nop>", {silent = true})

-- Remap for dealing with word wrap nicely
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'",
               {expr = true, silent = true})
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'",
               {expr = true, silent = true})

-- Move text under selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Rename plugin requires command not to be executed as requires new name
vim.keymap.set("n", "<leader>rn", ":IncRename ")
vim.keymap.set("n", "<leader>rm",
               function() return ":IncRename " .. vim.fn.expand("<cword>") end,
               {expr = true})

-- Replace current word under cursor
vim.keymap.set("n", "<leader>s",
               [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
               {desc = "Replace word under cursor"})

-- Search highlight plugin
local kopts = {noremap = true, silent = true}
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
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("n", "Q", "<nop>")

-- Quick fix list navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("i", "<C-Del>", "<C-o>dw", opts) -- delete word after
vim.keymap.set("i", "<C-BS>", "<C-w>", opts) -- delete word before
vim.keymap.set("n", "<C-p>", "<CMD>lua vim.lsp.diagnostics.goto_prev()<CR>",
               opts)
vim.keymap.set("n", "<C-n>", "<CMD>lua vim.lsp.diagnostics.goto_next()<CR>",
               opts)
vim.keymap.set("n", "<TAB>", ":bnext<CR>", opts) -- move to next buffer
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>", opts) -- move to previous buffer

vim.keymap.set("n", "<leader>q", ":bd<CR>")
vim.keymap.set("n", "<leader>wh", "<CMD>nohlsearch<CR>",
               {desc = "Wipe search highlights"})

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then return end

-- Insert
which_key.register({
    [","] = {",<C-g>u", "which_key_ignore"}, -- add undo break point for ,
    ["."] = {".<C-g>u", "which_key_ignore"}, -- add undo break point for .
    ["!"] = {"!<C-g>u", "which_key_ignore"}, -- add undo break point for !
    ["?"] = {"?<C-g>u", "which_key_ignore"} -- add undo break point for ?
}, {mode = "i"})

-- Insert
which_key.register({
    [","] = {",<C-g>u", "which_key_ignore"}, -- add undo break point for ,
    ["."] = {".<C-g>u", "which_key_ignore"}, -- add undo break point for .
    ["!"] = {"!<C-g>u", "which_key_ignore"}, -- add undo break point for !
    ["?"] = {"?<C-g>u", "which_key_ignore"} -- add undo break point for ?
}, {mode = "i"})

-- UI

-- Normal
which_key.register({
    s = {
        name = "Split buffer...",
        h = {":split<Return><C-w>w", "horizontally"},
        v = {":vsplit<Return><C-w>w", "vertically"}
    },
    ["<C-k>"] = {"<C-w>k", "Move up to split"},
    ["<C-j>"] = {"<C-w>j", "Move down to split"},
    ["<C-h>"] = {"<C-w>h", "Move left to split"},
    ["<C-l>"] = {"<C-w>l", "Move right to split"}
}, {mode = "n"})

-- Normal + leader
which_key.register({
    d = {
        name = "Hook dependency arrays",
        a = {"miyiw/]<CR>i, <ESC>p`i", "Add variable to array"}
    },
    r = {name = "Reload...", c = {"<CMD>luafile $MYVIMRC<CR>", "Neovim config"}},
    s = {
        name = "Spelling",
        f = {"z=", "Fix spelling mistake", noremap = false},
        a = {"zg", "Add to local dictionary"},
        r = {"zug", "Remove word from local dictionary"},
        j = {"]s", "Skip to next mistake"},
        k = {"[s", "Skip to previous mistake"}
    },
    t = {name = "Toggle...", v = {"<CMD>ToggleAlternate<CR>", "value"}},
    w = {
        name = "Buffer / Wipe...",
        q = {":w|bd<CR>", "Save and close"},
        h = {"<CMD>nohlsearch<CR>", "search highlights"}
    },
    ["1"] = {"<CMD>BufferLineGoToBuffer 1<CR>", "Go to buffer no. 1"},
    ["2"] = {"<CMD>BufferLineGoToBuffer 2<CR>", "Go to buffer no. 2"},
    ["3"] = {"<CMD>BufferLineGoToBuffer 3<CR>", "Go to buffer no. 3"},
    ["4"] = {"<CMD>BufferLineGoToBuffer 4<CR>", "Go to buffer no. 4"},
    ["5"] = {"<CMD>BufferLineGoToBuffer 5<CR>", "Go to buffer no. 5"},
    ["6"] = {"<CMD>BufferLineGoToBuffer 6<CR>", "Go to buffer no. 6"},
    ["7"] = {"<CMD>BufferLineGoToBuffer 7<CR>", "Go to buffer no. 7"},
    ["8"] = {"<CMD>BufferLineGoToBuffer 8<CR>", "Go to buffer no. 8"},
    ["9"] = {"<CMD>BufferLineGoToBuffer 9<CR>", "Go to buffer no. 9"}
}, {prefix = "<leader>", mode = "n"})
