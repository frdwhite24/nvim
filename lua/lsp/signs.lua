local M = {}

function M.setup()
    local ds = vim.diagnostic.severity
    vim.diagnostic.config({
        signs = {
            text = {
                [ds.ERROR] = "",
                [ds.WARN] = "",
                [ds.HINT] = "",
                [ds.INFO] = "",
            },
        },
    })
end

return M
