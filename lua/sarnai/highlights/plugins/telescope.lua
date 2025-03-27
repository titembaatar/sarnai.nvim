local M = {}

---@param colors ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(colors, opts)
  local p = colors.palette
  local ui = colors.ui

  return {
    TelescopeBorder         = { fg = ui.border, bg = ui.bg_float },
    TelescopeNormal         = { fg = ui.fg, bg = ui.bg_float },
    TelescopePromptBorder   = { fg = ui.accent, bg = ui.bg_float },
    TelescopePromptTitle    = { fg = ui.accent, bg = ui.bg_float },
    TelescopeResultsComment = { fg = p.muted },
  }
end

return M
