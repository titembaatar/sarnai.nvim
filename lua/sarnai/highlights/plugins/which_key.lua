local M = {}

---@param colors ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(colors, opts)
  local p = colors.palette
  local sem = colors.semantic
  local syntax = colors.syntax
  local ui = colors.ui

  local transparent_bg = opts.transparent and "NONE" or nil

  return {
    WhichKey = { fg = syntax.functions },
    WhichKeyBorder = { fg = ui.border, bg = transparent_bg or ui.bg },
    WhichKeyDesc = { fg = ui.fg },
    WhichKeyGroup = { fg = p.mus },
    WhichKeyIcon = { fg = p.nuur },
    WhichKeyIconAzure = { fg = syntax.functions },
    WhichKeyIconBlue = { fg = sem.info },
    WhichKeyIconCyan = { fg = sem.hint },
    WhichKeyIconGreen = { fg = sem.ok },
    WhichKeyIconGrey = { fg = p.subtle },
    WhichKeyIconOrange = { fg = sem.warn },
    WhichKeyIconPurple = { fg = syntax.constant },
    WhichKeyIconRed = { fg = sem.error },
    WhichKeyIconYellow = { fg = sem.warn },
    WhichKeyNormal = { fg = ui.fg, bg = ui.bg },
    WhichKeySeparator = { fg = p.muted },
    WhichKeyTitle = { fg = ui.border },
    WhichKeyValue = { fg = syntax.comment },
  }
end

return M
