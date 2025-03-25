local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette
  local transparent_bg = config.transparent and "NONE" or nil

  return {
    -- Trouble window elements
    TroubleNormal = { fg = c.text, bg = transparent_bg or c.shadow },
    TroubleText = { fg = c.text },
    TroubleCount = { fg = c.bright, bg = c.overlay, style = { bold = true } },
    TroubleIndent = { fg = c.depth },
    TroubleLocation = { fg = c.subtle },
    TroubleFoldIcon = { fg = c.muted },
    TroubleSignError = { fg = c.anis },
    TroubleSignWarning = { fg = c.chatsalgan },
    TroubleSignInformation = { fg = c.nuur },
    TroubleSignHint = { fg = c.sarnai },
    TroubleSignOther = { fg = c.uvs },
    TroubleFile = { fg = c.text, style = { bold = true } },
    TroubleSource = { fg = c.muted, style = { italic = true } },
    TroubleLine = { fg = c.text, style = { underline = true } },
    TroubleCode = { fg = c.els },

    -- Preview elements
    TroublePreview = { bg = c.surface },

    -- Item types
    TroubleError = { fg = c.anis },
    TroubleWarning = { fg = c.chatsalgan },
    TroubleInformation = { fg = c.nuur },
    TroubleHint = { fg = c.sarnai },
    TroubleOther = { fg = c.uvs },

    -- Selected item
    TroubleTextError = { fg = c.anis },
    TroubleTextWarning = { fg = c.chatsalgan },
    TroubleTextInformation = { fg = c.nuur },
    TroubleTextHint = { fg = c.sarnai },
    TroubleTextOther = { fg = c.uvs },

    -- Selected item
    TroubleSelectedError = { fg = c.bright, bg = util.blend(c.anis, c.depth, 0.3) },
    TroubleSelectedWarning = { fg = c.bright, bg = util.blend(c.chatsalgan, c.depth, 0.3) },
    TroubleSelectedInformation = { fg = c.bright, bg = util.blend(c.nuur, c.depth, 0.3) },
    TroubleSelectedHint = { fg = c.bright, bg = util.blend(c.sarnai, c.depth, 0.3) },
    TroubleSelectedOther = { fg = c.bright, bg = util.blend(c.uvs, c.depth, 0.3) },
  }
end

return M

