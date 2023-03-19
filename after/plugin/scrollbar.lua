local status_ok, scrollbar = pcall(require, "scrollbar")
if not status_ok then
	return
end

scrollbar.setup({
	excluded_filetypes = {
		"alpha",
	},
})

require("scrollbar.handlers.search").setup({
	override_lens = function() end,
})
