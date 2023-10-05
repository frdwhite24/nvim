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
}, {
    "kyazdani42/nvim-web-devicons", -- https://github.com/kyazdani42/nvim-web-devicons
    lazy = true
}, {
    "kyazdani42/nvim-tree.lua", -- https://github.com/kyazdani42/nvim-tree.lua
    lazy = true,
    cmd = "NvimTreeToggle",
    commit = "94e3b0990017a42fa4581ea3d0bc08b897727d4d",
    keys = {
        { "<leader>e", "<CMD>NvimTreeToggle<CR>", desc = "Toggle file tree" }
    },
    opts = {
        open_on_setup = false,
        auto_reload_on_write = true,
        update_focused_file = { enable = true, update_cwd = false },
        git = { enable = true, ignore = false, timeout = 500 },
        view = {
            width = 60,
            hide_root_folder = true,
            side = 'right',
            number = false,
            relativenumber = true,
            signcolumn = "no"
        },
        actions = { open_file = { quit_on_open = true } }
    }
}, {
    "petertriho/nvim-scrollbar", -- https://github.com/petertriho/nvim-scrollbar
    dependencies = { "kevinhwang91/nvim-hlslens" },
    config = function()
        require('scrollbar').setup()
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
            "<leader>x",
            "<CMD>TroubleToggle<CR>",
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
            "<leader>u",
            "<CMD>UndotreeToggle<CR>",
            desc = "[U]ndo tree toggle"
        }
    }
},
    {
        "m4xshen/smartcolumn.nvim",
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
                'lua',
            },
            custom_colorcolumn = {
                python = "88"
            }
        }
    },
}
