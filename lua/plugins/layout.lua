HEIGHT_PADDING = 5
WIDTH_PADDING = 15

local symbols = {
    ["!"] = "⊘", -- ignored
    ["?"] = "?", -- untracked
    ["A"] = "✚", -- added
    ["C"] = "C", -- copied
    ["D"] = "✖", -- deleted
    ["M"] = "●", -- modified
    ["R"] = "↻", -- renamed
    ["T"] = "T", -- type changed
    ["U"] = "U", -- unmerged
    [" "] = " ", -- unmodified

}

return {
    {
        "akinsho/bufferline.nvim", -- https://github.com/akinsho/bufferline.nvim
        opts = {
            options = {
                show_close_icon = false,
                show_buffer_close_icons = false,
                numbers = "ordinal",
                enforce_regular_tabs = true,
                offsets = {
                    {
                        filetype = "NvimTree",
                        highlight = "Directory",
                        text_align = "left"
                    }
                },
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count, level, _, _)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end
            }
        }
    }, {
    "hoob3rt/lualine.nvim", -- https://github.com/nvim-lualine/lualine.nvim
    dependencies = "kyazdani42/nvim-web-devicons"
    -- options are still in /after dir, yet to be migrated
}, {
    "kyazdani42/nvim-web-devicons", -- https://github.com/kyazdani42/nvim-web-devicons
}, {
    'stevearc/oil.nvim',            -- https://github.com/stevearc/oil.nvim
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
    config = true,
    keys = {
        { "<Leader>e", "<CMD>lua require('oil').toggle_float()<CR>", desc = "Open file tree" }
    },
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        columns = {
            "icon",
        },
        -- Window-local options to use for oil buffers
        win_options = {
            wrap = false,
            signcolumn = "yes:2",
            cursorcolumn = false,
            foldcolumn = "0",
            spell = false,
            list = false,
            conceallevel = 3,
            concealcursor = "nvic",
        },
        delete_to_trash = false,
        skip_confirm_for_simple_edits = true,
        prompt_save_on_select_new_entry = true,
        watch_for_changes = false,
        -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
        -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
        -- Additionally, if it is a string that matches "actions.<name>",
        -- it will use the mapping at require("oil.actions").<name>
        -- Set to `false` to remove a keymap
        -- See :help oil-actions for a list of all available actions
        keymaps = {
            ["g?"] = { "actions.show_help", mode = "n" },
            ["<CR>"] = "actions.select",
            ["<C-s>"] = { "actions.select", opts = { vertical = true } },
            ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
            ["<C-t>"] = { "actions.select", opts = { tab = true } },
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = { "actions.close", mode = "n" },
            ["<C-l>"] = "actions.refresh",
            ["-"] = { "actions.parent", mode = "n" },
            ["_"] = { "actions.open_cwd", mode = "n" },
            ["`"] = { "actions.cd", mode = "n" },
            ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
            ["gs"] = { "actions.change_sort", mode = "n" },
            ["gx"] = "actions.open_external",
            ["g."] = { "actions.toggle_hidden", mode = "n" },
            ["g\\"] = { "actions.toggle_trash", mode = "n" },
        },
        view_options = {
            show_hidden = true,
        },
        preview_win = {
            update_on_cursor_moved = true,
        },
    }
}, {
    "refractalize/oil-git-status.nvim",
    dependencies = {
        "stevearc/oil.nvim",
    },
    config = true,
    opts = {
        show_ignored = true,
        symbols = {
            index = symbols,
            working_tree = symbols,
        },

    }
}, {
    "JezerM/oil-lsp-diagnostics.nvim",
    dependencies = { "stevearc/oil.nvim" },
    opts = {}
}, {
    "petertriho/nvim-scrollbar", -- https://github.com/petertriho/nvim-scrollbar
    dependencies = { "kevinhwang91/nvim-hlslens" },
    config = function()
        require('scrollbar').setup({
            excluded_filetypes = {
                "NvimTree",
            },
        })
        require("scrollbar.handlers.search").setup({
            override_lens = function()
            end
        })
    end
}, {
    "folke/trouble.nvim", -- https://github.com/folke/trouble.nvim
    cmd = "TroubleToggle",
    lazy = true,
    dependencies = "kyazdani42/nvim-web-devicons",
    opts = { padding = false, use_diagnostic_signs = true },
    keys = {
        {
            "<Leader>x",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Toggle language diagnostics bottom bar"
        }
    }
}, {
    'mbbill/undotree', -- https://github.com/mbbill/undotree
    config = true,
    lazy = true,
    cmd = "UndotreeToggle",
    keys = {
        {
            "<Leader>u",
            "<CMD>UndotreeToggle<CR>",
            desc = "[U]ndo tree toggle"
        }
    }
},
    {
        "m4xshen/smartcolumn.nvim", -- https://github.com/m4xshen/smartcolumn.nvim
        opts = {
            disabled_filetypes = {
                "help",
                'lazy', -- lazy install window
                'qf',   -- quick fix list
                "text",
                "markdown",
                'javascriptreact',
                'typescriptreact',
                'javascript',
                'typescript',
                "svelte",
                'lua',
            },
            custom_colorcolumn = {
                python = "88"
            }
        }
    },
}
