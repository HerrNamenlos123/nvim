require("better_escape").setup {
  timeout = vim.o.timeoutlen,
  default_mappings = true,
  mappings = {
    t = {
      j = {
        k = false,
      },
    },
    v = {
      j = {
        k = false,
      },
    },
  },
}
