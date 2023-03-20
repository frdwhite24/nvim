local status_ok, telescope = pcall(require, "telescope")
if not status_ok then return end
local builtin = require('telescope.builtin')
local fw = require('core.fw.telescope')

vim.keymap.set('n', '<leader>fb', telescope.extensions.bookmarks.bookmarks,
               {desc = "[F]ind [B]ookmarks"})
vim.keymap.set('n', '<leader>fc', fw.search_config_nvim,
               {desc = "[F]ind Neovim [C]onfig"})
vim.keymap.set('n', '<leader>fd',
               function() builtin.diagnostics({line_width = 99}) end,
               {desc = "[F]ind [D]iagnostics"})
vim.keymap.set('n', '<leader>fe', builtin.git_status,
               {desc = "[F]ind [E]dited files"})
vim.keymap.set('n', '<leader>ff',
               function() builtin.find_files({hidden = true}) end,
               {desc = "[F]ind [F]iles"})
vim.keymap.set('n', '<leader>fg', builtin.git_files,
               {desc = "[F]ind [G]it files"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags,
               {desc = "[F]ind Neovim [H]elp"})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {desc = "[F]ind [K]eymaps"})
vim.keymap.set('n', '<leader>fn', telescope.extensions.notify.notify,
               {desc = "[F]ind [N]otify messages"})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles,
               {desc = "[F]ind [O]ld files"})
vim.keymap.set('n', '<leader>fs', builtin.git_stash,
               {desc = "[F]ind Git [S]tash"})
vim.keymap.set('n', '<leader>ft', vim.cmd.TodoTelescope,
               {desc = "[F]ind [T]odo comments"})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {desc = "[F]ind [W]ord"})

telescope.setup({extensions = {bookmarks = {selected_browser = "brave"}}})

telescope.load_extension("bookmarks")
