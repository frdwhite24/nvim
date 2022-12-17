local status_lsp_ok, lsp = pcall(require, "lsp-zero")
if not status_lsp_ok then
  return
end

local status_cmp_ok, cmp = pcall(require, "cmp")
if not status_cmp_ok then
  return
end

local status_luasnip_ok, luasnip = pcall(require, "luasnip")
if not status_luasnip_ok then
  return
end

local status_format_ok, lsp_format = pcall(require, "lsp-format")
if status_format_ok then
  lsp_format.setup()
end

local builtin = require("telescope.builtin")

require("mason.settings").set({
  ui = {
    border = "rounded"
  }
})

lsp.preset("recommended")

lsp.ensure_installed({
  "tsserver",
  "eslint",
  "sumneko_lua",
  "rust_analyzer",
  "pyright",
  "cssls",
  "html",
  "jsonls",
  "taplo"
})

lsp.setup_nvim_cmp({
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-j>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-k>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
})

lsp.set_preferences({
  sign_icons = {
    error = "",
    warn = "",
    hint = "",
    info = ""
  }
})

vim.diagnostic.config({
  virtual_text = true
})

lsp.configure("sumneko_lua", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})

lsp.on_attach(function(client, bufnr)
  lsp_format.on_attach(client)

  local opts = { buffer = bufnr, remap = false }
  local func_opts = { show_line = false }
  local border = { border = "rounded" }

  vim.keymap.set("n", "gd", function() builtin.lsp_definitions(func_opts) end, opts)
  vim.keymap.set("n", "gD", function() builtin.lsp_type_definitions(func_opts) end, opts)
  vim.keymap.set("n", "gr", function() builtin.lsp_references(func_opts) end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set("n", "ga", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev(border) end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next(border) end, opts)
  vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
end)

lsp.setup()

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
