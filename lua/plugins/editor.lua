return {
    { "tpope/vim-commentary" }, { 'tpope/vim-sleuth' }, -- https://github.com/tpope/vim-sleuth
    { "JoosepAlviste/nvim-ts-context-commentstring" }, {
    "folke/todo-comments.nvim",                         -- https://github.com/folke/todo-comments.nvim
    opts = {
        merge_keywords = true,
        keywords = { TODO = { icon = " ", color = "info", alt = { "XX" } } }
    }
}, {
    "segeljakt/vim-silicon", -- https://github.com/segeljakt/vim-silicon
    keys = {
        {
            "<Leader>i",
            ":Silicon  ~/Pictures/Code<CR>",
            mode = "v",
            desc = "Yank code image"
        }
    },
    config = function()
        vim.g.silicon = {
            theme = "Monokai Extended",
            font = "FiraCode Nerd Font Mono",
            background = "#AAAAFF",
            ["shadow-color"] = "#555555",
            ["line-pad"] = 2,
            ["pad-horiz"] = 80,
            ["pad-vert"] = 100,
            ["shadow-blur-radius"] = 0,
            ["shadow-offset-x"] = 0,
            ["shadow-offset-y"] = 0,
            ["line-number"] = true,
            ["round-corner"] = true,
            ["window-controls"] = true
        }
    end
}, {
    "lukas-reineke/indent-blankline.nvim", -- https://github.com/lukas-reineke/indent-blankline.nvim
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
    event = "VeryLazy",
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
}, {
    "ethanholz/nvim-lastplace", -- https://github.com/ethanholz/nvim-lastplace
    config = true
}, {
    "NvChad/nvim-colorizer.lua", -- https://github.com/NvChad/nvim-colorizer.lua
    config = true
}, {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    config = true
}, {
    "folke/which-key.nvim", -- https://github.com/folke/which-key.nvim
    event = "VeryLazy",
    config = true,
    opts = {
        preset = "helix",
        notify = false
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}, {
    'echasnovski/mini.nvim', -- https://github.com/echasnovski/mini.icons (required by which-key)
    version = false,
    config = function()
        require('mini.icons').setup()
    end,
}, {
    "rmagatti/alternate-toggler", -- https://github.com/rmagatti/alternate-toggler
    config = true,
    lazy = true,
    cmd = "ToggleAlternate",
    keys = {
        {
            "<Leader>tv",
            "<CMD>ToggleAlternate<CR>",
            desc = "Toggle alternative value"
        }
    }
}
}
