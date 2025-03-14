-- credits to original theme https://github.com/voronianski/oceanic-next-color-scheme
-- This is a modified version of the original theme.

local M = {}

M.base_30 = {
  white = "#D8DEE9", -- confirmed
  darker_black = "#15252e",
  black = "#1B2B34", --  nvim bg
  black2 = "#21313a",
  one_bg = "#25353e",
  one_bg2 = "#2e3e47",
  one_bg3 = "#36464f",
  grey = "#43535c",
  grey_fg = "#4d5d66",
  grey_fg2 = "#576770",
  light_grey = "#5f6f78",
  red = "#EC5F67",
  baby_pink = "#ff7d85",
  pink = "#ffafb7",
  line = "#2a3a43", -- for lines like vertsplit
  green = "#99C794",
  vibrant_green = "#b9e75b",
  nord_blue = "#598cbf",
  blue = "#6699CC",
  yellow = "#FAC863",
  sun = "#ffd06b",
  purple = "#C594C5",
  dark_purple = "#ac7bac",
  teal = "#50a4a4",
  orange = "#F99157",
  cyan = "#62B3B2",
  statusline_bg = "#1f2f38",
  lightbg = "#2c3c45",
  pmenu_bg = "#15bf84",
  folder_bg = "#598cbf",
}

-- Base16 colors taken from:
M.base_16 = {
  base00 = "#1B2B34",
  base01 = "#343D46",
  base02 = "#4F5B66",
  base03 = "#65737e",
  base04 = "#A7ADBa",
  base05 = "#C0C5Ce",
  base06 = "#CDD3De",
  base07 = "#D8DEE9",
  base08 = "#6cbdbc",
  base09 = "#FAC863",
  base0A = "#F99157",
  base0B = "#99C794",
  base0C = "#5aaeae",
  base0D = "#6699CC",
  base0E = "#C594C5",
  base0F = "#EC5F67",
}

M.polish_hl = {
  ["@keyword"] = { fg = M.base_16.base0E },
  -- ["@tag"] = { fg = M.base_16.base0C },
  syntax = {
    -- Conditional = { fg = M.base_30.nord_blue },
    Tag = { fg = M.base_16.base0C },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "mytheme")

return M

-- Credits to original theme for existing https://github.com/shaunsingh/oxocarbon.nvim
-- this is a modified version of it

-- local M = {}
--
-- M.base_30 = {
--   white = "#f2f4f8",
--   darker_black = "#0f0f0f",
--   black = "#161616",  --  nvim bg
--   black2 = "#202020",
--   one_bg = "#2a2a2a", -- real bg of onedark
--   one_bg2 = "#343434",
--   one_bg3 = "#3c3c3c",
--   grey = "#464646",
--   grey_fg = "#4c4c4c",
--   grey_fg2 = "#555555",
--   light_grey = "#5f5f5f",
--   red = "#ee5396",
--   baby_pink = "#ff7eb6",
--   pink = "#be95ff",
--   line = "#383747", -- for lines like vertsplit
--   green = "#42be65",
--   vibrant_green = "#08bdba",
--   nord_blue = "#78a9ff",
--   blue = "#33b1ff",
--   yellow = "#FAE3B0",
--   sun = "#ffe9b6",
--   purple = "#d0a9e5",
--   dark_purple = "#c7a0dc",
--   teal = "#B5E8E0",
--   orange = "#F8BD96",
--   cyan = "#3ddbd9",
--   statusline_bg = "#202020",
--   lightbg = "#2a2a2a",
--   pmenu_bg = "#3ddbd9",
--   folder_bg = "#78a9ff",
--   lavender = "#c7d1ff",
-- }
--
-- M.base_16 = {
--   base00 = "#161616",
--   base01 = "#262626",
--   base02 = "#393939",
--   base03 = "#525252",
--   base04 = "#dde1e6",
--   base05 = "#f2f4f8",
--   base06 = "#ffffff",
--   base07 = "#08bdba",
--   base08 = "#3ddbd9",
--   base09 = "#78a9ff",
--   base0A = "#ee5396",
--   base0B = "#33b1ff",
--   base0C = "#ff7eb6",
--   base0D = "#42be65",
--   base0E = "#be95ff",
--   base0F = "#82cfff",
-- }
--
-- M.polish_hl = {
--   syntax = {
--     Conditional = { fg = M.base_30.nord_blue },
--     Tag = { fg = M.base_30.white },
--   },
-- }
--
-- M.type = "dark"
--
-- M = require("base46").override_theme(M, "oxocarbon")
--
-- return M
