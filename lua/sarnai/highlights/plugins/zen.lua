local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette
  local transparent_bg = config.transparent and "NONE" or nil

  return {
    -- Zen Mode doesn't define custom highlights, but we can enhance the editor UI for zen mode
    ZenBg = { bg = transparent_bg or c.depth },

    -- These affect the text area in zen mode
    ZenNormal = { fg = c.bright, bg = transparent_bg or c.depth },
    ZenNormalNC = { fg = c.text, bg = transparent_bg or c.depth },
    ZenCursorLine = { bg = transparent_bg or c.shadow },

    -- These affect the UI elements in zen mode
    ZenStatusLine = { fg = c.faded, bg = transparent_bg or c.depth },
    ZenStatusLineNC = { fg = c.faded, bg = transparent_bg or c.depth },
    ZenWinBar = { fg = c.subtle, bg = transparent_bg or c.depth },
    ZenWinBarNC = { fg = c.faded, bg = transparent_bg or c.depth },
    ZenBorder = { fg = c.depth, bg = transparent_bg or c.depth },
  }
end

return M

