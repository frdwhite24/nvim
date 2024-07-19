return {
    { "tpope/vim-commentary" },                        -- https://github.com/tpope/vim-commentary
    { 'tpope/vim-sleuth' },                            -- https://github.com/tpope/vim-sleuth
    { "JoosepAlviste/nvim-ts-context-commentstring" }, -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
    {
        "lukas-reineke/indent-blankline.nvim",         -- https://github.com/lukas-reineke/indent-blankline.nvim
        main = "ibl",
        opts = {
            scope = {
                show_start = false,
                show_end = false
            }
        },
    }, {
    "yamatsum/nvim-cursorline", -- https://github.com/yamatsum/nvim-cursorline
    opts = {
        cursorline = { enable = true, timeout = 50, number = false },
        cursorword = {
            enable = true,
            min_length = 3,
            hl = { underline = true }
        }
    }
}, {
    "kylechui/nvim-surround", -- https://github.com/kylechui/nvim-surround
    version = "*",
    config = true
}, {
    "windwp/nvim-autopairs", -- https://github.com/windwp/nvim-autopairs
    event = "InsertEnter",
    config = true,
}, {
    "windwp/nvim-ts-autotag", -- https://github.com/windwp/nvim-ts-autotag
    config = true
}, {
    "smjonas/inc-rename.nvim", -- https://github.com/smjonas/inc-rename.nvim
    config = true
}
}
