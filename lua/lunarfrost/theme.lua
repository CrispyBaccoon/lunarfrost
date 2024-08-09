---@class lunarfrost.types.styleconfig
---@field tabline { reverse: boolean, color: lunarfrost.types.ColorField }
---@field search { reverse: boolean, inc_reverse: boolean }
---@field types { italic: boolean }
---@field keyword { italic: boolean }
---@field comment { italic: boolean }

---@class lunarfrost.types.theme
---@field none lunarfrost.types.color
---@field colors lunarfrost.types.colors
---@field base { fg: lunarfrost.types.color, bg: lunarfrost.types.color }
---@field bg lunarfrost.types.color
---@field fg lunarfrost.types.color
---@field bg0 lunarfrost.types.color
---@field bg1 lunarfrost.types.color
---@field bg2 lunarfrost.types.color
---@field bg3 lunarfrost.types.color
---@field fg0 lunarfrost.types.color
---@field fg1 lunarfrost.types.color
---@field fg2 lunarfrost.types.color
---@field red  lunarfrost.types.color
---@field yellow lunarfrost.types.color
---@field orange lunarfrost.types.color
---@field green lunarfrost.types.color
---@field aqua lunarfrost.types.color
---@field blue lunarfrost.types.color
---@field purple lunarfrost.types.color
---@field syntax lunarfrost.types.Syntax
---@field diagnostic { ['ok'|'error'|'warn'|'info'|'hint']: lunarfrost.types.color }
---@field diff { ['add'|'delete'|'change']: lunarfrost.types.color }
---@field style lunarfrost.types.styleconfig
---@field sign lunarfrost.types.color
---@field comment lunarfrost.types.color
---@field bg_accent lunarfrost.types.color

---@class lunarfrost.types.Syntax
---@field keyword lunarfrost.types.color
---@field object lunarfrost.types.color
---@field field lunarfrost.types.color
---@field type lunarfrost.types.color
---@field context lunarfrost.types.color
---@field constant lunarfrost.types.color
---@field call lunarfrost.types.color
---@field string lunarfrost.types.color
---@field macro lunarfrost.types.color
---@field annotation lunarfrost.types.color

local M = {}

---@param colors lunarfrost.types.colors
---@param config lunarfrost.types.config
---@return lunarfrost.types.theme
function M.setup(colors, config)
  local theme = {}

  theme.none = { 'NONE', 0 }
  theme.colors = colors

  theme.bg = theme.none
  local bg_c = {
    nightfall = colors.bg0,
    midnight = colors.bg0_hard,
    dawn = colors.bg0_soft,
  }
  if not config.transparent_background then
    theme.bg = bg_c[config.theme] or colors.bg0
  end
  theme.base = { fg = colors.bg0, bg = theme.bg }
  theme.fg = colors.fg0

  theme.bg0 = colors.bg0
  theme.bg1 = colors.bg1
  theme.bg2 = colors.bg2
  theme.bg3 = colors.bg3

  theme.fg0 = colors.fg0
  theme.fg1 = colors.fg1
  theme.fg2 = colors.fg2

  local sign_colors = { dawn = theme.bg3 }
  theme.sign = sign_colors[config.theme] or theme.none
  theme.comment = colors.bg4
  theme.bg_accent = theme.bg1

  theme.red = colors.red
  theme.orange = colors.orange
  theme.yellow = colors.yellow
  theme.green = colors.green
  theme.aqua = colors.aqua
  theme.sky = colors.sky
  theme.blue = colors.blue
  theme.purple = colors.purple

  theme.syntax = {
    keyword = theme.red,
    object = theme.fg1,
    field = theme.fg2,
    type = theme.yellow,
    context = theme.bg3,
    constant = theme.purple,
    call = theme.blue,
    string = theme.green,
    macro = theme.orange,
    annotation = theme.orange,
  }
  theme.diagnostic = {
    ok = theme.green,
    error = theme.red,
    warn = theme.yellow,
    info = theme.aqua,
    hint = theme.blue,
  }
  theme.diff = {
    add = theme.green,
    delete = theme.red,
    change = theme.aqua,
  }

  theme.style = {
    search = { reverse = true },
  }
  theme.style = vim.tbl_deep_extend('force', theme.style, config.style)

  return theme
end

return M
