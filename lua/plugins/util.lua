return {
    {
        "dstein64/vim-startuptime", -- https://github.com/dstein64/vim-startuptime
        cmd = "StartupTime",
        init = function() vim.g.startuptime_tries = 10 end
    }, {
    "chrishrb/gx.nvim", -- https://github.com/chrishrb/gx.nvim
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    init = function()
        vim.g.netrw_nogx = 1                    -- disable netrw gx
    end,
    dependencies = { "nvim-lua/plenary.nvim" }, -- Required for Neovim < 0.10.0
    config = true,
} }
