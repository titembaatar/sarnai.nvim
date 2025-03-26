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
    -- Main which-key popup
    WhichKey = { fg = c.semantic.hint },
    WhichKeyGroup = { fg = c.palette.yargui },
    WhichKeySeparator = { fg = c.palette.muted },
    WhichKeyDesc = { fg = c.ui.fg },
    WhichKeyValue = { fg = c.palette.subtle },
    WhichKeyFloat = { bg = transparent_bg or c.palette.surface },
    WhichKeyBorder = { fg = c.ui.border, bg = transparent_bg or c.palette.surface },

    -- Special keys
    WhichKeySpecial = { fg = c.semantic.info },

    -- Operators
    WhichKeyOperator = { fg = c.semantic.warn },

    -- Legend elements
    WhichKeyLegend1 = { fg = c.ui.fg },
    WhichKeyLegend2 = { fg = c.ui.fg },
    WhichKeyLegend3 = { fg = c.ui.fg },
  }
end

return M

