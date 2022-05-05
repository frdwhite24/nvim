local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		diagnostics.eslint_d,
		code_actions.eslint_d,
		formatting.eslint_d.with({
			condition = function(utils)
				return not utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
			end,
			prefer_local = "node_modules/.bin",
		}),
		formatting.prettier.with({
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
			end,
			filetypes = {
				"yaml",
				"html",
				"css",
				"scss",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
			},
			disabled_filetypes = { "json" },
		}),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
	},
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
      augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      augroup END
      ]])
		end
	end,
})
