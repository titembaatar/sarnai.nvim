local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette

  local transparent_bg = config.transparent and "NONE" or nil

  return {
    ZenBg = { bg = transparent_bg or c.ui.bg },

    -- These affect the text area in zen mode
    ZenNormal = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg },
    ZenNormalNC = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg },
    ZenCursorLine = { bg = transparent_bg or c.palette.surface },

    -- These affect the UI elements in zen mode
    ZenStatusLine = { fg = c.palette.muted, bg = transparent_bg or c.ui.bg },
    ZenStatusLineNC = { fg = c.palette.muted, bg = transparent_bg or c.ui.bg },
    ZenWinBar = { fg = c.palette.subtle, bg = transparent_bg or c.ui.bg },
    ZenWinBarNC = { fg = c.palette.muted, bg = transparent_bg or c.ui.bg },
    ZenBorder = { fg = c.ui.border, bg = transparent_bg or c.ui.bg },
  }
end

return M

