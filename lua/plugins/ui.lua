return {

    {"akinsho/bufferline.nvim"}, {"hoob3rt/lualine.nvim"}, -- https://github.com/nvim-lualine/lualine.nvim
    {
        "kyazdani42/nvim-web-devicons", -- https://github.com/kyazdani42/nvim-web-devicons
        lazy = true
    }, {
        "kyazdani42/nvim-tree.lua", -- https://github.com/kyazdani42/nvim-tree.lua
        keys = {
            {"<leader>e", "<CMD>NvimTreeToggle<CR>", desc = "Toggle file tree"}
        }
    }
}
