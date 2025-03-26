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
    -- Main completion window
    BlinkCmpNormal = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg_float },
    BlinkCmpBorder = { fg = c.ui.border, bg = transparent_bg or c.ui.bg_float },
    BlinkCmpFloatBorder = { link = "BlinkCmpBorder" },

    -- Completion items
    BlinkCmpItemAbbr = { fg = c.ui.fg },
    BlinkCmpItemAbbrDeprecated = { fg = c.palette.muted, strikethrough = true },
    BlinkCmpItemAbbrMatch = { fg = c.palette.sarnai, bold = styles.bold },
    BlinkCmpItemAbbrMatchFuzzy = { fg = c.palette.sarnai, bold = styles.bold },

    -- Selection
    BlinkCmpItemSelected = { bg = c.ui.bg_popup },
    BlinkCmpItemSelectedAbbr = { fg = c.ui.fg, bg = c.ui.bg_popup },

    -- Kind icons and text
    BlinkCmpItemKind = { fg = c.palette.subtle },
    BlinkCmpItemMenu = { fg = c.palette.muted, italic = styles.italic },

    -- Documentation window
    BlinkCmpDocNormal = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg_float },
    BlinkCmpDocBorder = { fg = c.ui.border, bg = transparent_bg or c.ui.bg_float },

    -- Item kinds
    BlinkCmpItemKindText = { fg = c.ui.fg },
    BlinkCmpItemKindMethod = { fg = c.syntax.functions },
    BlinkCmpItemKindFunction = { fg = c.syntax.functions },
    BlinkCmpItemKindConstructor = { fg = c.syntax.functions },
    BlinkCmpItemKindField = { fg = c.syntax.variable },
    BlinkCmpItemKindVariable = { fg = c.syntax.variable },
    BlinkCmpItemKindClass = { fg = c.syntax.type },
    BlinkCmpItemKindInterface = { fg = c.syntax.type },
    BlinkCmpItemKindModule = { fg = c.syntax.type },
    BlinkCmpItemKindProperty = { fg = c.syntax.variable },
    BlinkCmpItemKindUnit = { fg = c.ui.fg },
    BlinkCmpItemKindValue = { fg = c.syntax.constant },
    BlinkCmpItemKindEnum = { fg = c.syntax.type },
    BlinkCmpItemKindKeyword = { fg = c.syntax.keyword },
    BlinkCmpItemKindSnippet = { fg = c.palette.mus },
    BlinkCmpItemKindColor = { fg = c.palette.mus },
    BlinkCmpItemKindFile = { fg = c.ui.fg },
    BlinkCmpItemKindReference = { fg = c.ui.fg },
    BlinkCmpItemKindFolder = { fg = c.ui.fg },
    BlinkCmpItemKindEnumMember = { fg = c.syntax.constant },
    BlinkCmpItemKindConstant = { fg = c.syntax.constant },
    BlinkCmpItemKindStruct = { fg = c.syntax.type },
    BlinkCmpItemKindEvent = { fg = c.syntax.functions },
    BlinkCmpItemKindOperator = { fg = c.syntax.operator },
    BlinkCmpItemKindTypeParameter = { fg = c.syntax.type },

    -- LazyDev integration
    BlinkCmpItemKindLazyDev = { fg = c.palette.uvs, bold = styles.bold },

    -- Snippets
    BlinkCmpSnippetActive = { fg = c.ui.bg, bg = c.palette.sarnai },
    BlinkCmpSnippetPassive = { fg = c.ui.bg, bg = c.palette.muted },

    -- Scrollbar
    BlinkCmpScrollbarThumb = { bg = c.palette.muted },
    BlinkCmpScrollbarTrack = { bg = c.ui.bg },

    -- Fallback for nvim-cmp compatibility
    CmpItemAbbr = { link = "BlinkCmpItemAbbr" },
    CmpItemAbbrDeprecated = { link = "BlinkCmpItemAbbrDeprecated" },
    CmpItemAbbrMatch = { link = "BlinkCmpItemAbbrMatch" },
    CmpItemAbbrMatchFuzzy = { link = "BlinkCmpItemAbbrMatchFuzzy" },
    CmpItemMenu = { link = "BlinkCmpItemMenu" },
    CmpItemKindText = { link = "BlinkCmpItemKindText" },
  }
end

return M

