return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            require('lsp').setup()
        end,
    },
    {
        'saghen/blink.cmp',
        version = '1.*',
        dependencies = { 'rafamadriz/friendly-snippets' },
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
                        end,
                    },
                },
            },
            keymap = {
                preset = 'enter',
                ['<C-j>'] = { 'scroll_documentation_down', 'fallback' },
                ['<C-k>'] = { 'scroll_documentation_up', 'fallback' },
            },
            appearance = {
                nerd_font_variant = 'mono',
            },
            completion = {
                documentation = { auto_show = true, window = { border = 'rounded' } },
                menu = { border = 'rounded' },
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
                providers = {
                    cmdline = {
                        min_keyword_length = function(ctx)
                            if ctx.mode == 'cmdline' and string.find(ctx.line, ' ') == nil then
                                return 3
                            end
                            return 0
                        end,
                    },
                },
            },
            fuzzy = { implementation = 'prefer_rust_with_warning' },
        },
        opts_extend = { 'sources.default' },
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
}
}
