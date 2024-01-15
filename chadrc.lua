---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "tomorrow_night",
  theme_toggle = { "tomorrow_night", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.api.nvim_set_option_value("colorcolumn", "90", {})
vim.api.nvim_exec([[
  highlight ColorColumn guibg=#555555
]], false)

return M
