local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end
local builtin = require('telescope.builtin')
local fw = require('core.fw.telescope')

vim.keymap.set('n', '<leader>fb', telescope.extensions.bookmarks.bookmarks, {})
vim.keymap.set('n', '<leader>fc', fw.search_config_nvim, {})
vim.keymap.set('n', '<leader>fd', function()
  builtin.diagnostics({ line_width = 99 })
end, {})
vim.keymap.set('n', '<leader>fe', builtin.git_status, {})
vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files({ hidden = true })
end, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>fn', telescope.extensions.notify.notify, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fs', builtin.git_stash, {})
vim.keymap.set('n', '<leader>ft', vim.cmd.TodoTelescope, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})

telescope.setup({
  extensions = {
    bookmarks = {
      selected_browser = "brave",
    },
  },
})

telescope.load_extension("bookmarks")
