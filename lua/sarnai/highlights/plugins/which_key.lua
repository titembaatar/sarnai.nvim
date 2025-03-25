local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette
  local transparent_bg = config.transparent and "NONE" or nil

  return {
    -- Main which-key popup
    WhichKey = { fg = c.sarnai },
    WhichKeyGroup = { fg = c.yargui },
    WhichKeySeparator = { fg = c.muted },
    WhichKeyDesc = { fg = c.text },
    WhichKeyValue = { fg = c.subtle },
    WhichKeyFloat = { bg = transparent_bg or c.surface },
    WhichKeyBorder = { fg = c.muted, bg = transparent_bg or c.surface },

    -- Special keys
    WhichKeySpecial = { fg = c.nuur },

    -- Operators
    WhichKeyOperator = { fg = c.chatsalgan },

    -- Legend elements
    WhichKeyLegend1 = { fg = c.text },
    WhichKeyLegend2 = { fg = c.text },
    WhichKeyLegend3 = { fg = c.text },
  }
end

return M
