local M = {}

---@param palette ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(palette, opts)
  local p = palette

  return {
    TelescopeBorder         = { fg = p.ui.border, bg = p.ui.bg_float },
    TelescopeNormal         = { fg = p.ui.fg, bg = p.ui.bg_float },
    TelescopePromptBorder   = { fg = p.ui.accent, bg = p.ui.bg_float },
    TelescopePromptTitle    = { fg = p.ui.accent, bg = p.ui.bg_float },
    TelescopeResultsComment = { fg = p.palette.muted },
  }
end

return M
