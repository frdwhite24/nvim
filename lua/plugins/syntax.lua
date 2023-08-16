return {
    {
        "EdenEast/nightfox.nvim", -- https://github.com/EdenEast/nightfox.nvim
        lazy = false,             -- make sure we load this during startup if it is your main colorscheme
        priority = 1000,          -- make sure to load this before all the other start plugins
        config = function()
            vim.opt.termguicolors = true
            vim.cmd.colorscheme("carbonfox")
        end
    }, {
    "nvim-treesitter/nvim-treesitter", -- https://github.com/nvim-treesitter/nvim-treesitter
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "bash", "dockerfile", "graphql", "html", "help",
                "javascript", "json", "lua", "php", "python", "markdown",
                "rust", "css", "scss", "tsx", "typescript", "yaml"
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
            autotag = {
                enable = true,
            }
        }
    end
}, {
    "folke/twilight.nvim", -- https://github.com/folke/twilight.nvim
    lazy = true,
    cmd = 'Twilight',
    config = true,
    keys = { { "<leader>z", "<CMD>Twilight<CR>", desc = "Toggle zen mode" } }
}
}
