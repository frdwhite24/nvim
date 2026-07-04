local M = {}

local function lua_ls_settings()
    local runtime_path = vim.split(package.path, ";")
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

    return {
        Lua = {
            telemetry = { enable = false },
            runtime = {
                version = "LuaJIT",
                path = runtime_path,
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.stdpath("config") .. "/lua",
                },
            },
            hint = { enable = true },
        },
    }
end

function M.setup()
    vim.lsp.config("lua_ls", {
        settings = lua_ls_settings(),
    })

    -- nvim-lspconfig default calls vim.lsp.codelens.enable (removed in 0.11)
    vim.lsp.config("terraformls", {
        on_attach = function(client, bufnr)
            if not client:supports_method("textDocument/codeLens") then
                return
            end
            vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
                buffer = bufnr,
                callback = function()
                    vim.lsp.codelens.refresh({ bufnr = bufnr })
                end,
            })
        end,
    })
end

return M
