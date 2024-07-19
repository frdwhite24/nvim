local additional_grep_args = {
    "--hidden",
    "--smart-case",
    "--iglob=!.git"
}

return {
    {
        "nvim-telescope/telescope.nvim", -- https://github.com/nvim-telescope/telescope.nvim
        dependencies = { 'nvim-lua/plenary.nvim' },
        branch = '0.1.x',
        cmd = "Telescope",
        version = false,
        lazy = true,
        opts = {
            defaults = {
                initial_mode = "insert",
                layout_strategy = "vertical",
                sorting_strategy = 'ascending',
                layout_config = {
                    vertical = {
                        mirror = false,
                        preview_cutoff = 1,
                        prompt_position = "top",
                    },
                },
                path_display = { "truncate" },
                -- winblend = 20,
                color_devicons = true,
                set_env = { ["COLORTERM"] = "truecolor" },
            }
        },
        config = function(_, opts)
            local telescope = require('telescope')
            telescope.setup(opts)
            telescope.load_extension('dir')
        end,
        keys = {
            {
                '<leader>fd',
                function()
                    require("telescope.builtin").diagnostics({ line_width = 99 })
                end,
                desc = "[F]ind [D]iagnostics"
            }, {
            '<leader>fp',
            function()
                require("telescope.builtin").resume()
            end,
            desc = "[F]ind [P]revious search results"
        }, {
            '<leader>fe',
            function()
                require("telescope.builtin").git_status()
            end,
            desc = "[F]ind [E]dited files"
        }, {
            '<leader>fa',
            function()
                require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
            end,
            desc = "[F]ind [A]ll files"
        }, {
            '<leader>ff',
            function()
                require("telescope.builtin").git_files({ show_untracked = true })
            end,
            desc = "[F]ind git [F]iles"
        }, {
            '<leader>fh',
            function()
                require("telescope.builtin").help_tags()
            end,
            desc = "[F]ind Neovim [H]elp"
        }, {
            '<leader>fk',
            function() require("telescope.builtin").keymaps() end,
            desc = "[F]ind [K]eymaps"
        }, {
            '<leader>fo',
            function()
                require("telescope.builtin").oldfiles()
            end,
            desc = "[F]ind [O]ld files"
        }, {
            '<leader>fs',
            function()
                require("telescope.builtin").git_stash()
            end,
            desc = "[F]ind Git [S]tash"
        },
            {
                '<leader>ft',
                vim.cmd.TodoTelescope,
                desc = "[F]ind [T]odo comments"
            }, {
            '<leader>fc',
            function()
                require("telescope.builtin").grep_string({
                    -- these args have been found using rg --help
                    additional_args = additional_grep_args
                })
            end,
            desc = "[F]ind [C]urrent word"
        }, {
            '<leader>fw',
            function()
                require("telescope.builtin").live_grep({
                    -- these args have been found using rg --help
                    additional_args = additional_grep_args
                })
            end,
            desc = "[F]ind [W]ord"
        }, {
            '<leader>fu',
            function()
                require("telescope").extensions.dir.live_grep()
            end,
            desc = "[F]ind word in directory"
        }, {
            '<leader>fi',
            function()
                require("telescope").extensions.dir.find_files()
            end,
            desc = "[F]ind file in directory"
        }
        }
    }, {
    "princejoogie/dir-telescope.nvim", -- https://github.com/princejoogie/dir-telescope.nvim
    dependencies = { "nvim-telescope/telescope.nvim" },
    lazy = true,
},
}
