local overrides = require "configs.overrides"

---@type LazySpec
local plugins = {

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    ft = { "html", "xml", "vue", "javascriptreact", "typescriptreact" },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "isakbm/gitgraph.nvim",
    opts = {
      symbols = {
        merge_commit = "M",
        commit = "*",
      },
      format = {
        timestamp = "%H:%M:%S %d-%m-%Y",
        fields = { "hash", "timestamp", "author", "branch_name", "tag" },
      },
      hooks = {
        on_select_commit = function(commit)
          local output = vim.fn.system("git checkout " .. commit.hash)
          if vim.v.shell_error ~= 0 then
            vim.cmd "new"
            local buf = vim.api.nvim_get_current_buf()
            vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(output, "\n"))
            vim.bo[buf].buftype = "nofile"
            vim.bo[buf].modifiable = false
            vim.api.nvim_buf_set_name(buf, "Git Error Output")
          else
            print("Checked out commit " .. commit.hash)
          end
        end,
        on_select_range_commit = function(from, to)
          print("selected range:", from.hash, to.hash)
        end,
      },
    },
    keys = {
      {
        "<leader>gl",
        function()
          require("gitgraph").draw({}, { all = true, max_count = 5000 })
        end,
        desc = "GitGraph - Draw",
      },
    },
  },

  -- override plugin configs
  {
    "mason-org/mason.nvim",
    opts = overrides.mason,
    -- mason.nvim has no native "ensure_installed" auto-installer (that was an
    -- NvChad v2.0 bootstrap-wrapper feature, not a mason.nvim one) -- install
    -- missing packages ourselves so a fresh machine works out of the box.
    config = function(_, opts)
      require("mason").setup(opts)
      local registry = require "mason-registry"
      local function install_missing()
        for _, name in ipairs(opts.ensure_installed or {}) do
          local ok, pkg = pcall(registry.get_package, name)
          if ok and not pkg:is_installed() then
            pkg:install()
          end
        end
      end
      if registry.refresh then
        registry.refresh(install_missing)
      else
        install_missing()
      end
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup {
        timeout = vim.o.timeoutlen,
        default_mappings = true,
        mappings = {
          t = { j = { k = false } },
          v = { j = { k = false } },
        },
      }
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
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    lazy = false,
    dependencies = {
      "mason-org/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
      ensure_installed = {
        "codelldb",
      },
    },
  },
  { "mfussenegger/nvim-dap" },
}

return plugins
