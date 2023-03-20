return {
    {
        "ruifm/gitlinker.nvim", -- https://github.com/ruifm/gitlinker.nvim
        keys = {
            {
                "<leader>gl",
                "<CMD>lua require('gitlinker').get_buf_range_url('n')<CR>",
                desc = "Remote line link"
            }, {
            "<leader>gy",
            "<CMD>lua require('gitlinker').get_buf_range_url('v')<CR>",
            mode = "v",
            desc = "Remote range link"
        }
        },
        opts = {
            mappings = nil
        }
    }, {
    "lewis6991/gitsigns.nvim",     -- https://github.com/lewis6991/gitsigns.nvim
    dependencies = { "petertriho/nvim-scrollbar" }
}
}
