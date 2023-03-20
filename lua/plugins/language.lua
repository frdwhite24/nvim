return {
    {
        "VonHeikemen/lsp-zero.nvim", -- https://github.com/VonHeikemen/lsp-zero.nvim
        dependencies = {
            "neovim/nvim-lspconfig", "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim", "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua", "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            {"lukas-reineke/lsp-format.nvim", config = true}
        },
        config = function()
            local lsp = require("lsp-zero")
            lsp.preset("recommended")
            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({buffer = bufnr})
                require("lsp-format").on_attach(client, bufnr)
            end)
            require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
            lsp.setup()
            vim.diagnostic.config {virtual_text = true}
        end
    }, {
        "j-hui/fidget.nvim", -- https://github.com/j-hui/fidget.nvim
        config = true
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
                }
            }
        end
    }
}
