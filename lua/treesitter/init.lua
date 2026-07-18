local M = {}

M.parsers = {
    "bash",
    "css",
    "diff",
    "dockerfile",
    "graphql",
    "hcl",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "svelte",
    "tsx",
    "typescript",
    "yaml",
}

local augroup = vim.api.nvim_create_augroup("UserTreesitter", { clear = true })

local function language_for_buf(buf)
    local ft = vim.api.nvim_buf_get_option(buf, "filetype")
    if ft == "" then
        return nil
    end
    return vim.treesitter.language.get_lang(ft) or ft
end

local function should_highlight(buf)
    if vim.bo[buf].buftype ~= "" then
        return false
    end
    return language_for_buf(buf) ~= nil
end

function M.start_highlight(buf)
    if not should_highlight(buf) then
        return
    end
    local language = language_for_buf(buf)
    if not language then
        return
    end
    if not vim.treesitter.language.add(language) then
        require("nvim-treesitter").install({ language })
        return
    end
    vim.treesitter.start(buf, language)
end

function M.setup()
    require("nvim-treesitter").setup()
    require("nvim-treesitter").install(M.parsers)

    vim.api.nvim_create_autocmd("FileType", {
        group = augroup,
        callback = function(args)
            M.start_highlight(args.buf)
        end,
    })
end

return M
