local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette
  local transparent_bg = config.transparent and "NONE" or nil

  return {
    -- Telescope elements
    TelescopeNormal = { fg = c.text, bg = transparent_bg or c.shadow },
    TelescopeBorder = { fg = c.depth, bg = transparent_bg or c.shadow },
    TelescopePromptNormal = { fg = c.bright, bg = transparent_bg or c.surface },
    TelescopePromptBorder = { fg = c.faded, bg = transparent_bg or c.surface },
    TelescopePromptPrefix = { fg = c.sarnai },
    TelescopePromptTitle = { fg = c.base, bg = c.sarnai, style = { bold = true } },
    TelescopePreviewTitle = { fg = c.base, bg = c.nuur, style = { bold = true } },
    TelescopeResultsTitle = { fg = c.base, bg = c.uvs, style = { bold = true } },
    TelescopeSelection = { fg = c.bright, bg = c.overlay },
    TelescopeSelectionCaret = { fg = c.sarnai, bg = c.overlay },
    TelescopeMultiSelection = { fg = c.bright, bg = util.blend(c.sarnai, c.base, 0.3) },
    TelescopeMatching = { fg = c.sarnai, style = { bold = true } },
    TelescopePromptCounter = { fg = c.muted, style = { italic = true } },

    -- Telescope specific elements
    TelescopePreviewLine = { bg = util.lighten(c.surface, 0.1) },
    TelescopePreviewMatch = { fg = c.sarnai, style = { bold = true } },
    TelescopePreviewPipe = { fg = c.els },
    TelescopePreviewCharDev = { fg = c.chatsalgan },
    TelescopePreviewDirectory = { fg = c.mus },
    TelescopePreviewBlock = { fg = c.nuur },
    TelescopePreviewLink = { fg = c.sarnai, style = { underline = true } },
    TelescopePreviewSocket = { fg = c.yargui },
    TelescopePreviewRead = { fg = c.uvs },
    TelescopePreviewWrite = { fg = c.anis },
    TelescopePreviewExecute = { fg = c.chatsalgan },
    TelescopePreviewHyphen = { fg = c.muted },
    TelescopePreviewSticky = { fg = c.els, style = { bold = true } },
    TelescopePreviewSize = { fg = c.muted },
    TelescopePreviewUser = { fg = c.nuur },
    TelescopePreviewGroup = { fg = c.mus },
    TelescopePreviewDate = { fg = c.subtle },
    TelescopeResultsClass = { fg = c.els },
    TelescopeResultsConstant = { fg = c.yargui },
    TelescopeResultsField = { fg = c.text },
    TelescopeResultsFunction = { fg = c.nuur },
    TelescopeResultsMethod = { fg = c.nuur },
    TelescopeResultsOperator = { fg = c.sarnai },
    TelescopeResultsStruct = { fg = c.els },
    TelescopeResultsVariable = { fg = c.text },
    TelescopeResultsLineNr = { fg = c.muted },
    TelescopeResultsIdentifier = { fg = c.text },
    TelescopeResultsNumber = { fg = c.els },
    TelescopeResultsComment = { fg = c.muted, style = { italic = true } },
    TelescopeResultsSpecialComment = { fg = c.muted, style = { italic = true } },

    -- FZF Lua elements
    FzfLuaNormal = { link = "TelescopeNormal" },
    FzfLuaBorder = { link = "TelescopeBorder" },
    FzfLuaTitle = { link = "TelescopePromptTitle" },
    FzfLuaPreviewTitle = { link = "TelescopePreviewTitle" },
    FzfLuaScrollTitle = { link = "TelescopeResultsTitle" },
    FzfLuaHeaderBind = { fg = c.chatsalgan },
    FzfLuaHeaderText = { fg = c.subtle },
    FzfLuaPromptText = { link = "TelescopePromptPrefix" },
    FzfLuaCursorLine = { link = "TelescopeSelection" },
    FzfLuaCursorLineIcon = { link = "TelescopeSelectionCaret" },
    FzfLuaMatch = { link = "TelescopeMatching" },
    FzfLuaPromptCounter = { link = "TelescopePromptCounter" },
    FzfLuaSpinner = { fg = c.sarnai },
  }
end

return M

