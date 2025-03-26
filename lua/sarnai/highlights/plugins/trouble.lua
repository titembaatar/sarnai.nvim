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
    -- Trouble window elements
    TroubleNormal = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg },
    TroubleText = { fg = c.ui.fg },
    TroubleCount = { fg = c.ui.fg, bg = c.palette.overlay, bold = styles.bold },
    TroubleIndent = { fg = c.ui.bg },
    TroubleLocation = { fg = c.palette.subtle },
    TroubleFoldIcon = { fg = c.palette.muted },
    TroubleSignError = { fg = c.semantic.error },
    TroubleSignWarning = { fg = c.semantic.warn },
    TroubleSignInformation = { fg = c.semantic.info },
    TroubleSignHint = { fg = c.semantic.hint },
    TroubleSignOther = { fg = c.semantic.ok },
    TroubleFile = { fg = c.ui.fg, bold = styles.bold },
    TroubleSource = { fg = c.palette.muted, italic = styles.italic },
    TroubleLine = { fg = c.ui.fg, underline = styles.underline },
    TroubleCode = { fg = c.palette.els },

    -- Preview elements
    TroublePreview = { bg = c.palette.surface },

    -- Item types
    TroubleError = { fg = c.semantic.error },
    TroubleWarning = { fg = c.semantic.warn },
    TroubleInformation = { fg = c.semantic.info },
    TroubleHint = { fg = c.semantic.hint },
    TroubleOther = { fg = c.semantic.ok },

    -- Text with diagnostics
    TroubleTextError = { fg = c.semantic.error },
    TroubleTextWarning = { fg = c.semantic.warn },
    TroubleTextInformation = { fg = c.semantic.info },
    TroubleTextHint = { fg = c.semantic.hint },
    TroubleTextOther = { fg = c.semantic.ok },

    -- Selected item
    TroubleSelectedError = { fg = c.ui.fg, bg = util.blend(c.semantic.error, c.ui.bg, 0.3) },
    TroubleSelectedWarning = { fg = c.ui.fg, bg = util.blend(c.semantic.warn, c.ui.bg, 0.3) },
    TroubleSelectedInformation = { fg = c.ui.fg, bg = util.blend(c.semantic.info, c.ui.bg, 0.3) },
    TroubleSelectedHint = { fg = c.ui.fg, bg = util.blend(c.semantic.hint, c.ui.bg, 0.3) },
    TroubleSelectedOther = { fg = c.ui.fg, bg = util.blend(c.semantic.ok, c.ui.bg, 0.3) },
  }
end

return M

