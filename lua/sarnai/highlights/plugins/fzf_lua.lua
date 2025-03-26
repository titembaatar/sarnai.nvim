local M = {}

---@param palette ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(palette, opts)
  local p = palette

  return {
    FzfLuaBorder        = { fg = p.ui.border, bg = p.ui.bg_float },
    FzfLuaCursor        = "IncSearch",
    FzfLuaDirPart       = { fg = p.ui.bg },
    FzfLuaFilePart      = "FzfLuaFzfNormal",
    FzfLuaFzfCursorLine = "Visual",
    FzfLuaFzfNormal     = { fg = p.ui.fg },
    FzfLuaFzfPointer    = { fg = p.palette.yargui },
    FzfLuaFzfSeparator  = { fg = p.ui.accent, bg = p.ui.bg_float },
    FzfLuaHeaderBind    = "@punctuation.special",
    FzfLuaHeaderText    = "Title",
    FzfLuaNormal        = { fg = p.ui.fg, bg = p.ui.bg_float },
    FzfLuaPath          = "Directory",
    FzfLuaPreviewTitle  = { fg = p.ui.border, bg = p.ui.bg_float },
    FzfLuaTitle         = { fg = p.ui.accent, bg = p.ui.bg_float },
  }
end

return M
