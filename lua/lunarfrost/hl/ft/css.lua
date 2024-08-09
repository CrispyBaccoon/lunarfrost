---@param theme lunarfrost.types.theme
---@param config lunarfrost.types.config
---@return lunarfrost.types.hlgroups
return function(theme, config)
  return {
    ['@property.css'] = { theme.blue },
    -- tag
    ['@tag.css'] = { theme.syntax.keyword },
    -- #id
    ['@constant.css'] = { theme.syntax.constant },
    -- .class
    ['@type.css'] = { link = '@type' },
    -- % or literals
    ['@string.css'] = { link = 'NonText' },
  }
end
