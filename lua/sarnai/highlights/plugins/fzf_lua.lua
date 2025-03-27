local M = {}

---@param palette ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(palette, opts)
  local p = palette
  local styles = opts.styles or {}
  local transparent_bg = opts.transparent and "NONE" or nil

  return {
    -- Main window highlights
    FzfLuaNormal = { fg = p.ui.fg, bg = transparent_bg or p.ui.bg_float },
    FzfLuaBorder = { fg = p.ui.border, bg = transparent_bg or p.ui.bg_float },
    FzfLuaTitle = { fg = p.ui.accent, bg = transparent_bg or p.ui.bg_float, bold = styles.bold },
    FzfLuaTitleFlags = { fg = p.palette.anis, bg = transparent_bg or p.ui.bg_float },

    -- Preview window highlights
    FzfLuaPreviewNormal = { fg = p.ui.fg, bg = transparent_bg or p.ui.bg_float },
    FzfLuaPreviewBorder = { fg = p.palette.subtle, bg = transparent_bg or p.ui.bg_float },
    FzfLuaPreviewTitle = { fg = p.palette.subtle, bg = transparent_bg or p.ui.bg_float, bold = styles.bold },
    FzfLuaCursor = { link = "IncSearch" },
    FzfLuaCursorLine = { bg = p.palette.overlay },
    FzfLuaSearch = { fg = p.palette.sarnai, bold = styles.bold },

    -- Scrollbar highlights
    FzfLuaScrollBorderEmpty = { fg = p.palette.muted },
    FzfLuaScrollBorderFull = { fg = p.palette.sarnai },
    FzfLuaScrollFloatEmpty = { fg = p.palette.muted },
    FzfLuaScrollFloatFull = { fg = p.palette.sarnai },

    -- Buffer highlights
    FzfLuaBufName = { fg = p.palette.nuur },
    FzfLuaBufNr = { fg = p.palette.subtle },
    FzfLuaBufFlagCur = { fg = p.palette.chatsalgan },
    FzfLuaBufFlagAlt = { fg = p.palette.nuur },

    -- Tab highlights
    FzfLuaTabTitle = { fg = p.palette.mus },
    FzfLuaTabMarker = { link = "FzfLuaBufNr" },

    -- Additional fzf-lua specific highlights
    FzfLuaHeaderBind = { fg = p.palette.chatsalgan, bold = styles.bold },
    FzfLuaHeaderText = { fg = p.palette.subtle },
    FzfLuaPath = { fg = p.palette.nuur },
    FzfLuaPathColNr = { fg = p.palette.nuur },
    FzfLuaPathLineNr = { fg = p.palette.uvs },
    FzfLuaDirPart = { fg = p.ui.bg },
    FzfLuaDirIcon = { fg = p.palette.nuur },
    FzfLuaFilePart = { link = "Normal" },
    FzfLuaLivePrompt = { fg = p.palette.yargui },
    FzfLuaLiveSym = { fg = p.palette.yargui },
    FzfLuaFzfInfo = { fg = p.semantic.info },
  }
end

return M
