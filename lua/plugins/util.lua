return {
    {
        "dstein64/vim-startuptime", -- https://github.com/dstein64/vim-startuptime
        cmd = "StartupTime",
        init = function() vim.g.startuptime_tries = 10 end
    }
}
