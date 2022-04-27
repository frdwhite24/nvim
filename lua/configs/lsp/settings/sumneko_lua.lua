return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			formatting = false,
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
