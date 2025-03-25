local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette
  local groups = util.get_groups(c.groups, c)

  local transparent_bg = config.transparent and "NONE" or nil

  return {
    ZenBg = { bg = transparent_bg or c.base },

    -- These affect the text area in zen mode
    ZenNormal = { fg = c.text, bg = transparent_bg or c.base },
    ZenNormalNC = { fg = c.text, bg = transparent_bg or c.base },
    ZenCursorLine = { bg = transparent_bg or c.surface },

    -- These affect the UI elements in zen mode
    ZenStatusLine = { fg = c.muted, bg = transparent_bg or c.base },
    ZenStatusLineNC = { fg = c.muted, bg = transparent_bg or c.base },
    ZenWinBar = { fg = c.subtle, bg = transparent_bg or c.base },
    ZenWinBarNC = { fg = c.muted, bg = transparent_bg or c.base },
    ZenBorder = { fg = groups.border, bg = transparent_bg or c.base },
  }
end

return M

