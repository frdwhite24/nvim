require("core.settings")
require("core.plugins")
require("core.mappings")
require("core.autocommands")
require("core.colourscheme")

-- Speed up loading Lua modules in Neovim to improve startup time.
-- impatient needs to be setup before any other lua plugin is loaded
local status_ok, _ = pcall(require, "impatient")
if not status_ok then
	return
end

require("configs.alpha")
require("configs.autolist")
require("configs.autopairs")
require("configs.bufferline")
require("configs.cmp")
require("configs.colorizer")
require("configs.crates")
require("configs.cursorline")
require("configs.dim")
require("configs.gitlinker")
require("configs.gitsigns")
require("configs.indent-blankline")
require("configs.lualine")
require("configs.lsp-installer")
require("configs.lsp")
require("configs.notify")
require("configs.snippy")
require("configs.silicon")
require("configs.telescope")
require("configs.todo")
require("configs.tree")
require("configs.treesitter")
require("configs.which-key")
