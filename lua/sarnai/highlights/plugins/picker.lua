local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette

  local styles = config.styles or {}
  local transparent_bg = config.transparent and "NONE" or nil

  return {
    -- Telescope elements
    TelescopeNormal = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg },
    TelescopeBorder = { fg = c.ui.border, bg = transparent_bg or c.ui.bg },
    TelescopePromptNormal = { fg = c.ui.fg, bg = transparent_bg or c.palette.surface },
    TelescopePromptBorder = { fg = c.ui.border, bg = transparent_bg or c.palette.surface },
    TelescopePromptPrefix = { fg = c.palette.sarnai },
    TelescopePromptTitle = { fg = c.ui.bg, bg = c.palette.sarnai, bold = styles.bold },
    TelescopePreviewTitle = { fg = c.ui.bg, bg = c.palette.nuur, bold = styles.bold },
    TelescopeResultsTitle = { fg = c.ui.bg, bg = c.palette.uvs, bold = styles.bold },
    TelescopeSelection = { fg = c.ui.fg, bg = c.palette.overlay },
    TelescopeSelectionCaret = { fg = c.palette.sarnai, bg = c.palette.overlay },
    TelescopeMultiSelection = { fg = c.ui.fg, bg = util.blend(c.palette.sarnai, c.ui.bg, 0.3) },
    TelescopeMatching = { fg = c.palette.sarnai, bold = styles.bold },
    TelescopePromptCounter = { fg = c.palette.muted, italic = styles.italic },

    -- Telescope specific elements
    TelescopePreviewLine = { bg = util.lighten(c.palette.surface, 0.1) },
    TelescopePreviewMatch = { fg = c.palette.sarnai, bold = styles.bold },
    TelescopePreviewPipe = { fg = c.palette.els },
    TelescopePreviewCharDev = { fg = c.palette.chatsalgan },
    TelescopePreviewDirectory = { fg = c.palette.mus },
    TelescopePreviewBlock = { fg = c.palette.nuur },
    TelescopePreviewLink = { fg = c.special.link, underline = styles.underline },
    TelescopePreviewSocket = { fg = c.palette.yargui },
    TelescopePreviewRead = { fg = c.palette.uvs },
    TelescopePreviewWrite = { fg = c.palette.anis },
    TelescopePreviewExecute = { fg = c.palette.chatsalgan },
    TelescopePreviewHyphen = { fg = c.palette.muted },
    TelescopePreviewSticky = { fg = c.palette.els, bold = styles.bold },
    TelescopePreviewSize = { fg = c.palette.muted },
    TelescopePreviewUser = { fg = c.palette.nuur },
    TelescopePreviewGroup = { fg = c.palette.mus },
    TelescopePreviewDate = { fg = c.palette.subtle },
    TelescopeResultsClass = { fg = c.syntax.type },
    TelescopeResultsConstant = { fg = c.syntax.constant },
    TelescopeResultsField = { fg = c.syntax.variable },
    TelescopeResultsFunction = { fg = c.syntax.functions },
    TelescopeResultsMethod = { fg = c.syntax.functions },
    TelescopeResultsOperator = { fg = c.syntax.operator },
    TelescopeResultsStruct = { fg = c.syntax.type },
    TelescopeResultsVariable = { fg = c.syntax.variable },
    TelescopeResultsLineNr = { fg = c.palette.muted },
    TelescopeResultsIdentifier = { fg = c.syntax.variable },
    TelescopeResultsNumber = { fg = c.syntax.constant },
    TelescopeResultsComment = { fg = c.syntax.comment, italic = styles.italic },
    TelescopeResultsSpecialComment = { fg = c.syntax.comment, italic = styles.italic },

    -- FZF Lua elements
    FzfLuaNormal = { link = "TelescopeNormal" },
    FzfLuaBorder = { link = "TelescopeBorder" },
    FzfLuaTitle = { link = "TelescopePromptTitle" },
    FzfLuaPreviewTitle = { link = "TelescopePreviewTitle" },
    FzfLuaScrollTitle = { link = "TelescopeResultsTitle" },
    FzfLuaHeaderBind = { fg = c.palette.chatsalgan },
    FzfLuaHeaderText = { fg = c.palette.subtle },
    FzfLuaPromptText = { link = "TelescopePromptPrefix" },
    FzfLuaCursorLine = { link = "TelescopeSelection" },
    FzfLuaCursorLineIcon = { link = "TelescopeSelectionCaret" },
    FzfLuaMatch = { link = "TelescopeMatching" },
    FzfLuaPromptCounter = { link = "TelescopePromptCounter" },
    FzfLuaSpinner = { fg = c.palette.sarnai },
  }
end

return M

