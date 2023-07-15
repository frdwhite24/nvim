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
            "<leader>i",
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
    opts = { show_current_context = true }
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
    config = true
}, {
    "windwp/nvim-ts-autotag", -- https://github.com/windwp/nvim-ts-autotag
    config = true
}, {
    "gaoDean/autolist.nvim", -- https://github.com/gaoDean/autolist.nvim
    ft = {
        "markdown",
        "text",
        "tex",
        "plaintex",
        "norg",
    },
    config = function()
        require("autolist").setup()

        vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
        vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
        -- vim.keymap.set("i", "<c-t>", "<c-t><cmd>AutolistRecalculate<cr>") -- an example of using <c-t> to indent
        vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
        vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
        vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
        vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>")
        vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>")

        -- cycle list types with dot-repeat
        vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
        vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })

        -- if you don't want dot-repeat
        -- vim.keymap.set("n", "<leader>cn", "<cmd>AutolistCycleNext<cr>")
        -- vim.keymap.set("n", "<leader>cp", "<cmd>AutolistCycleNext<cr>")

        -- functions to recalculate list on edit
        vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
        vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
        vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
        vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
    end,
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
    'saecki/crates.nvim', -- https://github.com/Saecki/crates.nvim
    version = 'v0.3.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true
}, {
    "folke/which-key.nvim", -- https://github.com/folke/which-key.nvim
    opts = {
        plugins = { spelling = { enabled = true, suggestions = 20 } },
        window = { border = "single" }
    }
}, {
    "rmagatti/alternate-toggler", -- https://github.com/rmagatti/alternate-toggler
    config = true,
    lazy = true,
    cmd = "ToggleAlternate",
    keys = {
        {
            "<leader>tv",
            "<CMD>ToggleAlternate<CR>",
            desc = "Toggle alternative value"
        }
    }
}
}
