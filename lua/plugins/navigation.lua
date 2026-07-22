local additional_grep_args = {
    "--hidden",
    "--smart-case",
    "--iglob=!.git"
}

return {
    {
        "nvim-telescope/telescope.nvim", -- https://github.com/nvim-telescope/telescope.nvim
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-mini/mini.icons' },
        branch = 'master',
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
                '<Leader>fd',
                function()
                    require("telescope.builtin").diagnostics({ line_width = 99 })
                end,
                desc = "[F]ind [D]iagnostics"
            }, {
            '<Leader>fp',
            function()
                require("telescope.builtin").resume()
            end,
            desc = "[F]ind [P]revious search results"
        }, {
            '<Leader>fe',
            function()
                require("telescope.builtin").git_status()
            end,
            desc = "[F]ind [E]dited files"
        }, {
            '<Leader>fa',
            function()
                require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
            end,
            desc = "[F]ind [A]ll files"
        }, {
            '<Leader>ff',
            function()
                require("telescope.builtin").git_files({ show_untracked = true })
            end,
            desc = "[F]ind git [F]iles"
        }, {
            '<Leader>fh',
            function()
                require("telescope.builtin").help_tags()
            end,
            desc = "[F]ind Neovim [H]elp"
        }, {
            '<Leader>fk',
            function() require("telescope.builtin").keymaps() end,
            desc = "[F]ind [K]eymaps"
        }, {
            '<Leader>fo',
            function()
                require("telescope.builtin").oldfiles()
            end,
            desc = "[F]ind [O]ld files"
        }, {
            '<Leader>fs',
            function()
                require("telescope.builtin").git_stash()
            end,
            desc = "[F]ind Git [S]tash"
        },
            {
                '<Leader>ft',
                vim.cmd.TodoTelescope,
                desc = "[F]ind [T]odo comments"
            }, {
            '<Leader>fc',
            function()
                require("telescope.builtin").grep_string({
                    -- these args have been found using rg --help
                    additional_args = additional_grep_args
                })
            end,
            desc = "[F]ind [C]urrent word"
        }, {
            '<Leader>fw',
            function()
                require("telescope.builtin").live_grep({
                    -- these args have been found using rg --help
                    additional_args = additional_grep_args
                })
            end,
            desc = "[F]ind [W]ord"
        }, {
            '<Leader>fu',
            function()
                require("telescope").extensions.dir.live_grep()
            end,
            desc = "[F]ind word in directory"
        }, {
            '<Leader>fi',
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
    {
        "dzfrias/arena.nvim",
        event = "BufWinEnter",
        config = true,
        opts = {
            ignore_current = true
        },
        keys = { {
            '<Leader>b',
            "<CMD>ArenaToggle<CR>",
            desc = "Find last open [B]uffers"
        } }
    },
    {
        "stevearc/aerial.nvim",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-mini/mini.icons",
        },
        opts = {
            attach_mode = "global",
            autojump = false,
            highlight_on_jump = 300,
            close_automatic_events = {},
            ignore = {
                filetypes = {
                    "aerial",
                    "help",
                    "lazy",
                    "oil",
                    "qf",
                    "TelescopePrompt",
                },
            },
            layout = {
                min_width = 25,
                max_width = { 40, 0.25 },
                default_direction = "prefer_right",
            },
        },
        config = function(_, opts)
            local MIN_LINES = 50

            local function should_auto_show(bufnr)
                bufnr = bufnr or vim.api.nvim_get_current_buf()
                if vim.bo[bufnr].filetype == "aerial" or vim.bo[bufnr].buftype ~= "" then
                    return false
                end
                local aerial = require("aerial")
                return vim.api.nvim_buf_line_count(bufnr) > MIN_LINES
                    or aerial.num_symbols(bufnr) > 1
            end

            local function sync_auto_visibility(bufnr)
                if bufnr ~= vim.api.nvim_get_current_buf() then
                    return
                end
                if vim.bo[bufnr].filetype == "aerial" or vim.bo[bufnr].buftype ~= "" then
                    return
                end
                vim.schedule(function()
                    if bufnr ~= vim.api.nvim_get_current_buf() then
                        return
                    end
                    local aerial = require("aerial")
                    if should_auto_show(bufnr) then
                        if not aerial.is_open() then
                            require("aerial.window").maybe_open_automatic(bufnr)
                        end
                    elseif aerial.is_open() then
                        aerial.close()
                    end
                end)
            end

            opts.open_automatic = should_auto_show
            opts.on_first_symbols = sync_auto_visibility
            require("aerial").setup(opts)

            local aerial_augroup = vim.api.nvim_create_augroup("aerial_auto_show", { clear = true })

            vim.api.nvim_create_autocmd("BufEnter", {
                group = aerial_augroup,
                callback = function(args)
                    sync_auto_visibility(args.buf)
                end,
            })

            -- Aerial's built-in last-window quit only fires when cmdline history
            -- looks like :q/:wq/:x. Close aerial in QuitPre so :q on the final
            -- code window exits Neovim instead of leaving a full-screen outline.
            vim.api.nvim_create_autocmd("QuitPre", {
                group = aerial_augroup,
                desc = "Close aerial when quitting the last code window",
                callback = function()
                    local aerial_wins = {}
                    local code_wins = 0
                    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
                        if vim.api.nvim_win_get_config(win).relative == "" then
                            local buf = vim.api.nvim_win_get_buf(win)
                            if vim.bo[buf].filetype == "aerial" then
                                table.insert(aerial_wins, win)
                            else
                                code_wins = code_wins + 1
                            end
                        end
                    end
                    if code_wins == 1 and #aerial_wins > 0 and vim.bo.filetype ~= "aerial" then
                        for _, win in ipairs(aerial_wins) do
                            if vim.api.nvim_win_is_valid(win) then
                                vim.api.nvim_win_close(win, true)
                            end
                        end
                    end
                end,
            })
        end,
        keys = {
            {
                "<Leader>a",
                "<cmd>AerialToggle!<CR>",
                desc = "Toggle symbol outline",
            },
            { "]a", "<cmd>AerialNext<CR>", desc = "Next symbol" },
            { "[a", "<cmd>AerialPrev<CR>", desc = "Previous symbol" },
            {
                "]]",
                function() require("aerial").next_up() end,
                desc = "Next parent symbol",
            },
            {
                "[[",
                function() require("aerial").prev_up() end,
                desc = "Previous parent symbol",
            },
        },
    },
}
