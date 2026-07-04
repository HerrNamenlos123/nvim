require "nvchad.options"

vim.g.editorconfig = true

vim.api.nvim_set_option_value("colorcolumn", "90", {})
vim.api.nvim_exec(
  [[
  highlight ColorColumn guibg=#555555
]],
  false
)
