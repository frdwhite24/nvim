return {
    {
        "ruifm/gitlinker.nvim", -- https://github.com/ruifm/gitlinker.nvim
        requires = 'nvim-lua/plenary.nvim',
        lazy = true,
        keys = {
            {
                "<Leader>gl",
                "<CMD>lua require('gitlinker').get_buf_range_url('n')<CR>",
                desc = "Remote line link"
            }, {
            "<Leader>gy",
            "<CMD>lua require('gitlinker').get_buf_range_url('v')<CR>",
            mode = "v",
            desc = "Remote range link"
        }
        },
        opts = { mappings = nil }
    }, {
    "lewis6991/gitsigns.nvim", -- https://github.com/lewis6991/gitsigns.nvim
    dependencies = { "petertriho/nvim-scrollbar" },
    opts = {
        signs               = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        signcolumn          = true,
        numhl               = true,
        linehl              = false,
        word_diff           = false,
        watch_gitdir        = {
            follow_files = true,
            interval = 1000
        },
        auto_attach         = true,
        attach_to_untracked = true,
        current_line_blame  = false,
        sign_priority       = 6,
        update_debounce     = 100,
        status_formatter    = nil,   -- Use default
        max_file_length     = 40000, -- Disable if file is longer than this (in lines)
        preview_config      = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
        },
        on_attach           = function(bufnr)
            local gitsigns = require('gitsigns')

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', ']c', function()
                if vim.wo.diff then
                    vim.cmd.normal({ ']c', bang = true })
                else
                    gitsigns.nav_hunk('next')
                end
            end)

            map('n', '[c', function()
                if vim.wo.diff then
                    vim.cmd.normal({ '[c', bang = true })
                else
                    gitsigns.nav_hunk('prev')
                end
            end)

            -- Actions
            map('n', '<Leader>hs', gitsigns.stage_hunk)
            map('n', '<Leader>hr', gitsigns.reset_hunk)
            map('v', '<Leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
            map('v', '<Leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
            map('n', '<Leader>hS', gitsigns.stage_buffer)
            map('n', '<Leader>hu', gitsigns.undo_stage_hunk)
            map('n', '<Leader>hR', gitsigns.reset_buffer)
            map('n', '<Leader>hp', gitsigns.preview_hunk)
            map('n', '<Leader>hb', function() gitsigns.blame_line { full = true } end)
            map('n', '<Leader>tb', gitsigns.toggle_current_line_blame)
            map('n', '<Leader>hd', gitsigns.diffthis)
            map('n', '<Leader>hD', function() gitsigns.diffthis('~') end)
            map('n', '<Leader>td', gitsigns.toggle_deleted)

            -- Text object
            map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')

            require('gitsigns').setup()
            require("scrollbar.handlers.gitsigns").setup()
        end
    },

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
            "<Leader>go",
            "<CMD>GitBlameOpenCommitURL<CR>",
            desc = "Open commit URL"
        }
    }
}
}
