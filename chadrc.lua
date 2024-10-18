---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "ayu_dark",
  theme_toggle = { "ayu_dark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

vim.o.autoread = true
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.api.nvim_set_option_value("colorcolumn", "90", {})
vim.api.nvim_exec(
  [[
  highlight ColorColumn guibg=#555555
]],
  false
)

-- vim.api.nvim_set_keymap(
--     "i",
--     "<CR>",
--     'coc#pum#visible() ? coc#pum#confirm() : "<CR>"',
--     { noremap = true, expr = true, silent = true }
-- )
-- vim.api.nvim_set_keymap("i", "<C-Space>", "coc#refresh()", { noremap = true, silent = true, expr = true })
-- vim.api.nvim_set_keymap("n", "L", "<Plug>(coc-hover)", { noremap = true, silent = true })

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
