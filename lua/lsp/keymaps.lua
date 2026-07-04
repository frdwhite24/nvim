local M = {}

function M.setup()
    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", "<C-p>", function()
        vim.diagnostic.jump({ count = -1, float = true })
    end, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))

    vim.keymap.set("n", "<C-n>", function()
        vim.diagnostic.jump({ count = 1, float = true })
    end, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))

    vim.keymap.set("n", "<Leader>lr", ":LspRestart<CR>",
        { desc = "Restart language server" })
end

return M
