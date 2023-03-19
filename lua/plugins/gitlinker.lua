return {
    "ruifm/gitlinker.nvim", -- https://github.com/ruifm/gitlinker.nvim
    keys = {
        {
            "<leader>gl",
            "<CMD>lua require('gitlinker').get_buf_range_url('n')<CR>",
            desc = "Remote line link"
        }, {
            "<leader>gy",
            "<CMD>lua require('gitlinker').get_buf_range_url('v')<CR>",
            desc = "Remote range link"
        }
    }
}
