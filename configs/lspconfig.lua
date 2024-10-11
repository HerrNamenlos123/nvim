local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver" }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

lspconfig.volar.setup {
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
    log_level = vim.lsp.protocol.MessageType.Error,
    -- init_options = {
    --     typescript = {
    --         tsdk = "/path/to/.npm/lib/node_modules/typescript/lib",
    --         -- Alternative location if installed as root:
    --         -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
    --     },
    -- },
}

lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

--
-- lspconfig.pyright.setup { blabla}
