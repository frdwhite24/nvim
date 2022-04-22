local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

indent_blankline.setup {
  filetype_exclude = { "alpha" },
  show_current_context = true,
}
