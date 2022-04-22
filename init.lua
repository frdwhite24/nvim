require("core.settings")
require("core.plugins")
require("core.mappings")
require("core.autocommands")
require("core.fw.symbols_outline")
require("core.colourscheme")

-- Speed up loading Lua modules in Neovim to improve startup time.
-- impatient needs to be setup before any other lua plugin is loaded
local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  return
end

require("configs.alpha")
require("configs.autopairs")
require("configs.bufferline")
require("configs.cmp")
require("configs.colorizer")
require("configs.dim")
require("configs.gitlinker")
require("configs.gitsigns")
require("configs.indent_blankline")
require("configs.lsp")
require("configs.lualine")
require("configs.todo")
require("configs.tree")
require("configs.treesitter")
