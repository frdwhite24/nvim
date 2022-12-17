require('core')
-- Speed up loading Lua modules in Neovim to improve startup time.
-- impatient needs to be setup before any other lua plugin is loaded
local status_ok, _ = pcall(require, "impatient")
if not status_ok then
  return
end
