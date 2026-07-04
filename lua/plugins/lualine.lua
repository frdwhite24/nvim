return {
    "hoob3rt/lualine.nvim",
    lazy = false,
    config = function()
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
            red = "#ec5f67",
        }

        local conditions = {
            hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
            check_git_workspace = function()
                local filepath = vim.fn.expand("%:p:h")
                local gitdir = vim.fn.finddir(".git", filepath .. ";")
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }

        local config = {
            options = {
                component_separators = "",
                section_separators = "",
                theme = "auto",
                globalstatus = true,
            },
            sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                lualine_c = {},
                lualine_x = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_v = {},
                lualine_y = {},
                lualine_z = {},
                lualine_c = {},
                lualine_x = {},
            },
        }

        local function ins_left(component)
            table.insert(config.sections.lualine_c, component)
        end

        local function ins_right(component)
            table.insert(config.sections.lualine_x, component)
        end

        local mode_color = {
            n = colors.red,
            i = colors.green,
            v = colors.blue,
            ["\22"] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            ["\19"] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ["r?"] = colors.cyan,
            ["!"] = colors.red,
            t = colors.red,
        }

        ins_left({
            "mode",
            color = function()
                return {
                    bg = mode_color[vim.fn.mode()] or colors.red,
                    fg = colors.bg,
                }
            end,
        })

        ins_left({ "branch", icon = "", cond = conditions.check_git_workspace })

        ins_left({
            "diff",
            symbols = { removed = " ", modified = " ", added = " " },
            cond = conditions.check_git_workspace and conditions.hide_in_width,
        })

        ins_left({
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " " },
        })

        ins_right({
            function()
                local row, column = unpack(vim.api.nvim_win_get_cursor(0))
                return "Ln " .. row .. ", Col " .. column
            end,
        })

        ins_right({
            function()
                return "Spaces: " .. vim.api.nvim_get_option_value("shiftwidth", { buf = 0 })
            end,
        })

        ins_right({ "o:encoding", fmt = string.upper, cond = conditions.hide_in_width })

        ins_right({ "fileformat", fmt = string.upper, icons_enabled = false })

        local function title_case(first, rest) return first:upper() .. rest:lower() end

        ins_right({
            function()
                return string.gsub(vim.bo.filetype, "(%a)([%w_']*)", title_case)
            end,
            icons_enabled = false,
        })

        require("lualine").setup(config)
    end,
}
