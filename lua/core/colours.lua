local colorscheme = "nightfox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end

-- vim.opt.background = "dark" -- set this to dark or light
-- vim.cmd.colorscheme "oxocarbon"
-- vim.cmd.colorscheme 'oxocarbon-lua'
