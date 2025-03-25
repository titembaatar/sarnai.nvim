local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette
  local transparent_bg = config.transparent and "NONE" or nil

  return {
    -- Main completion window
    BlinkCmpNormal = { fg = c.text, bg = transparent_bg or c.surface },
    BlinkCmpBorder = { fg = c.depth, bg = transparent_bg or c.surface },
    BlinkCmpFloatBorder = { link = "BlinkCmpBorder" },

    -- Completion items
    BlinkCmpItemAbbr = { fg = c.text },
    BlinkCmpItemAbbrDeprecated = { fg = c.muted, strikethrough = true },
    BlinkCmpItemAbbrMatch = { fg = c.sarnai, style = { bold = true } },
    BlinkCmpItemAbbrMatchFuzzy = { fg = c.sarnai, style = { bold = true } },

    -- Selection
    BlinkCmpItemSelected = { bg = c.overlay },
    BlinkCmpItemSelectedAbbr = { fg = c.bright, bg = c.overlay },

    -- Kind icons and text
    BlinkCmpItemKind = { fg = c.subtle },
    BlinkCmpItemMenu = { fg = c.faded, style = { italic = true } },

    -- Documentation window
    BlinkCmpDocNormal = { fg = c.text, bg = transparent_bg or c.shadow },
    BlinkCmpDocBorder = { fg = c.depth, bg = transparent_bg or c.shadow },

    -- Item kinds
    BlinkCmpItemKindText = { fg = c.text },
    BlinkCmpItemKindMethod = { fg = c.nuur },
    BlinkCmpItemKindFunction = { fg = c.nuur },
    BlinkCmpItemKindConstructor = { fg = c.nuur },
    BlinkCmpItemKindField = { fg = c.uvs },
    BlinkCmpItemKindVariable = { fg = c.mus },
    BlinkCmpItemKindClass = { fg = c.els },
    BlinkCmpItemKindInterface = { fg = c.els },
    BlinkCmpItemKindModule = { fg = c.els },
    BlinkCmpItemKindProperty = { fg = c.uvs },
    BlinkCmpItemKindUnit = { fg = c.text },
    BlinkCmpItemKindValue = { fg = c.yargui },
    BlinkCmpItemKindEnum = { fg = c.els },
    BlinkCmpItemKindKeyword = { fg = c.yargui },
    BlinkCmpItemKindSnippet = { fg = c.sarnai },
    BlinkCmpItemKindColor = { fg = c.sarnai },
    BlinkCmpItemKindFile = { fg = c.text },
    BlinkCmpItemKindReference = { fg = c.text },
    BlinkCmpItemKindFolder = { fg = c.text },
    BlinkCmpItemKindEnumMember = { fg = c.uvs },
    BlinkCmpItemKindConstant = { fg = c.yargui },
    BlinkCmpItemKindStruct = { fg = c.els },
    BlinkCmpItemKindEvent = { fg = c.nuur },
    BlinkCmpItemKindOperator = { fg = c.nuur },
    BlinkCmpItemKindTypeParameter = { fg = c.els },

    -- LazyDev integration
    BlinkCmpItemKindLazyDev = { fg = c.uvs, style = { bold = true } },

    -- Snippets
    BlinkCmpSnippetActive = { fg = c.base, bg = c.sarnai },
    BlinkCmpSnippetPassive = { fg = c.base, bg = c.muted },

    -- Scrollbar
    BlinkCmpScrollbarThumb = { bg = c.muted },
    BlinkCmpScrollbarTrack = { bg = c.depth },

    -- Fallback for nvim-cmp compatibility
    CmpItemAbbr = { link = "BlinkCmpItemAbbr" },
    CmpItemAbbrDeprecated = { link = "BlinkCmpItemAbbrDeprecated" },
    CmpItemAbbrMatch = { link = "BlinkCmpItemAbbrMatch" },
    CmpItemAbbrMatchFuzzy = { link = "BlinkCmpItemAbbrMatchFuzzy" },
    CmpItemMenu = { link = "BlinkCmpItemMenu" },
    CmpItemKindText = { link = "BlinkCmpItemKindText" },
    -- Link all the other CmpItemKind* highlights to their blink counterparts
  }
end

return M
