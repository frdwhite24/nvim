local status_ok, null_ls = pcall(require, "null-ls")

if not status_ok then
  return
end

local sources = {
  null_ls.builtins.formatting.prettier
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 1000 })
      end
    })
  end
end

null_ls.setup({
  sources = sources,
  on_attach = on_attach
})
