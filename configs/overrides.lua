local M = {}

M.treesitter = {
    ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "markdown",
        "markdown_inline",
    },
    indent = {
        enable = true,
        -- disable = {
        --   "python"
        -- },
    },
}

M.mason = {
    ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "prettier",

        -- c/cpp stuff
        "clangd",
        "clang-format",
    },
}

-- git support in nvimtree
M.nvimtree = {
    git = {
        enable = true,
    },

    actions = {
        open_file = {
            quit_on_open = true,
        },
    },

    renderer = {
        highlight_git = true,
        icons = {
            show = {
                git = true,
            },
        },
    },
}

M.telescope = {
    defaults = {
        file_ignore_patterns = {
            "%.exe",
            "%.png",
            "%.ico",
            "%.jpg",
            "%.jpeg",
            "%.ttf",
            "%.bmp",
            "%.gif",
            "build/%",
            ".build/%",
            "build-ms/%",
            "cmake-build/%",
            "%.vsix",
        },
    },
}

local parsers = require "nvim-treesitter.parsers"
parsers.get_parser_configs().toy = {
    install_info = {
        url = "~/Projects/toylang/nvim-treesitter/toy", -- Path to your custom parser
        files = { "src/parser.c" },
    },
    filetype = "toy",
}

return M
