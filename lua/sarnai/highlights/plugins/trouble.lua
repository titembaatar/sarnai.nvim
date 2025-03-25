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
    -- Trouble window elements
    TroubleNormal = { fg = c.text, bg = transparent_bg or c.base },
    TroubleText = { fg = c.text },
    TroubleCount = { fg = c.text, bg = c.overlay, bold = styles.bold },
    TroubleIndent = { fg = c.base },
    TroubleLocation = { fg = c.subtle },
    TroubleFoldIcon = { fg = c.muted },
    TroubleSignError = { fg = groups.error },
    TroubleSignWarning = { fg = groups.warn },
    TroubleSignInformation = { fg = groups.info },
    TroubleSignHint = { fg = groups.hint },
    TroubleSignOther = { fg = groups.ok },
    TroubleFile = { fg = c.text, bold = styles.bold },
    TroubleSource = { fg = c.muted, italic = styles.italic },
    TroubleLine = { fg = c.text, underline = styles.underline },
    TroubleCode = { fg = c.els },

    -- Preview elements
    TroublePreview = { bg = c.surface },

    -- Item types
    TroubleError = { fg = groups.error },
    TroubleWarning = { fg = groups.warn },
    TroubleInformation = { fg = groups.info },
    TroubleHint = { fg = groups.hint },
    TroubleOther = { fg = groups.ok },

    -- Text with diagnostics
    TroubleTextError = { fg = groups.error },
    TroubleTextWarning = { fg = groups.warn },
    TroubleTextInformation = { fg = groups.info },
    TroubleTextHint = { fg = groups.hint },
    TroubleTextOther = { fg = groups.ok },

    -- Selected item
    TroubleSelectedError = { fg = c.text, bg = util.blend(groups.error, c.base, 0.3) },
    TroubleSelectedWarning = { fg = c.text, bg = util.blend(groups.warn, c.base, 0.3) },
    TroubleSelectedInformation = { fg = c.text, bg = util.blend(groups.info, c.base, 0.3) },
    TroubleSelectedHint = { fg = c.text, bg = util.blend(groups.hint, c.base, 0.3) },
    TroubleSelectedOther = { fg = c.text, bg = util.blend(groups.ok, c.base, 0.3) },
  }
end

return M

