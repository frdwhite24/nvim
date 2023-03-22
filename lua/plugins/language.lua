return {
    {
        "VonHeikemen/lsp-zero.nvim", -- https://github.com/VonHeikemen/lsp-zero.nvim
        branch = 'v2.x',
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
            lsp.ensure_installed({
                "tsserver", "eslint", "lua_ls", "rust_analyzer", "pyright",
                "cssls", "html", "jsonls", "taplo"
            })
            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({buffer = bufnr})
                require("lsp-format").on_attach(client, bufnr)
            end)

            -- require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
            lsp.nvim_workspace()

            lsp.setup()
            vim.diagnostic.config {virtual_text = true}
        end
    }, {
        "j-hui/fidget.nvim", -- https://github.com/j-hui/fidget.nvim
        config = true
    }
}
-- use "jose-elias-alvarez/null-ls.nvim" -- https://github.com/jose-elias-alvarez/null-ls.nvim
