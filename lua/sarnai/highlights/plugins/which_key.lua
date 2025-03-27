local M = {}

---@param palette ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(palette, opts)
  local p = palette

  local transparent_bg = opts.transparent and "NONE" or nil

  return {
    WhichKey = { fg = p.syntax.functions },
    WhichKeyBorder = { fg = p.ui.border, bg = transparent_bg or p.ui.bg },
    WhichKeyDesc = { fg = p.ui.fg },
    WhichKeyGroup = { fg = p.palette.mus },
    WhichKeyIcon = { fg = p.palette.nuur },
    WhichKeyIconAzure = { fg = p.syntax.functions },
    WhichKeyIconBlue = { fg = p.semantic.info },
    WhichKeyIconCyan = { fg = p.semantic.hint },
    WhichKeyIconGreen = { fg = p.semantic.ok },
    WhichKeyIconGrey = { fg = p.palette.subtle },
    WhichKeyIconOrange = { fg = p.semantic.warn },
    WhichKeyIconPurple = { fg = p.syntax.constant },
    WhichKeyIconRed = { fg = p.semantic.error },
    WhichKeyIconYellow = { fg = p.semantic.warn },
    WhichKeyNormal = { fg = p.ui.fg, bg = p.ui.bg },
    WhichKeySeparator = { fg = p.palette.muted },
    WhichKeyTitle = { fg = p.ui.border },
    WhichKeyValue = { fg = p.syntax.comment },
  }
end

return M
