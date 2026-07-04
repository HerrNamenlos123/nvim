---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"

M.base46 = {
  theme = "nightowl",
  theme_toggle = { "nightowl", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
}

M.term = {
  sizes = { vsp = 0.5 },
}

return M
