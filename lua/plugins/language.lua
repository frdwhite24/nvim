return {
    {
        "VonHeikemen/lsp-zero.nvim", -- https://github.com/VonHeikemen/lsp-zero.nvim
        branch = "v2.x",
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
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            lsp.preset("recommended")
            lsp.ensure_installed({
                "tsserver", "eslint", "lua_ls", "rust_analyzer", "pyright",
                "cssls", "html", "jsonls", "taplo"
            })
            lsp.nvim_workspace()

            lsp.setup_nvim_cmp({
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.confirm({select = true}),
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-j>"] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, {"i", "s"}),
                    ["<C-k>"] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, {"i", "s"})
                })
            })

            lsp.set_preferences({
                sign_icons = {
                    error = "",
                    warn = "",
                    hint = "",
                    info = ""
                }
            })

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({buffer = bufnr})
                require("lsp-format").on_attach(client, bufnr)

                local nmap = function(keys, func, desc)
                    if desc then desc = "LSP: " .. desc end

                    vim.keymap.set("n", keys, func,
                                   {buffer = bufnr, desc = desc})
                end

                local builtin = require("telescope.builtin")
                nmap("gd", function()
                    builtin.lsp_definitions({show_line = false})
                end, "[G]o to [D]efinition")
                nmap("gD", function()
                    builtin.lsp_type_definitions({show_line = false})
                end, "[G]o to type [D]efinition")
                nmap("gr", function()
                    builtin.lsp_references({show_line = false})
                end, "[G]o [R]eferences")
                nmap("K", vim.lsp.buf.hover, "Hover documentation")
                nmap("<C-k>", vim.lsp.buf.signature_help,
                     "Signature documentation")
                nmap("gi", vim.lsp.buf.implementation,
                     "[G]o to [I]mplementation")
                nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                nmap("[d", vim.diagnostic.goto_prev,
                     "Go to previous [D]iagnostic message")
                nmap("]d", vim.diagnostic.goto_next,
                     "Go to next [D]iagnostic message")
                nmap("gl", vim.diagnostic.open_float,
                     "[G]o to [L]ine diagnostic float")
            end)

            require("mason.settings").set({ui = {border = "rounded"}})
            lsp.setup()

            vim.diagnostic.config({virtual_text = true})

            -- this inserts () after selecting a function or method item
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end
    }, {
        "j-hui/fidget.nvim", -- https://github.com/j-hui/fidget.nvim
        config = true
    }, {
        "jose-elias-alvarez/null-ls.nvim", -- https://github.com/jose-elias-alvarez/null-ls.nvim
        config = function()
            local null_ls = require("null-ls")
            local sources = {null_ls.builtins.formatting.prettier}

            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

            local on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({
                        group = augroup,
                        buffer = bufnr
                    })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({
                                bufnr = bufnr,
                                timeout_ms = 1000
                            })
                        end
                    })
                end
            end

            null_ls.setup({sources = sources, on_attach = on_attach})
        end
    }
}
