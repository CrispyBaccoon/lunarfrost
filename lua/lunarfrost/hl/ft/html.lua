---@param theme lunarfrost.types.theme
---@param config lunarfrost.types.config
---@return lunarfrost.types.hlgroups
return function(theme, config)
  return {
    ['@tag.html'] = { theme.syntax.keyword },
    ['@tag.delimiter.html'] = { theme.syntax.context },
    ['@tag.attribute.html'] = { theme.fg0 },
    ['@string.html'] = { theme.blue },
  }
end
