---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-j>"] = { "[m", "Jump to next scope"},
    ["<C-k>"] = { "]m", "Jump to previous scope" },
    ["<leader>j"] = { "[[", "Jump to next function"},
    ["<leader>k"] = { "]]", "Jump to previous function" },
    ["<A-j>"] = { ":m +1<CR>", "Move lines down by one" },
    ["<A-k>"] = { ":m -2<CR>", "Move lines up by one" },
    ["<leader>pf"] = { ":Telescope find_files<CR>", "Find in all files" },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
  x = {
    ["<leader>p"] = { [["_dP]], "I think replace a line in visual select mode" },
  },
}

-- more keybinds!

return M
