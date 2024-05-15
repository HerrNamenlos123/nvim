local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

    -- Override plugin definition options

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- format & linting
            {
                "jose-elias-alvarez/null-ls.nvim",
                config = function()
                    require "custom.configs.null-ls"
                end,
            },
        },
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end, -- Override to setup mason-lspconfig
    },

    -- override plugin configs
    {
        "williamboman/mason.nvim",
        opts = overrides.mason,
        ensure_installed = {
            "clangd",
            "clang-format",
            "codelldb",
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = overrides.treesitter,
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = overrides.nvimtree,
    },

    -- Install a plugin
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("better_escape").setup()
        end,
    },
    {
        "NStefan002/speedtyper.nvim",
        cmd = "Speedtyper",
        config = function()
            require("speedtyper").setup {}
        end,
    },
    {
        "Exafunction/codeium.nvim",
        event = "InsertEnter",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup {}
            require("cmp").setup {
                sources = {
                    { name = "codeium" },
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "nvim_lua" },
                    { name = "path" },
                },
            }
        end,
    },
    {
        "NvChad/nvterm",
        config = function()
            require("nvterm").setup {
                terminals = {
                    shell = vim.o.shell,
                    list = {},
                    type_opts = {
                        float = {
                            relative = "editor",
                            row = 0.05,
                            col = 0.08,
                            width = 0.8,
                            height = 0.8,
                            border = "single",
                        },
                        horizontal = { location = "rightbelow", split_ratio = 0.6 },
                        vertical = { location = "rightbelow", split_ratio = 0.6 },
                    },
                },
                behavior = {
                    autoclose_on_quit = {
                        enabled = false,
                        confirm = true,
                    },
                    close_on_exit = true,
                    auto_insert = true,
                },
            }
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            local dap = require "dap"
            local dapui = require "dapui"
            dapui.setup()

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            -- dap.adapters.lldb = {
            --     type = "executable",
            --     command = "C:\\Program Files\\LLVM\\bin\\lldb.exe", -- adjust as needed, must be absolute path
            --     name = "lldb",
            -- }
            --
            -- local lldb = {
            --     name = "Launch lldb",
            --     type = "lldb", -- matches the adapter
            --     request = "launch", -- could also attach to a currently running process
            --     program = function()
            --         return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            --     end,
            --     cwd = "${workspaceFolder}",
            --     stopOnEntry = false,
            --     args = {},
            --     runInTerminal = false,
            -- }
            --
            -- require("dap").configurations.cpp = {
            --     lldb, -- different debuggers or more configurations can be used here
            -- }
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        lazy = false,
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
            ensure_installed = {
                "codelldb",
            },
        },
    },
    {
        "mfussenegger/nvim-dap",
        config = function()
            require("core.utils").load_mappings("dap")
        end
    },
    -- To make a plugin not be loaded
    -- {
    --   "NvChad/nvim-colorizer.lua",
    --   enabled = false
    -- },

    -- All NvChad plugins are lazy-loaded by default
    -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
    -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
    -- {
    --   "mg979/vim-visual-multi",
    --   lazy = false,
    -- }
}

return plugins
