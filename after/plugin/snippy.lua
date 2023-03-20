local status_ok, snippy = pcall(require, "snippy")
if not status_ok then return end

snippy.setup({
    mappings = {
        is = {["<Tab>"] = "expand_or_advance", ["<S-Tab>"] = "previous"}
    }
})
