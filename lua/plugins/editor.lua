return {
    { "tpope/vim-commentary" }, { 'tpope/vim-sleuth' }, -- https://github.com/tpope/vim-sleuth
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    {
        "folke/todo-comments.nvim", -- https://github.com/folke/todo-comments.nvim
        opts = {
            merge_keywords = true,
            keywords = { TODO = { icon = " ", color = "info", alt = { "XX" } } }
        }
    },
    {
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
},
    {
        "windwp/nvim-autopairs", -- https://github.com/windwp/nvim-autopairs
        config = true
    }, {
    "windwp/nvim-ts-autotag", -- https://github.com/windwp/nvim-ts-autotag
    config = true
}, {
    "gaoDean/autolist.nvim", -- https://github.com/gaoDean/autolist.nvim
    ft = { "markdown", "text", "tex", "plaintex" },
    config = function()
        local autolist = require("autolist")
        autolist.setup()
        autolist.create_mapping_hook("i", "<CR>", autolist.new)
        autolist.create_mapping_hook("i", "<Tab>", autolist.indent)
        autolist.create_mapping_hook("i", "<S-Tab>", autolist.indent,
            "<C-D>")
        autolist.create_mapping_hook("n", "o", autolist.new)
        autolist.create_mapping_hook("n", "O", autolist.new_before)
        autolist.create_mapping_hook("n", ">>", autolist.indent)
        autolist.create_mapping_hook("n", "<<", autolist.indent)
        autolist.create_mapping_hook("n", "<C-r>",
            autolist.force_recalculate)
        autolist.create_mapping_hook("n", "<leader>x",
            autolist.invert_entry, "")
        vim.api.nvim_create_autocmd("TextChanged", {
            pattern = "*",
            callback = function()
                vim.cmd.normal({
                    autolist.force_recalculate(nil, nil),
                    bang = false
                })
            end
        })
    end
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
}
}
