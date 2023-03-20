return {
    {"akinsho/bufferline.nvim"}, -- https://github.com/akinsho/bufferline.nvim
    {
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
            {"<leader>e", "<CMD>NvimTreeToggle<CR>", desc = "Toggle file tree"}
        },
        opts = {
            open_on_setup = false,
            auto_reload_on_write = true,
            update_focused_file = {enable = true, update_cwd = false},
            git = {enable = true, ignore = false, timeout = 500},
            view = {
                width = 60,
                hide_root_folder = true,
                side = 'right',
                number = false,
                relativenumber = true,
                signcolumn = "no"
            },
            actions = {open_file = {quit_on_open = true}}
        }
    }, {
        "petertriho/nvim-scrollbar", -- https://github.com/petertriho/nvim-scrollbar
        dependencies = {"kevinhwang91/nvim-hlslens"}
    }
}
