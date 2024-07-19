return {
    { 'williamboman/mason.nvim' },           -- https://github.com/williamboman/mason.nvim
    { 'williamboman/mason-lspconfig.nvim' }, -- https://github.com/williamboman/mason-lspconfig.nvim
    {
        'VonHeikemen/lsp-zero.nvim',         -- https://github.com/VonHeikemen/lsp-zero.nvim
        branch = 'v3.x',
        config = function()
            local lsp_zero = require('lsp-zero')
            local builtin = require("telescope.builtin")

            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(_, bufnr)
                lsp_zero.default_keymaps({
                    buffer = bufnr,
                    -- preserve_mappings = false -- will force key bindings if they're already taken
                })

                vim.keymap.set('n', 'gr', function() builtin.lsp_references({ show_line = false }) end,
                    { buffer = bufnr, desc = "[G]o to [R]eferences" })
                vim.keymap.set('n', 'gd', function() builtin.lsp_definitions({ show_line = false }) end,
                    { buffer = bufnr, desc = "[G]o to [D]efinition" })
                vim.keymap.set('n', 'gD', function() builtin.lsp_type_definitions({ show_line = false }) end,
                    { buffer = bufnr, desc = "[G]o to type [D]efinition" })
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help,
                    { buffer = bufnr, desc = "Signature documentation" })
                vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>',
                    { buffer = bufnr, desc = "[G]et [L]ine diagnostic" })
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = "[C]ode [A]ctions" })
            end)

            lsp_zero.set_sign_icons({
                warn = "",
                error = "",
                hint = "",
                info = ""
            })

            require('mason').setup({
                ui = {
                    border = "rounded"
                }
            })

            require('mason-lspconfig').setup({
                -- Find more servers here: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
                ensure_installed = {
                    "vtsls",
                    "eslint",
                    "svelte",
                    "lua_ls",
                    "rust_analyzer",
                    "pyright",
                    "cssls",
                    "html",
                    "jsonls",
                    "taplo",
                    "bashls",
                    -- "shfmt", -- this requires manual install as it's not a valid entry in this table for some reason
                    -- "clang-format" -- this requires manual install as it's not a valid entry in this table for some reason
                    "yamlls",
                    "jdtls",
                },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                    pyright = function()
                        require('lspconfig').pyright.setup({
                            python = {
                                analysis = {
                                    useLibraryCodeForTypes = false
                                }
                            }

                        })
                    end,
                    -- This came from the lsp-zero setup guide, suggestions that lua_ls has some issues if not done
                    -- https://lsp-zero.netlify.app/v3.x/guide/neovim-lua-ls.html#fixed-config
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls({
                            settings = {
                                Lua = {
                                    hint = {
                                        enable = true,
                                    }
                                }
                            }
                        })
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                }
            })
        end
    },
    { 'neovim/nvim-lspconfig' },            -- https://github.com/neovim/nvim-lspconfig
    {
        'hrsh7th/nvim-cmp',                 -- https://github.com/hrsh7th/nvim-cmp
        dependencies = {
            "hrsh7th/cmp-nvim-lua",         -- https://github.com/hrsh7th/cmp-nvim-lua
            "hrsh7th/cmp-path",             -- https://github.com/hrsh7th/cmp-path
            "hrsh7th/cmp-nvim-lsp",         -- https://github.com/hrsh7th/cmp-nvim-lsp
            "hrsh7th/cmp-buffer",           -- https://github.com/hrsh7th/cmp-buffer
            "saadparwaiz1/cmp_luasnip",     -- https://github.com/saadparwaiz1/cmp_luasnip
            "rafamadriz/friendly-snippets", -- https://github.com/rafamadriz/friendly-snippets
        },
        config = function()
            local cmp = require('cmp')
            local cmp_action = require('lsp-zero').cmp_action()
            local cmp_format = require('lsp-zero').cmp_format({ details = true })
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')

            require('luasnip.loaders.from_vscode').lazy_load()

            -- this inserts () after selecting a function or method item
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )

            cmp.setup({
                sources = {
                    { name = 'nvim_lua' },
                    { name = 'path' },
                    { name = 'nvim_lsp' },
                    { name = 'buffer',  keyword_length = 3 },
                    { name = 'luasnip', keyword_length = 2 },
                },
                formatting = cmp_format,
                preselect = 'item',
                completion = {
                    completeopt = 'menu,menuone,noinsert'
                },
                mapping = cmp.mapping.preset.insert({
                    -- NEW MAPPINGS
                    -- Trying out the super tab configuration
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    -- ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp_action.luasnip_supertab(),
                    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-l>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-h>'] = cmp.mapping.scroll_docs(4),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                    ['<C-e>'] = cmp.mapping.abort(),
                }),
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
            })
        end
    },
    { 'L3MON4D3/LuaSnip' },  -- https://github.com/L3MON4D3/LuaSnip
    {
        "j-hui/fidget.nvim", -- https://github.com/j-hui/fidget.nvim
        config = true,
        tag = 'legacy'
    }, {
    'stevearc/conform.nvim', -- https://github.com/stevearc/conform.nvim
    config = true,
    opts = {
        format_on_save = {
            timeout_ms = 3000,
            lsp_fallback = true,
        },
        formatters_by_ft = {
            python = { "black" },
            sh = { 'shfmt' },
            html = { 'prettierd' },
            css = { 'prettierd' },
            json = { 'prettierd' },
            jsonc = { 'prettierd' },
            markdown = { 'prettierd' },
            java = { "prettier" },
            svelte = { { "prettierd", "prettier" } },
            javascript = { { "prettierd", "prettier" } },
            typescript = { { "prettierd", "prettier" } },
            typescriptreact = { { "prettierd", "prettier" } },
            yaml = { 'prettierd' },
        }
    },
},
}
