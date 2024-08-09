local theme = require('lunarfrost.colors').setup {}

local colors = {
  normal = theme.green[1],
  insert = theme.syntax.object[1],
  visual = theme.syntax.constant[1],

  fg0 = theme.fg0[1],
  fg1 = theme.fg1[1],
  base = {
    fg = theme.base.fg[1],
    bg = theme.base.bg[1],
  },
  bg1 = theme.bg1[1],
  bg2 = theme.bg2[1],
}

local lunarfrost = {}

lunarfrost.normal = {
  a = { fg = colors.base.fg, bg = colors.normal },
  b = { bg = colors.bg1, fg = colors.normal },
  c = { bg = colors.base.fg, fg = colors.fg0 },
}

lunarfrost.insert = {
  a = { fg = colors.base.fg, bg = colors.insert },
  b = { bg = colors.bg1, fg = colors.insert },
}

lunarfrost.command = lunarfrost.normal

lunarfrost.visual = {
  a = { fg = colors.base.fg, bg = colors.visual },
  b = { bg = colors.bg1, fg = colors.visual },
}

lunarfrost.replace = lunarfrost.insert

lunarfrost.inactive = {
  a = { bg = colors.base.bg, fg = colors.fg1 },
  b = { bg = colors.base.bg, fg = colors.fg1 },
  c = { bg = colors.base.bg, fg = colors.fg1 },
}

return lunarfrost
