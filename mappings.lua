---@type MappingsTable
local M = {}

M.custom = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-j>"] = { "]mzz", "Jump to next scope" },
    ["<C-k>"] = { "[mzz", "Jump to previous scope" },
    ["k"] = { "kzz", "Move one line up and keep cursor centered" },
    ["j"] = { "jzz", "Move one line down and keep cursor centered" },
    ["<S-G>"] = { "<S-G>zz", "Move to end of file and keep cursor centered" },
    ["<leader>j"] = { "]]zz", "Jump to next function" },
    ["<leader>k"] = { "[[zz", "Jump to previous function" },
    ["<A-j>"] = { ":m +1<CR>", "Move lines down by one" },
    ["<A-k>"] = { ":m -2<CR>", "Move lines up by one" },
    ["<leader>aa"] = { "gg0v<S-G>$", "Select entire file" },
    ["<leader>lf"] = { ":%s/\\r//g<CR>", "Change CRLF to LF for the entire file" },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
  x = {
    ["<leader>p"] = { [["_dP]], "I think replace a line in visual select mode" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>dr"] = {
      function()
        require("dap").continue()
      end,
      "Debugger: Resume",
    },
    ["<leader>dn"] = {
      function()
        require("dap").step_over()
      end,
      "Debugger: Step over (Next instruction)",
    },
    ["<leader>di"] = {
      function()
        require("dap").step_into()
      end,
      "Debugger: Step in",
    },
    ["<leader>do"] = {
      function()
        require("dap").step_out()
      end,
      "Debugger: Step out",
    },
    ["<leader>db"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Debugger: Toggle Breakpoint",
    },
    -- ["<leader>dr"] = {
    --     function()
    --         require("dap").repl.toggle()
    --     end,
    --     "Debugger: Toggle Repl Debugger",
    -- },
  },
}

-- more keybinds!

return M
