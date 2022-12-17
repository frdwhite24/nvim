local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup{
  options = {
    show_close_icon = false,
    show_buffer_close_icons = false,
    numbers = "ordinal",
    enforce_regular_tabs = true,
    offsets = {
      {
        filetype = "NvimTree",
        highlight = "Directory",
        text_align = "left"
      }
    },
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end
  }
}
