local M = {}

---@param palette ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(palette, opts)
  local c = palette
  local styles = opts.styles or {}
  local transparent_bg = opts.transparent and "NONE" or nil

  return {
    -- Main window highlights
    FzfLuaNormal = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg_float },
    FzfLuaBorder = { fg = c.ui.border, bg = transparent_bg or c.ui.bg_float },
    FzfLuaTitle = { fg = c.ui.accent, bg = transparent_bg or c.ui.bg_float, bold = styles.bold },
    FzfLuaTitleFlags = { fg = c.palette.anis, bg = transparent_bg or c.ui.bg_float },

    -- Preview window highlights
    FzfLuaPreviewNormal = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg_float },
    FzfLuaPreviewBorder = { fg = c.ui.border, bg = transparent_bg or c.ui.bg_float },
    FzfLuaPreviewTitle = { fg = c.ui.border, bg = transparent_bg or c.ui.bg_float, bold = styles.bold },
    FzfLuaCursor = { link = "IncSearch" },
    FzfLuaCursorLine = { bg = c.palette.overlay },
    FzfLuaSearch = { fg = c.palette.sarnai, bold = styles.bold },

    -- Scrollbar highlights
    FzfLuaScrollBorderEmpty = { fg = c.palette.muted },
    FzfLuaScrollBorderFull = { fg = c.palette.sarnai },
    FzfLuaScrollFloatEmpty = { fg = c.palette.muted },
    FzfLuaScrollFloatFull = { fg = c.palette.sarnai },

    -- Additional fzf-lua specific highlights
    FzfLuaHeaderBind = { fg = c.palette.chatsalgan, bold = styles.bold },
    FzfLuaHeaderText = { fg = c.palette.subtle },
    FzfLuaPath = { fg = c.palette.nuur },
    FzfLuaDirPart = { fg = c.ui.bg },
    FzfLuaFilePart = { link = "Normal" },
  }
end

return M
