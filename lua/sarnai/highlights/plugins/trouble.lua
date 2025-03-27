local M = {}

---@param colors ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(colors, opts)
  local p = colors.palette
  local ui = colors.ui

  local styles = opts.styles or {}

  return {
    TroubleNormal = { fg = ui.fg, bg = ui.bg_float },
    TroubleText = { fg = p.subtle },
    TroubleCount = { fg = p.yargui, bg = p.overlay, bold = styles.bold },
  }
end

return M
