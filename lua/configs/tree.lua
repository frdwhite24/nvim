local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvim_tree.setup {
  open_on_setup        = false,
  auto_reload_on_write = true,
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  view = {
    width = 60,
    height = 30,
    hide_root_folder = true,
    side = 'right',
    number = false,
    relativenumber = true,
    signcolumn = "no"
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  },
}
