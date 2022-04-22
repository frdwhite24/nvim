local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local if_nil = vim.F.if_nil

local default_header = {
    type = "text",
    val = {
        [[                               __                ]],
        [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    },
    opts = {
        position = "center",
        hl = "Type",
    },
}


local leader = "SPC"

--- @param sc string
--- @param txt string
--- @param keybind string optional
--- @param keybind_opts table optional
local function button(sc, txt, keybind, keybind_opts)
    local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

    local opts = {
        position = "center",
        shortcut = sc,
        cursor = 5,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = "Keyword",
    }
    if keybind then
        keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { "n", sc_, keybind, keybind_opts }
    end

    local function on_press()
        -- local key = vim.api.nvim_replace_termcodes(keybind .. "<Ignore>", true, false, true)
        local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
    end

    return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
    }
end

local buttons = {
    type = "group",
    val = {
        button("SPC f f", "  Find file"),
        button("SPC f w", "  Find word"),
        button("SPC f e", "  Edited git files"),
        button("SPC f t", "  Todo comments"),
        button("SPC f o", "  Recently opened files"),
        button("SPC f c", "  Neovim configuration files"),
    },
    opts = {
        spacing = 1,
    },
}

local function getGreeting ()
  local hour = tonumber(os.date("%H"))
  local name = 'Fred'

  if (hour < 12) then
    return ' Good morning, ' .. name .. '.'
  elseif (hour >= 12 and hour < 18) then
    return ' Good afternoon, ' .. name .. '.'
  else
    return '⏾ Good evening, ' .. name .. '.'
  end
end

local greeting = {
    type = "text",
    val = getGreeting(),
    opts = {
        position = "center",
        hl = "Number",
    },
}


local datetime = {
    type = "text",
    val = os.date(" %A, %d %B %Y  %H:%M:%S"),
    opts = {
        position = "center",
        hl = "Number",
    },
}

local vim_ver = vim.version()
local version = {
    type = "text",
    val = 'NVIM ' .. vim_ver.major .. '.' .. vim_ver.minor .. '.' .. vim_ver.patch,
    opts = {
        position = "center",
        hl = "String",
    },
}


local signature = {
    type = "text",
    val = 'Made by https://github.com/jltwheeler',
    opts = {
        position = "center",
        hl = "Type",
    },
}

local section = {
    header = default_header,
    buttons = buttons,
    greeting = greeting,
    datetime = datetime,
    signature = signature,
    version = version,
}

alpha.setup({
    layout = {
        { type = "padding", val = 4 },
        section.header,
        { type = "padding", val = 4 },
        section.buttons,
        { type = "padding", val = 2 },
        section.greeting,
        { type = "padding", val = 1 },
        section.datetime,
        { type = "padding", val = 2 },
        section.signature,
        { type = "padding", val = 1 },
        section.version,
    },
    opts = {
        margin = 6,
    },
})
