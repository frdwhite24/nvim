local status_ok, trouble = pcall(require, "trouble")
if not status_ok then return end

trouble.setup {padding = false, use_diagnostic_signs = true}

vim.keymap.set("n", "<leader>x", vim.cmd.TroubleToggle, {})
