local status_ok, lsp_lines = pcall(require, "lsp_lines")
if status_ok then
	lsp_lines.setup()
end
