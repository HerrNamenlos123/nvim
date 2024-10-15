local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local vue_language_server_path = "/usr/local/lib/node_modules/@vue/language-server"

local lspconfig = require "lspconfig"

lspconfig.ts_ls.setup {
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vue_language_server_path,
                languages = { "vue" },
            },
        },
    },
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}

-- No need to set `hybridMode` to `true` as it's the default value
lspconfig.volar.setup {}

-- lspconfig.volar.setup {
--     filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
--     on_attach = on_attach,
--     capabilities = capabilities,
--     init_options = {
--         typescript = {
--             tsdk = "/usr/local/lib/node_modules/typescript/lib/",
--         },
--         languageFeatures = {
--             implementation = true, -- enable 'go to implementation'
--             references = true, -- enable 'find references'
--             definition = true, -- enable 'go to definition'
--             typeDefinition = true, -- enable 'go to type definition'
--             callHierarchy = true, -- enable call hierarchy
--             hover = true,    -- enable hover documentation
--             rename = true,   -- enable renaming support
--             completion = true, -- enable completion support
--         },
--     },
-- }
-- lspconfig.ts_ls.setup {
--     filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "typescript", "vue" },
-- }

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls" }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

-- lspconfig.volar.setup {
--     filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
--     log_level = vim.lsp.protocol.MessageType.Error,
--     -- init_options = {
--     --     typescript = {
--     --         tsdk = "/path/to/.npm/lib/node_modules/typescript/lib",
--     --         -- Alternative location if installed as root:
--     --         -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
--     --     },
--     -- },
-- }

lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

--
-- lspconfig.pyright.setup { blabla}
