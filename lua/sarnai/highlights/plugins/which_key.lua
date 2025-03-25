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
    -- Main which-key popup
    WhichKey = { fg = groups.hint },
    WhichKeyGroup = { fg = c.yargui },
    WhichKeySeparator = { fg = c.muted },
    WhichKeyDesc = { fg = c.text },
    WhichKeyValue = { fg = c.subtle },
    WhichKeyFloat = { bg = transparent_bg or c.surface },
    WhichKeyBorder = { fg = groups.border, bg = transparent_bg or c.surface },

    -- Special keys
    WhichKeySpecial = { fg = groups.info },

    -- Operators
    WhichKeyOperator = { fg = groups.warn },

    -- Legend elements
    WhichKeyLegend1 = { fg = c.text },
    WhichKeyLegend2 = { fg = c.text },
    WhichKeyLegend3 = { fg = c.text },
  }
end

return M

