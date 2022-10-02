return {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off",
			},
			-- pythonPath = "/home/fred/.cache/pypoetry/virtualenvs/facts-pPGOMSte-py3.10/bin/python3.10",
			pythonPath = vim.fn.system("poetry env info -p"),
		},
	},
}
