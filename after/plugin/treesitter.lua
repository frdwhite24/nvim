local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter.setup({
  ensure_installed = {
    "bash",
    "dockerfile",
    "graphql",
    "html",
    "help",
    "javascript",
    "json",
    "lua",
    "php",
    "python",
    "markdown",
    "rust",
    "css",
    "scss",
    "tsx",
    "typescript",
    "yaml",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
