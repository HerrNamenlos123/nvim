---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
    theme = "onedark",
    theme_toggle = { "onedark", "one_light" },

    hl_override = highlights.override,
    hl_add = highlights.add,
    transparency = true,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

vim.o.autoread = true
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.api.nvim_set_option_value("colorcolumn", "90", {})
vim.api.nvim_exec([[
  highlight ColorColumn guibg=#555555
]], false)

-- local cmp_nvim_lsp = require "cmp_nvim_lsp"

-- require 'nvim-treesitter.install'.compilers = { "clang" }
-- require("lspconfig").clangd.setup {
--  capabilities = cmp_nvim_lsp.default_capabilities(),
--   cmd = {
--    "clangd",
--    "--offset-encoding=utf-8",
--  },
-- }

return M
