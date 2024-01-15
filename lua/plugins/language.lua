return {
    {
        "hrsh7th/nvim-cmp",
        commit = "6c84bc75c64f778e9f1dcb798ed41c7fcb93b639"
    },
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
        },
        config = function()
            local lsp = require("lsp-zero")
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspconfig = require("lspconfig")

            lsp.preset("recommended")
            lsp.ensure_installed({
                "vtsls", "eslint", "lua_ls", "rust_analyzer", "pyright",
                "cssls", "html", "jsonls", "taplo", "bashls", -- "shfmt" NOTE: install this manually
                "svelte", "yamlls"
            })
            lsp.nvim_workspace()

            lsp.setup_nvim_cmp({
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                    -- ["<C-j>"] = cmp.mapping.scroll_docs(-4),
                    -- ["<C-k>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-j>"] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<C-k>"] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" })
                }),
                sources = {
                    { name = 'path' },
                    { name = 'codeium' },
                    { name = 'nvim_lsp' },
                    { name = 'buffer',  keyword_length = 3 },
                    { name = 'luasnip', keyword_length = 2 },
                }
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
                if client.name == "vtsls" then
                    require("twoslash-queries").attach(client, bufnr)
                end

                lsp.default_keymaps({ buffer = bufnr })

                local nmap = function(keys, func, desc)
                    if desc then desc = "LSP: " .. desc end

                    vim.keymap.set("n", keys, func,
                        { buffer = bufnr, desc = desc })
                end

                local builtin = require("telescope.builtin")
                nmap("gd", function()
                    builtin.lsp_definitions({ show_line = false })
                end, "[G]o to [D]efinition")
                nmap("gD", function()
                    builtin.lsp_type_definitions({ show_line = false })
                end, "[G]o to type [D]efinition")
                nmap("gr", function()
                    builtin.lsp_references({ show_line = false })
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

            require("mason.settings").set({ ui = { border = "rounded" } })

            lspconfig.pyright.setup({
                python = {
                    analysis = {
                        useLibraryCodeForTypes = false
                    }
                }
            })

            lsp.setup()

            vim.diagnostic.config({ virtual_text = true })

            -- this inserts () after selecting a function or method item
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end
    }, {
    "j-hui/fidget.nvim", -- https://github.com/j-hui/fidget.nvim
    config = true,
    tag = 'legacy'
}, {
    "elentok/format-on-save.nvim", -- https://github.com/elentok/format-on-save.nvim
    config = function()
        local format_on_save = require("format-on-save")
        local formatters = require("format-on-save.formatters")

        format_on_save.setup({
            exclude_path_patterns = {
                "/node_modules/",
                ".local/share/nvim/lazy",
            },
            formatter_by_ft = {
                css = formatters.prettierd,
                html = formatters.lsp,
                javascript = formatters.lsp,
                json = formatters.prettierd,
                jsonc = formatters.prettierd,
                lua = formatters.lsp,
                markdown = formatters.prettierd,
                svelte = formatters.prettierd,
                python = formatters.black,
                rust = formatters.lsp,
                scss = formatters.lsp,
                sh = formatters.shfmt,
                typescript = formatters.prettierd,
                typescriptreact = formatters.prettierd,
                yaml = formatters.prettierd,
                toml = formatters.lsp
            },
            -- fallback_formatter = {
            --     formatters.remove_trailing_whitespace,
            --     formatters.prettierd,
            -- }
        })
    end
},
    {
        "jcdickinson/codeium.nvim", -- https://github.com/jcdickinson/codeium.nvim
        commit = "b1ff0d6c993e3d87a4362d2ccd6c660f7444599f",
        config = true,
    },
    {
        "marilari88/twoslash-queries.nvim", -- https://github.com/marilari88/twoslash-queries.nvim
        config = true,
        lazy = true,
        cmd = "InspectTwoslashQueries",
        keys = {
            {
                "<leader>it",
                "<CMD>InspectTwoslashQueries<CR>",
                desc = "[I]nspect [T]ype"
            }
        }
    },
    {
        'andythigpen/nvim-coverage', -- https://github.com/andythigpen/nvim-coverage
        opts = {
            auto_reload = true,
        },
        config = true,
        keys = {
            {
                "<leader>cl",
                "<CMD>Coverage<CR>",
                desc = "[C]overage [L]oad"
            },
            {
                "<leader>ct",
                "<CMD>CoverageToggle<CR>",
                desc = "[C]overage [T]oggle"
            },
            {
                "<leader>cs",
                "<CMD>CoverageSummary<CR>",
                desc = "[C]overage [S]ummary"
            }

        }

    },
    {
        "linux-cultist/venv-selector.nvim", -- https://github.com/linux-cultist/venv-selector.nvim
        dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
        opts = {
            name = ".venv",
            -- auto_refresh = false
        },
        keys = {
            { "<leader>vs", "<cmd>:VenvSelect<cr>" },
            { "<leader>vc", "<cmd>:VenvSelectCached<cr>" }
        }
    }
}
