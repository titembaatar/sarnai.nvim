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
    -- Main completion window
    BlinkCmpNormal = { fg = c.text, bg = transparent_bg or c.surface },
    BlinkCmpBorder = { fg = groups.border, bg = transparent_bg or c.surface },
    BlinkCmpFloatBorder = { link = "BlinkCmpBorder" },

    -- Completion items
    BlinkCmpItemAbbr = { fg = c.text },
    BlinkCmpItemAbbrDeprecated = { fg = c.muted, strikethrough = true },
    BlinkCmpItemAbbrMatch = { fg = groups.hint, bold = styles.bold },
    BlinkCmpItemAbbrMatchFuzzy = { fg = groups.hint, bold = styles.bold },

    -- Selection
    BlinkCmpItemSelected = { bg = c.overlay },
    BlinkCmpItemSelectedAbbr = { fg = c.text, bg = c.overlay },

    -- Kind icons and text
    BlinkCmpItemKind = { fg = c.subtle },
    BlinkCmpItemMenu = { fg = c.muted, italic = styles.italic },

    -- Documentation window
    BlinkCmpDocNormal = { fg = c.text, bg = transparent_bg or c.surface },
    BlinkCmpDocBorder = { fg = groups.border, bg = transparent_bg or c.surface },

    -- Item kinds
    BlinkCmpItemKindText = { fg = c.text },
    BlinkCmpItemKindMethod = { fg = groups.info },
    BlinkCmpItemKindFunction = { fg = groups.info },
    BlinkCmpItemKindConstructor = { fg = groups.info },
    BlinkCmpItemKindField = { fg = groups.ok },
    BlinkCmpItemKindVariable = { fg = c.mus },
    BlinkCmpItemKindClass = { fg = c.els },
    BlinkCmpItemKindInterface = { fg = c.els },
    BlinkCmpItemKindModule = { fg = c.els },
    BlinkCmpItemKindProperty = { fg = groups.ok },
    BlinkCmpItemKindUnit = { fg = c.text },
    BlinkCmpItemKindValue = { fg = c.yargui },
    BlinkCmpItemKindEnum = { fg = c.els },
    BlinkCmpItemKindKeyword = { fg = c.yargui },
    BlinkCmpItemKindSnippet = { fg = groups.hint },
    BlinkCmpItemKindColor = { fg = groups.hint },
    BlinkCmpItemKindFile = { fg = c.text },
    BlinkCmpItemKindReference = { fg = c.text },
    BlinkCmpItemKindFolder = { fg = c.text },
    BlinkCmpItemKindEnumMember = { fg = groups.ok },
    BlinkCmpItemKindConstant = { fg = c.yargui },
    BlinkCmpItemKindStruct = { fg = c.els },
    BlinkCmpItemKindEvent = { fg = groups.info },
    BlinkCmpItemKindOperator = { fg = groups.info },
    BlinkCmpItemKindTypeParameter = { fg = c.els },

    -- LazyDev integration
    BlinkCmpItemKindLazyDev = { fg = groups.ok, bold = styles.bold },

    -- Snippets
    BlinkCmpSnippetActive = { fg = c.base, bg = groups.hint },
    BlinkCmpSnippetPassive = { fg = c.base, bg = c.muted },

    -- Scrollbar
    BlinkCmpScrollbarThumb = { bg = c.muted },
    BlinkCmpScrollbarTrack = { bg = c.base },

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

