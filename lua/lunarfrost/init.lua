local lunarfrost = {}

---@class lunarfrost.types.config
---@field transparent_background boolean
---@field theme 'nightfall'|'midnight'|'dawn'
---@field override_terminal boolean
---@field style lunarfrost.types.styleconfig
---@field overrides lunarfrost.types.hlgroups

---@type lunarfrost.types.config
lunarfrost.default_config = {
  transparent_background = false,
  theme = 'nightfall',
  override_terminal = true,
  style = {
    tabline = { reverse = true, color = 'blue' },
    search = { reverse = false, inc_reverse = true },
    types = { italic = true },
    keyword = { italic = true },
    comment = { italic = false },
  },
  overrides = {},
}

---@type lunarfrost.types.config
_G.lunarfrost_config = vim.tbl_deep_extend(
  'force',
  lunarfrost.default_config,
  _G.lunarfrost_config or {}
)

---@param config lunarfrost.types.config|table
function lunarfrost.setup(config)
  _G.lunarfrost_config =
    vim.tbl_deep_extend('force', _G.lunarfrost_config, config or {})
end

---@param group string
---@param colors lunarfrost.types.colorspec
local function set_hi(group, colors)
  if type(colors) ~= 'table' or vim.tbl_isempty(colors) then
    return
  end

  colors.fg = colors.fg or colors[1] or 'none'
  colors.bg = colors.bg or colors[2] or 'none'

  ---@type vim.api.keyset.highlight
  local color = vim.deepcopy(colors)

  color.fg = type(colors.fg) == 'table' and colors.fg[1] or colors.fg
  color.bg = type(colors.bg) == 'table' and colors.bg[1] or colors.bg
  color.ctermfg = type(colors.fg) == 'table' and colors.fg[2] or 'none'
  color.ctermbg = type(colors.bg) == 'table' and colors.bg[2] or 'none'
  color[1] = nil
  color[2] = nil
  color.name = nil

  vim.api.nvim_set_hl(0, group, color)
end

---@param hlgroups lunarfrost.types.hlgroups
local function set_highlights(hlgroups)
  ---@type lunarfrost.types.colorspec
  local color = hlgroups.Normal
  color.fg = color.fg or color[1] or 'none'
  color.bg = color.bg or color[2] or 'none'
  local normal = {}
  normal.fg = type(color.fg) == 'table' and color.fg[1] or color.fg
  normal.bg = type(color.bg) == 'table' and color.bg[1] or color.bg
  normal.ctermfg = type(color.fg) == 'table' and color.fg[2] or 'none'
  normal.ctermbg = type(color.bg) == 'table' and color.bg[2] or 'none'
  vim.api.nvim_set_hl(0, 'Normal', normal)
  hlgroups.Normal = nil
  for group, colors in pairs(hlgroups) do
    set_hi(group, colors)
  end
end

function lunarfrost.load(opts)
  if vim.g.colors_name then
    vim.cmd 'hi clear'
  end

  vim.g.colors_name = 'lunarfrost'
  vim.o.termguicolors = true

  local cfg = vim.tbl_deep_extend('force', _G.lunarfrost_config, opts or {})

  local theme = require('lunarfrost.colors').setup(cfg)
  local hlgroups = require('lunarfrost.hl.init').setup(theme, cfg)

  set_highlights(hlgroups)
end

function lunarfrost.colors()
  return require('lunarfrost.colors').colors()
end

return lunarfrost
