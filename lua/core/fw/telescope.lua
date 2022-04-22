local M = {}
M.search_config_nvim = function()
  require('telescope.builtin').find_files({
    prompt_title = "< NVIM RC >",
    cwd = "~/.config/nvim/",
    hidden = true,
  })
end

return M
