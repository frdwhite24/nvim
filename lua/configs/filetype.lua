local status_ok, filetype = pcall(require, "filetype")
if not status_ok then
  return
end

if vim.fn.has "nvim-0.6" == 0 then
  vim.g.did_load_filetypes = 1
end
