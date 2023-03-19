local status_ok, gitlinker = pcall(require, "gitlinker")
if status_ok then gitlinker.setup({mappings = nil}) end
