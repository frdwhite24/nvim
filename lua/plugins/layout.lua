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
                diagnostics_indicator = function(count, level, diagnostics_dict,
                                                 context)
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
},
    {
        "rcarriga/nvim-notify", -- https://github.com/rcarriga/nvim-notify
        config = function()
            vim.notify = require('notify')
        end
    }
}
