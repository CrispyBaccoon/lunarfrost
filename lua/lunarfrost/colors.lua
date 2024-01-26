---@class lunarfrost.types.Color { [1]: string, [2]: number }

---@alias lunarfrost.types.ColorField 'bg0_hard'|'bg0_soft'|'bg0'|'bg1'|'bg2'|'bg3'|'bg4'|'bg5'|'bg_visual'|'bg_red'|'bg_green'|'bg_blue'|'bg_yellow'|'fg0'|'fg1'|'fg2'|'lunar0'|'lunar1'|'lunar2'|'red'|'orange'|'yellow'|'green'|'aqua'|'blue'|'purple'
---@alias lunarfrost.types.Colors { [lunarfrost.types.ColorField]: lunarfrost.types.Color }

---@type lunarfrost.types.Colors
_G.lunarfrost_colors = {
  bg0_hard = { "#1B202B", 0 },
  bg0      = { "#121722", 0 },
  bg0_soft = { "#1E232E", 0 },
  bg1      = { "#262B36", 8 },
  bg2      = { "#3D4452", 8 },
  bg3      = { "#4B5363", 8 },
  bg4      = { "#545E6E", 8 },
  bg5      = { "#7A90AC", 8 },
  fg0      = { "#DFE2F0", 7 },
  fg1      = { "#C8D2E8", 7 },
  fg2      = { "#B3C3E6", 7 },
  lunar0   = { "#9EC5B0", 15 },
  lunar1   = { "#A5C9C8", 6 },
  lunar2   = { "#9AB0DB", 4 },
  red      = { "#DA7D81", 1 },
  orange   = { "#DD9B89", 11 },
  yellow   = { "#E1C89D", 3 },
  green    = { "#B8C9A9", 2 },
  purple   = { "#D8A7DB", 5 },
}

local M = {}

function M.colors()
  return _G.lunarfrost_colors
end

---@param config lunarfrost.types.Config?
---@return lunarfrost.types.Theme
function M.setup(config)
  ---@type lunarfrost.types.Config
  config = vim.tbl_extend("force", _G.lunarfrost_config, config or {})
  return require 'lunarfrost.theme'.setup(M.colors(), config)
end

return M
