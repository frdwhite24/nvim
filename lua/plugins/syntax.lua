return {
    {
        "folke/tokyonight.nvim", -- https://github.com/folke/tokyonight.nvim
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd.colorscheme('tokyonight')
        end
    }, {

    --     "EdenEast/nightfox.nvim", -- https://github.com/EdenEast/nightfox.nvim
    --     lazy = false,             -- make sure we load this during startup if it is your main colorscheme
    --     priority = 1000,          -- make sure to load this before all the other start plugins
    --     config = function()
    --         vim.opt.termguicolors = true
    --         vim.cmd.colorscheme("carbonfox")
    --     end
    -- }, {
    "nvim-treesitter/nvim-treesitter", -- https://github.com/nvim-treesitter/nvim-treesitter
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag"
    },
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "bash",
                "css",
                "dockerfile",
                "graphql",
                "html",
                "java",
                "javascript",
                "json",
                "lua",
                "markdown",
                "php",
                "python",
                "rust",
                "scss",
                "svelte",
                "tsx",
                "typescript",
                "yaml",
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
        }
    end
}, {
    "folke/twilight.nvim", -- https://github.com/folke/twilight.nvim
    lazy = true,
    cmd = 'Twilight',
    config = true,
    keys = { { "<Leader>z", "<CMD>Twilight<CR>", desc = "Toggle zen mode" } }
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
