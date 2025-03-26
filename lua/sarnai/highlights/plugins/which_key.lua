local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette

  local transparent_bg = config.transparent and "NONE" or nil

  return {
    WhichKey = { fg = c.syntax.functions },
    WhichKeyBorder = { fg = c.ui.border, bg = transparent_bg or c.palette.surface },
    WhichKeyDesc = { fg = c.ui.fg },
    WhichKeyGroup = { fg = c.palette.mus },
    WhichKeyIcon = { link = "@markup.link" },
    WhichKeyIconAzure = { fg = c.syntax.functions },
    WhichKeyIconBlue = { fg = c.semantic.info },
    WhichKeyIconCyan = { fg = c.semantic.hint },
    WhichKeyIconGreen = { fg = c.semantic.ok },
    WhichKeyIconGrey = { fg = c.palette.subtle },
    WhichKeyIconOrange = { fg = c.semantic.warn },
    WhichKeyIconPurple = { fg = c.syntax.constant },
    WhichKeyIconRed = { fg = c.semantic.error },
    WhichKeyIconYellow = { fg = c.semantic.warn },
    WhichKeyNormal = { fg = c.ui.fg },
    WhichKeySeparator = { fg = c.palette.muted },
    WhichKeyTitle = { fg = c.ui.border },
    WhichKeyValue = { fg = c.syntax.comment },
  }
end

return M
