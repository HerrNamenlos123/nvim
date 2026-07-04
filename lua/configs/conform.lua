local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    html = { "prettier" },
    markdown = { "prettier" },
    css = { "prettier" },
    typescript = { "prettier" },
    c = { "clang_format" },
    cpp = { "clang_format" },
  },

  formatters = {
    prettier = {
      command = "node_modules/.bin/prettier",
    },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
