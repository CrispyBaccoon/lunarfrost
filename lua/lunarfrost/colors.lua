---@class lunarfrost.types.color { [1]: string, [2]: number }

---@alias lunarfrost.types.ColorField 'bg0_hard'|'bg0_soft'|'bg0'|'bg1'|'bg2'|'bg3'|'bg4'|'bg_visual'|'bg_red'|'bg_green'|'bg_blue'|'bg_yellow'|'fg0'|'fg1'|'fg2'|'red'|'orange'|'yellow'|'green'|'aqua'|'sky'|'blue'|'purple'|'pink'
---@alias lunarfrost.types.colors { [lunarfrost.types.ColorField]: lunarfrost.types.color }

---@type lunarfrost.types.colors
_G.lunarfrost_colors = {
  bg0_hard = { "#171921", 0 },
  bg0      = { "#1D2129", 0 },
  bg0_soft = { "#22252E", 0 },
  bg1      = { "#252933", 8 },
  bg2      = { "#303642", 8 },
  bg3      = { "#414857", 8 },
  bg4      = { "#565E6E", 8 },
  fg0      = { "#D1D9EC", 7 },
  fg1      = { "#C8D3E8", 7 },
  fg2      = { "#ABBED1", 7 },
  red      = { "#DA7D81", 1 },
  orange   = { "#E9AB90", 11 },
  yellow   = { "#E2CCA2", 3 },
  green    = { "#BECFA8", 2 },
  jade     = { "#9AC8A3", 2 },
  aqua     = { "#9CCBB2", 15 },
  sky      = { "#A5C9C8", 6 },
  blue     = { "#9AA9DB", 4 },
  purple   = { "#BA9FDA", 5 },
  pink     = { "#D8A7DB", 5 },
}

local M = {}

function M.colors()
  return _G.lunarfrost_colors
end

---@param config lunarfrost.types.config?
---@return lunarfrost.types.theme
function M.setup(config)
  ---@type lunarfrost.types.config
  config = vim.tbl_extend("force", _G.lunarfrost_config, config or {})
  return require 'lunarfrost.theme'.setup(M.colors(), config)
end

return M
