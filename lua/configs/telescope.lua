local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.setup({
	extensions = {
		bookmarks = {
			selected_browser = "brave",
			url_open_command = "xdg-open",
		},
	},
})

telescope.load_extension("bookmarks")
