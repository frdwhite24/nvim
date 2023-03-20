local status_ok, smartyank = pcall(require, "smartyank")
if not status_ok then return end

smartyank.setup({
    highlight = {enabled = true, higroup = "IncSearch", timeout = 175},
    clipboard = {enabled = true}
})
