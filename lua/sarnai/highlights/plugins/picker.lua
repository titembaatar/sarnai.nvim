local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette
  local groups = util.get_groups(c.groups, c)

  local styles = config.styles or {}
  local transparent_bg = config.transparent and "NONE" or nil

  return {
    -- Telescope elements
    TelescopeNormal = { fg = c.text, bg = transparent_bg or c.base },
    TelescopeBorder = { fg = groups.border, bg = transparent_bg or c.base },
    TelescopePromptNormal = { fg = c.text, bg = transparent_bg or c.surface },
    TelescopePromptBorder = { fg = groups.border, bg = transparent_bg or c.surface },
    TelescopePromptPrefix = { fg = groups.hint },
    TelescopePromptTitle = { fg = c.base, bg = groups.hint, bold = styles.bold },
    TelescopePreviewTitle = { fg = c.base, bg = groups.info, bold = styles.bold },
    TelescopeResultsTitle = { fg = c.base, bg = groups.ok, bold = styles.bold },
    TelescopeSelection = { fg = c.text, bg = c.overlay },
    TelescopeSelectionCaret = { fg = groups.hint, bg = c.overlay },
    TelescopeMultiSelection = { fg = c.text, bg = util.blend(groups.hint, c.base, 0.3) },
    TelescopeMatching = { fg = groups.hint, bold = styles.bold },
    TelescopePromptCounter = { fg = c.muted, italic = styles.italic },

    -- Telescope specific elements
    TelescopePreviewLine = { bg = util.lighten(c.surface, 0.1) },
    TelescopePreviewMatch = { fg = groups.hint, bold = styles.bold },
    TelescopePreviewPipe = { fg = c.els },
    TelescopePreviewCharDev = { fg = groups.warn },
    TelescopePreviewDirectory = { fg = c.mus },
    TelescopePreviewBlock = { fg = groups.info },
    TelescopePreviewLink = { fg = groups.link, underline = styles.underline },
    TelescopePreviewSocket = { fg = c.yargui },
    TelescopePreviewRead = { fg = groups.ok },
    TelescopePreviewWrite = { fg = groups.error },
    TelescopePreviewExecute = { fg = groups.warn },
    TelescopePreviewHyphen = { fg = c.muted },
    TelescopePreviewSticky = { fg = c.els, bold = styles.bold },
    TelescopePreviewSize = { fg = c.muted },
    TelescopePreviewUser = { fg = groups.info },
    TelescopePreviewGroup = { fg = c.mus },
    TelescopePreviewDate = { fg = c.subtle },
    TelescopeResultsClass = { fg = c.els },
    TelescopeResultsConstant = { fg = c.yargui },
    TelescopeResultsField = { fg = c.text },
    TelescopeResultsFunction = { fg = groups.info },
    TelescopeResultsMethod = { fg = groups.info },
    TelescopeResultsOperator = { fg = groups.hint },
    TelescopeResultsStruct = { fg = c.els },
    TelescopeResultsVariable = { fg = c.text },
    TelescopeResultsLineNr = { fg = c.muted },
    TelescopeResultsIdentifier = { fg = c.text },
    TelescopeResultsNumber = { fg = c.els },
    TelescopeResultsComment = { fg = c.muted, italic = styles.italic },
    TelescopeResultsSpecialComment = { fg = c.muted, italic = styles.italic },

    -- FZF Lua elements
    FzfLuaNormal = { link = "TelescopeNormal" },
    FzfLuaBorder = { link = "TelescopeBorder" },
    FzfLuaTitle = { link = "TelescopePromptTitle" },
    FzfLuaPreviewTitle = { link = "TelescopePreviewTitle" },
    FzfLuaScrollTitle = { link = "TelescopeResultsTitle" },
    FzfLuaHeaderBind = { fg = groups.warn },
    FzfLuaHeaderText = { fg = c.subtle },
    FzfLuaPromptText = { link = "TelescopePromptPrefix" },
    FzfLuaCursorLine = { link = "TelescopeSelection" },
    FzfLuaCursorLineIcon = { link = "TelescopeSelectionCaret" },
    FzfLuaMatch = { link = "TelescopeMatching" },
    FzfLuaPromptCounter = { link = "TelescopePromptCounter" },
    FzfLuaSpinner = { fg = groups.hint },
  }
end

return M

