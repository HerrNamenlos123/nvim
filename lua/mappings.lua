require "nvchad.mappings"

local map = vim.keymap.set

-- normal mode
map("n", ";", ":", { desc = "CMD enter command mode", nowait = true })
map("n", "<C-j>", "]mzz", { desc = "Jump to next scope" })
map("n", "<C-k>", "[mzz", { desc = "Jump to previous scope" })
map("n", "k", "kzz", { desc = "Move one line up and keep cursor centered" })
map("n", "j", "jzz", { desc = "Move one line down and keep cursor centered" })
map("n", "<S-G>", "<S-G>zz", { desc = "Move to end of file and keep cursor centered" })
map("n", "<leader>j", "]]zz", { desc = "Jump to next function" })
map("n", "<leader>k", "[[zz", { desc = "Jump to previous function" })
map("n", "<A-j>", "<cmd>m +1<CR>", { desc = "Move lines down by one" })
map("n", "<A-k>", "<cmd>m -2<CR>", { desc = "Move lines up by one" })
map("n", "<leader>aa", "gg0v<S-G>$", { desc = "Select entire file" })
map("n", "<leader>lf", "<cmd>%s/\\r//g<CR>", { desc = "Change CRLF to LF for the entire file" })
map("n", "<C-p>", function()
  require("telescope.builtin").find_files { hidden = true }
end, { desc = "Open file" })
map("n", "<C-c>", '"+y', { desc = "Copy to clipboard" })
map("n", "<C-v>", '"+p', { desc = "Paste from clipboard" })
map("n", "<leader>rr", "<cmd>source $MYVIMRC<CR>", { desc = "Source init.lua" })
map("n", "L", vim.lsp.buf.hover, { desc = "Show LSP Hover" })
map("n", "<leader>e", function()
  vim.diagnostic.open_float(0, { scope = "line" })
end, { desc = "Show LSP Errors" })
map("n", "<C-f>", "?", { desc = "Search in buffer" })
map("n", "<leader>ih", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })
map("n", "<C-d>", "<C-d>zz", { desc = "Move half page down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Move half page up" })
map("n", "n", "nzzzv", { desc = "Go to next search result" })
map("n", "N", "Nzzzv", { desc = "Go to prev search result" })
map("n", "<C-o>", "<C-o>zz", { desc = "Go back to prev location" })

-- visual mode
map("v", ">", ">gv", { desc = "indent" })
map("v", "<C-c>", '"+y', { desc = "Copy to clipboard" })
map("v", "<C-v>", '"+p', { desc = "Paste from clipboard" })

-- visual block mode
map("x", "<leader>p", [["_dP]], { desc = "Replace a line in visual select mode" })

-- insert mode
map("i", "<C-h>", "<C-w>", { desc = "Delete word before cursor" })
map("i", "<C-BS>", "<C-w>", { desc = "Delete word before cursor" })

-- dap
map("n", "<leader>dr", function()
  require("dap").continue()
end, { desc = "Debugger: Resume" })
map("n", "<leader>dn", function()
  require("dap").step_over()
end, { desc = "Debugger: Step over (Next instruction)" })
map("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "Debugger: Step in" })
map("n", "<leader>do", function()
  require("dap").step_out()
end, { desc = "Debugger: Step out" })
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Debugger: Toggle Breakpoint" })
