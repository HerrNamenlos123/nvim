---@type MappingsTable
local M = {}

M.custom = {
  n = {
    -- <cmd> instead of : to not show the command in the command bar
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-j>"] = { "]mzz", "Jump to next scope" },
    ["<C-k>"] = { "[mzz", "Jump to previous scope" },
    ["k"] = { "kzz", "Move one line up and keep cursor centered" },
    ["j"] = { "jzz", "Move one line down and keep cursor centered" },
    ["<S-G>"] = { "<S-G>zz", "Move to end of file and keep cursor centered" },
    ["<leader>j"] = { "]]zz", "Jump to next function" },
    ["<leader>k"] = { "[[zz", "Jump to previous function" },
    ["<A-j>"] = { "<cmd>m +1<CR>", "Move lines down by one" },
    ["<A-k>"] = { "<cmd>m -2<CR>", "Move lines up by one" },
    ["<leader>aa"] = { "gg0v<S-G>$", "Select entire file" },
    ["<leader>lf"] = { "<cmd>%s/\\r//g<CR>", "Change CRLF to LF for the entire file" },
    ["<C-p>"] = { '<cmd>lua require"telescope.builtin".find_files({ hidden = true })<CR>', "Open file" },
    ["<C-c>"] = { '"+y', "Copy to clipboard" },
    ["<C-v>"] = { '"+p', "Paste from clipboard" },
    ["<leader>rr"] = { "<cmd>source $MYVIMRC<CR>", "Paste from clipboard" },
    ["L"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show LSP Hover" },
    -- ["J"] = { "15jzz", "Jump down 15 lines" },
    -- ["K"] = { "15kzz", "Jump up 15 lines" },
    ["<leader>e"] = { '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>', "Show LSP Errors" },
    ["<C-f>"] = { "?", "Search in buffer" },
    ["<leader>ih"] = {
      "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
      "Toggle Inlay Hints",
    },
    -- ["<C-w>"] = { ":bd<CR>", "Close tab" },
    ["<C-d>"] = { "<C-d>zz", "Move half page down" },
    ["<C-u>"] = { "<C-u>zz", "Move half page up" },
    ["n"] = { "nzzzv", "Go to next search result" },
    ["N"] = { "Nzzzv", "Go to prev search result" },
    ["<C-o>"] = { "<C-o>zz", "Go back to prev location" },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["<C-c>"] = { '"+y', "Copy to clipboard" },
    ["<C-v>"] = { '"+p', "Paste from clipboard" },
  },
  x = {
    ["<leader>p"] = { [["_dP]], "I think replace a line in visual select mode" },
  },
  i = {
    ["<C-h>"] = { "<C-w>", "Delete word before cursor" },
    ["<C-BS>"] = { "<C-w>", "Delete word before cursor" },
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
