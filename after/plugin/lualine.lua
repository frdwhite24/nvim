local status_ok, lualine = pcall(require, "lualine")
if not status_ok then return end

-- Color table for highlights
local colors = {
    bg = "#2c3043",
    fg = "#c3ccdc",
    yellow = "#ECBE7B",
    cyan = "#008080",
    darkblue = "#081633",
    green = "#98be65",
    orange = "#FF8800",
    violet = "#a9a1e1",
    magenta = "#c678dd",
    blue = "#51afef",
    red = "#ec5f67"
}

local conditions = {
    hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end
}

local config = {
    options = {
        disabled_filetypes = { "NvimTree" },
        component_separators = "",
        section_separators = "",
        theme = 'auto',
        globalstatus = true
        -- theme = {
        -- 	-- We are going to use lualine_c an lualine_x as left and
        -- 	-- right section. Both are highlighted by c theme .  So we
        -- 	-- are just setting default looks o statusline
        -- 	normal = { c = { fg = colors.fg, bg = colors.bg } },
        -- 	inactive = { c = { fg = colors.fg, bg = colors.bg } },
        -- },
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {}
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_v = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {}
    }
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

-- TODO: work out how to make this an actual highlight group rather than an insert into the status line
ins_left({
    function()
        local mode_color = {
            n = colors.red,
            i = colors.green,
            v = colors.blue,
            [""] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [""] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ["r?"] = colors.cyan,
            ["!"] = colors.red,
            t = colors.red
        }
        vim.api.nvim_command("hi! LualineMode guibg=" ..
            mode_color[vim.fn.mode()] .. " guifg=" ..
            colors.bg)
        return ""
    end,
    color = "LualineMode",
    left_padding = 0
})

ins_left({ "mode", color = "LualineMode" })

ins_left({ "branch", icon = "", cond = conditions.check_git_workspace })

ins_left({
    "diff",
    symbols = { removed = " ", modified = " ", added = " " },
    cond = conditions.check_git_workspace and conditions.hide_in_width
})

ins_left({
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " " }
    -- NOTE: have a think about these options below
    -- sections = { "error", "warn" },
    -- always_visible = true,
})

ins_right({
    function()
        local row, column = unpack(vim.api.nvim_win_get_cursor(0))
        return "Ln " .. row .. ", Col " .. column
    end
})

ins_right({
    function()
        return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end
})

ins_right({ "o:encoding", fmt = string.upper, cond = conditions.hide_in_width })

ins_right({ "fileformat", fmt = string.upper, icons_enabled = false })

local function title_case(first, rest) return first:upper() .. rest:lower() end

ins_right({
    function()
        return string.gsub(vim.bo.filetype, "(%a)([%w_']*)", title_case)
    end,
    icons_enabled = false
})

lualine.setup(config)
