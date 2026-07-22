return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "moon",      -- dark mode
            light_style = "day", -- light mode (system-driven via vim.o.background)
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd.colorscheme("tokyonight")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("treesitter").setup()
        end
    }, {
    "folke/flash.nvim", -- https://github.com/folke/flash.nvim
    event = "VeryLazy",
    opts = {
        modes = {
            search = {
                enabled = true
            },
            char = {
                enabled = false,
            }
        },
    },
    keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
}
}
