return {
    {
        "ruifm/gitlinker.nvim", -- https://github.com/ruifm/gitlinker.nvim
        lazy = true,
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
        opts = { mappings = nil }
    }, {
    "lewis6991/gitsigns.nvim", -- https://github.com/lewis6991/gitsigns.nvim
    dependencies = { "petertriho/nvim-scrollbar" },
    -- options are still in /after dir, yet to be migrated
}, {
    "f-person/git-blame.nvim", -- https://github.com/f-person/git-blame.nvim#configuration
    lazy = false,
    opts = {
        enabled = 1,
        display_virtual_text = 1,
        delay = 1000,
        set_extmark_options = { -- this solves the git blame overriding cursorline highlighting
            hl_mode = "combine"
        },
        date_format = '(%r) • %d/%m/%y',
        message_template = '  <author> <date> • <summary>'
    },
    keys = {
        {
            "<leader>go",
            "<CMD>GitBlameOpenCommitURL<CR>",
            desc = "Open commit URL"
        }
    }
}
}
