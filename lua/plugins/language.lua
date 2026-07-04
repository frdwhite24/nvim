return {
    { 'williamboman/mason.nvim' },           -- https://github.com/williamboman/mason.nvim
    { 'williamboman/mason-lspconfig.nvim' }, -- https://github.com/williamboman/mason-lspconfig.nvim
    {
        'VonHeikemen/lsp-zero.nvim', -- https://github.com/VonHeikemen/lsp-zero.nvim
        branch = 'v3.x',
        config = function()
            local lsp_zero = require('lsp-zero')

            lsp_zero.extend_lspconfig()

            require("lsp").setup()

            -- TO DISABLE SEMANTIC HIGHLIGHTS IF I WANT TO
            -- lsp_zero.set_server_config({
            --     on_init = function(client)
            --         client.server_capabilities.semanticTokensProvider = nil
            --     end,
            -- })

            require('mason').setup({
                ui = {
                    border = "rounded"
                }
            })

            require('mason-lspconfig').setup({
                ensure_installed = {
                    "terraformls",
                    "vtsls",
                    "eslint",
                    "svelte",
                    "lua_ls",
                    "cssls",
                    "html",
                    "jsonls",
                    "bashls",
                    "yamlls",
                },
            })
        end
    },
    { 'neovim/nvim-lspconfig' }, -- https://github.com/neovim/nvim-lspconfig
    {
        'saghen/blink.cmp',      -- https://github.com/Saghen/blink.cmp
        -- optional: provides snippets for the snippet source
        dependencies = { 'rafamadriz/friendly-snippets' },

        -- use a release tag to download pre-built binaries
        version = '1.*',
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            signature = { enabled = true },
            cmdline = {
                keymap = {
                    ['<Tab>'] = { 'show', 'accept' },
                    ['<CR>'] = { 'accept_and_enter', 'fallback' },
                },
                completion = {
                    menu = {
                        auto_show = function(ctx)
                            return vim.fn.getcmdtype() == ':'
                            -- enable for inputs as well, with:
                            -- or vim.fn.getcmdtype() == '@'
                        end,

                    }
                }
            },
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = {
                preset = 'enter',
                ['<C-j>'] = { 'scroll_documentation_down', 'fallback' },
                ['<C-k>'] = { 'scroll_documentation_up', 'fallback' }
            },

            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'mono'
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = true, window = { border = 'rounded' } }, menu = { border = 'rounded' } },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
                providers = {
                    cmdline = {
                        min_keyword_length = function(ctx)
                            -- when typing a command, only show when the keyword is 3 characters or longer
                            if ctx.mode == 'cmdline' and string.find(ctx.line, ' ') == nil then return 3 end
                            return 0
                        end
                    }
                }
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },
    { 'L3MON4D3/LuaSnip' },  -- https://github.com/L3MON4D3/LuaSnip
    {
        "j-hui/fidget.nvim", -- https://github.com/j-hui/fidget.nvim
        version = "1.*",
        opts = {},
    }, {
    'stevearc/conform.nvim', -- https://github.com/stevearc/conform.nvim
    config = true,
    opts = {
        format_on_save = {
            timeout_ms = 3000,
            lsp_fallback = true,
        },
        formatters_by_ft = {
            sh = { 'shfmt' },
            html = { 'prettierd' },
            css = { 'prettierd' },
            json = { 'prettierd' },
            jsonc = { 'prettierd' },
            markdown = { 'prettierd' },
            svelte = { "prettierd", "prettier", stop_after_first = true },
            javascript = { 'biome', "prettierd", "prettier", stop_after_first = true },
            typescript = { 'biome', "prettierd", "prettier", stop_after_first = true },
            typescriptreact = { "prettierd", "prettier", stop_after_first = true },
            yaml = { 'prettierd' },
        }
    },
}, {
    "marilari88/twoslash-queries.nvim", -- https://github.com/marilari88/twoslash-queries.nvim
    config = true,
    lazy = true,
    cmd = "TwoslashQueriesInspect",
    keys = {
        {
            "<Leader>it",
            "<CMD>TwoslashQueriesInspect<CR>",
            desc = "[I]nspect [T]ype"
        }
    }
}, {
    'andythigpen/nvim-coverage', -- https://github.com/andythigpen/nvim-coverage
    opts = {
        auto_reload = true,
    },
    config = true,
    keys = {
        {
            "<Leader>cl",
            "<CMD>Coverage<CR>",
            desc = "[C]overage [L]oad"
        },
        {
            "<Leader>ct",
            "<CMD>CoverageToggle<CR>",
            desc = "[C]overage [T]oggle"
        },
        {
            "<Leader>cs",
            "<CMD>CoverageSummary<CR>",
            desc = "[C]overage [S]ummary"
        }

    },
}
}
