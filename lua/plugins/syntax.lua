return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd.colorscheme('tokyonight')
        end
    },
    {
    "nvim-treesitter/nvim-treesitter",
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
