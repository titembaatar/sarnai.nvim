local M = {}

---@param palette ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(palette, opts)
  local p = palette

  local styles = opts.styles or {}

  return {
    TroubleNormal = { fg = p.ui.fg, bg = p.ui.bg_float },
    TroubleText = { fg = p.palette.subtle },
    TroubleCount = { fg = p.palette.yargui, bg = p.palette.overlay, bold = styles.bold },
  }
end

return M
