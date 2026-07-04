local M = {}

function M.setup(client, bufnr)
    local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
    end

    map("n", "K", function() vim.lsp.buf.hover() end, "Hover documentation")
    map("n", "gs", function() vim.lsp.buf.signature_help() end, "Show function signature")
    map("n", "<F2>", function() vim.lsp.buf.rename() end, "Rename symbol")
    map("n", "<F3>", function() vim.lsp.buf.format({ async = true }) end, "Format file")
    map("x", "<F3>", function() vim.lsp.buf.format({ async = true }) end, "Format selection")

    local builtin = require("telescope.builtin")
    map("n", "gr", function() builtin.lsp_references({ show_line = false }) end, "[G]o to [R]eferences")
    map("n", "gd", function() builtin.lsp_definitions({ show_line = false }) end, "[G]o to [D]efinition")
    map("n", "gD", function() builtin.lsp_type_definitions({ show_line = false }) end, "[G]o to type [D]efinition")
    map("n", "gl", function() vim.diagnostic.open_float() end, "[G]et [L]ine diagnostic")
    map("n", "<Leader>ca", function() vim.lsp.buf.code_action() end, "[C]ode [A]ctions")
    map("n", "gi", function() builtin.lsp_implementations({ show_line = false }) end, "[G]o to [I]mplementation")

    if client.name == "vtsls" or client.name == "svelte" then
        require("twoslash-queries").attach(client, bufnr)
    end
end

return M
