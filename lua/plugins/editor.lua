return {
  {"tpope/vim-commentary"},
  {'tpope/vim-sleuth'}, -- https://github.com/tpope/vim-sleuth
  {"JoosepAlviste/nvim-ts-context-commentstring"},
  {"folke/todo-comments.nvim"}, -- https://github.com/folke/todo-comments.nvim
    {
        "segeljakt/vim-silicon", -- https://github.com/segeljakt/vim-silicon
        keys = {
            {
                "<leader>i",
                ":Silicon  ~/Pictures/Code<CR>",
                mode = "v",
                desc = "Yank code image"
            }
        }
    }, {"lukas-reineke/indent-blankline.nvim"}, -- https://github.com/lukas-reineke/indent-blankline.nvim
    {
        "yamatsum/nvim-cursorline" -- https://github.com/yamatsum/nvim-cursorline
    }, {"kylechui/nvim-surround", version = "*"}, -- https://github.com/kylechui/nvim-surround
    {"windwp/nvim-autopairs"}, -- https://github.com/windwp/nvim-autopairs
    {"windwp/nvim-ts-autotag"},
    {"gaoDean/autolist.nvim"}, -- https://github.com/gaoDean/autolist.nvim
    {"smjonas/inc-rename.nvim"}, -- https://github.com/smjonas/inc-rename.nvim
    { "kevinhwang91/nvim-hlslens" }, -- https://github.com/kevinhwang91/nvim-hlslens
}
