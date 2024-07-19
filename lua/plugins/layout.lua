HEIGHT_PADDING = 5
WIDTH_PADDING = 15

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
    "kyazdani42/nvim-tree.lua",     -- https://github.com/kyazdani42/nvim-tree.lua
    cmd = "NvimTreeToggle",
    keys = {
        { "<leader>e", "<CMD>NvimTreeToggle<CR>", desc = "Toggle file tree" }
    },
    opts = {
        hijack_cursor = true,
        auto_reload_on_write = true,
        git = {
            enable = true,
            show_on_dirs = false,
            timeout = 500,
            ignore = false
        },
        diagnostics = {
            enable = true,
            show_on_dirs = false
        },
        modified = {
            enable = true,
            show_on_dirs = false
        },
        renderer = {
            group_empty = true,
            root_folder_label = false,
            highlight_diagnostics = "name",
            indent_markers = {
                enable = true,

            },
            icons = {
                git_placement = "after",
                diagnostics_placement = "after",
                modified_placement = "after",
            }
        },
        update_focused_file = { enable = true, update_cwd = false },
        view = {
            centralize_selection = true,
            adaptive_size = false,
            side = 'right',
            number = false,
            relativenumber = true,
            signcolumn = "no",
            float = {
                enable = true,
                open_win_config = function()
                    local screen_w = vim.opt.columns:get()
                    local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                    local window_w_f = (screen_w - WIDTH_PADDING * 2) / 1
                    local window_w = math.floor(window_w_f)
                    local window_h = screen_h - HEIGHT_PADDING * 2
                    local center_x = WIDTH_PADDING - 1
                    local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()

                    return {
                        border = "single",
                        relative = "editor",
                        row = center_y,
                        col = center_x,
                        width = window_w,
                        height = window_h,
                    }
                end
            },
            width = function()
                return vim.opt.columns:get() - WIDTH_PADDING * 2
            end
        },
        actions = { open_file = { quit_on_open = true } }
    }
}
}
