---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-j>"] = { "]]", "Jump to next function"},
    ["<C-k>"] = { "[[", "Jump to previous function"},
    ["<A-j>"] = { ":m +1<CR>", "Move lines down by one"},
    ["<A-k>"] = { ":m -2<CR>", "Move lines up by one"},
    ["<leader>pf"] = { ":Telescope find_files<CR>", "Find in all files" },
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

return M
