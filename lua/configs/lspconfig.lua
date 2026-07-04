require("nvchad.configs.lspconfig").defaults()

-- Vue 3 support: vue_ls (formerly "volar", renamed/rewritten upstream) now runs in
-- "hybrid mode" by default -- it only handles template/CSS and forwards all TS
-- requests to ts_ls via the @vue/typescript-plugin. Takeover mode (the old
-- standalone-volar setup) was removed upstream in language-tools v3.0.0.
-- See https://github.com/vuejs/language-tools/wiki/Neovim
local vue_typescript_plugin = vim.fn.stdpath "data"
  .. "/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin"

vim.lsp.config("ts_ls", {
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_typescript_plugin,
        languages = { "vue" },
      },
    },
  },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
})

vim.lsp.config("eslint", {
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})

-- run EslintFixAll on save (the command comes from the eslint LSP server itself)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "eslint" then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = args.buf,
        command = "silent! EslintFixAll",
      })
    end
  end,
})

vim.lsp.enable { "ts_ls", "vue_ls", "eslint", "html", "cssls", "pylsp", "gopls", "clangd" }
