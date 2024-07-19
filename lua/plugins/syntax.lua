return {
    {
        "folke/tokyonight.nvim", -- https://github.com/folke/tokyonight.nvim
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd.colorscheme('tokyonight')
        end
    },
    {
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
    }
}
