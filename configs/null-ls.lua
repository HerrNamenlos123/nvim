local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local b = null_ls.builtins

local sources = {

    -- webdev stuff
    -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
    -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

    -- Lua
    b.formatting.stylua,

    -- cpp
    b.formatting.clang_format,
}

null_ls.setup {
    debug = true,
    sources = sources,
    on_attach = function(client, bufnr)
        local filetype = vim.bo[bufnr].filetype
        if filetype == "vue" or filetype == "typescript" or filetype == "typescriptreact" then
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.hoverProvider = false
            client.server_capabilities.definitionProvider = false
            -- Disable other capabilities as needed
        end
        if client.supports_method "textDocument/formatting" then
            vim.api.nvim_clear_autocmds {
                group = augroup,
                buffer = bufnr,
            }
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format { bufnr = bufnr }
                end,
            })
        end
    end,
}
