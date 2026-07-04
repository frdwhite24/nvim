local ensure_installed = {
    "terraformls",
    "vtsls",
    "eslint",
    "svelte",
    "lua_ls",
    "cssls",
    "html",
    "jsonls",
    "bashls",
    "yamlls",
}

local M = {}

local augroup = vim.api.nvim_create_augroup("UserLspAttach", { clear = true })

function M.setup_attach()
    vim.api.nvim_create_autocmd("LspAttach", {
        group = augroup,
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if not client then
                return
            end
            require("lsp.on_attach").setup(client, args.buf)
        end,
    })
end

function M.setup()
    require("lsp.signs").setup()
    require("lsp.servers").setup()
    M.setup_attach()

    require("mason").setup({
        ui = { border = "rounded" },
    })

    require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
    })
end

return M
